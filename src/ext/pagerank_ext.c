#include "postgres.h"
#include "funcapi.h"
#include "jit/llvmjit.h"
#include "executor/spi.h"
#include "executor/execExpr.h"
#include "stdint.h"
#include "utils/builtins.h"
#include "parser/parser.h"
#include "nodes/nodes.h"
#include "catalog/pg_type.h"
#include "access/htup_details.h" 
#include "nodes/print.h"
#include "portability/instr_time.h"
#include "utils/lsyscache.h"
#include "utils/hsearch.h"
#include "common/config_info.h"
#include <math.h>
#include <pthread.h>
#include "miscadmin.h"

extern TupleDesc pagerank_threads_record_type(List *args)
{
    LambdaExpr *lambdaSrc = (LambdaExpr *) list_nth(args, 1);
    TupleDesc outDesc;
    outDesc = CreateTemplateTupleDesc(2, false);

    TupleDescInitEntry(outDesc, 1, "node",
               lambdaSrc->rettype, lambdaSrc->rettypmod, 0);
    TupleDescInitEntry(outDesc, 2, "pagerank",
               FLOAT8OID, -1, 0);

    return outDesc;
}


PG_MODULE_MAGIC;
PG_FUNCTION_INFO_V1_RECTYPE(pagerank, pagerank_threads_record_type);
PG_FUNCTION_INFO_V1_RECTYPE(pagerank_threads, pagerank_threads_record_type);


struct PageRankNode
{
    double pageRank1;
    double pageRank2;
    Datum origKey;
    int aliasKey;
    int numLinks;
    int csrOffset;
};

struct PageRankHash
{
    Datum origKey;
    struct PageRankNode *node;
};

struct PageRankWorkerArgs
{
    struct PageRankNode *prData;
    int count;
    int start;
    int totalCount;
    bool even;
    double dampingFactor;
    double delta;
    int64 *csrValues;
    int64 *csrOffsets;
};


struct Edge 
{
    int64 src;
    int64 dst;
};

void *pagerank_worker(void *arg)
{
    struct PageRankWorkerArgs *args = (struct PageRankWorkerArgs *) arg;
    struct PageRankNode *it;
    args->delta = 0;

    for(it = args->prData + args->start; it < args->prData + args->start + args->count; it++)
    {
        double prNew = (1.0 - args->dampingFactor) / args->totalCount;
        for (int in = 0; in < it->numLinks; in++)
        {
            struct PageRankNode *inNode = args->prData
                + args->csrValues[args->csrOffsets[it->aliasKey] + in];

            prNew += args->dampingFactor * (args->even ? inNode->pageRank1 : inNode->pageRank2) / inNode->numLinks;

        }

        if (args->even)
        {
            args->delta = fmax(fabs(it->pageRank1 - prNew), args->delta);
            it->pageRank2 = prNew;
        }
        else
        {
            args->delta = fmax(fabs(it->pageRank2 - prNew), args->delta);
            it->pageRank1 = prNew;
        }

    }

    return (void *) 0;
}

Datum
pagerank_internal(PG_FUNCTION_ARGS, int nthreads)
{
    MemoryContext oldcontext;
    ParamListInfo paramListInfo;
    FuncCallContext  *funcctx;
    MemoryContext per_query_ctx;
    int tupleCount;
    TupleDesc outDesc = NULL;
    HASHCTL ctl;
    HTAB *mapping;
    Datum *keys;
    bool isnull;
    double dampingFactor;
    double threshold;
    int iterations;
    LambdaExpr* lambdaSrc = PG_GETARG_LAMBDA(1);
    LambdaExpr* lambdaDst = PG_GETARG_LAMBDA(2);
    dampingFactor = PG_GETARG_FLOAT8(3);
    threshold = PG_GETARG_FLOAT8(4);
    iterations = PG_GETARG_INT32(5);
    HeapTuple   tuple;
    struct PageRankNode* prData;
    int64 *csrValues;
    int64 *csrOffsets;
    struct PageRankHash* hashLookup;
    struct PageRankNode* it;
    int dataCursor = 0, csrCursor = 0;
    bool replIsNull[2];
    Datum replVal[2];
    pthread_t workers[nthreads];
    struct PageRankWorkerArgs *workerArgs = (struct PageRankWorkerArgs *) 
    palloc0(nthreads * sizeof(struct PageRankWorkerArgs));
    instr_time  starttime;
    instr_time  endtime;
    instr_time  ctr;
    struct Edge *edges;

    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;

    if (rsinfo == NULL || !IsA(rsinfo, ReturnSetInfo))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("set-valued function called in context that cannot accept a set")));
    if (!(rsinfo->allowedModes & SFRM_Materialize))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("materialize mode required, but it is not " \
                        "allowed in this context")));

    per_query_ctx = rsinfo->econtext->ecxt_per_query_memory;

    if (lambdaSrc->rettype != lambdaDst->rettype)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("src and dst lambda return types must be the same")));
    }
    else if (lambdaSrc->rettypmod != -1 || lambdaDst->rettypmod != -1)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("Only base types can be used as keys.")));
    }

    oldcontext = MemoryContextSwitchTo(per_query_ctx);
    TupleTableSlot *slot = MakeTupleTableSlot(NULL);
    TypedTuplestore *tts = (TypedTuplestore *) PG_GETARG_POINTER(0);
    Tuplestorestate *tsIn = tts->tuplestorestate;
    Tuplestorestate *tsOut = tuplestore_begin_heap(true, false, work_mem);
    tupleCount = tuplestore_tuple_count(tsIn);
    tuplestore_rescan(tsIn);

    outDesc = CreateTemplateTupleDesc(2, false);

    TupleDescInitEntry(outDesc, 1, "node",
               lambdaSrc->rettype, lambdaSrc->rettypmod, 0);
    TupleDescInitEntry(outDesc, 2, "pagerank",
               FLOAT8OID, -1, 0);

    ctl.keysize = get_typlen(lambdaSrc->rettype);
    ctl.entrysize = sizeof(struct PageRankHash);

    mapping = hash_create("pagerank_mapping",
       tupleCount * 2,
       &ctl,
       HASH_ELEM | HASH_BLOBS );

    prData = (struct PageRankNode *) palloc0(tupleCount * 2 * sizeof(struct PageRankNode));
    edges = (struct Edge *) palloc0(tupleCount * sizeof(struct Edge));

    int x = 0;

    while (tuplestore_gettupleslot(tsIn, true, false, slot))
    {     
        bool found;
        HeapTupleHeader hdr = slot->tts_tuple->t_data;
        PG_LAMBDA_SETARG(lambdaSrc, 0, HeapTupleHeaderGetDatum(hdr));
        PG_LAMBDA_SETARG(lambdaDst, 0, HeapTupleHeaderGetDatum(hdr));
        Datum srcId = PG_LAMBDA_EVAL(lambdaSrc, 0, &isnull);
        Datum dstId = PG_LAMBDA_EVAL(lambdaDst, 1, &isnull);

        struct PageRankHash hash;
        hash.origKey = srcId;
        hashLookup = (struct PageRankHash *) hash_search(mapping, &srcId, HASH_ENTER, &found);

        if (!found)
        {
            hashLookup->node = prData + dataCursor;
            hashLookup->node->origKey = srcId;
            hashLookup->node->numLinks = 0;
            hashLookup->node->csrOffset = -1;
            hashLookup->node->aliasKey = dataCursor;
            dataCursor++;
        }

        hashLookup->origKey = srcId;
        hashLookup->node->numLinks++;

        (edges + x)->src = hashLookup->node->aliasKey;

        hash.origKey = dstId;
        hashLookup = (struct PageRankHash *) hash_search(mapping, &dstId, HASH_ENTER, &found);

        if (!found)
        {
            hashLookup->node = prData + dataCursor;   
            hashLookup->node->numLinks = 0;
            hashLookup->node->origKey = dstId; 
            hashLookup->node->csrOffset = -1;      
            hashLookup->node->aliasKey = dataCursor;   
            dataCursor++;
        }

        hashLookup->origKey = dstId;
        (edges + x)->dst = hashLookup->node->aliasKey;
        hashLookup->node->numLinks++;


        x++;
    }

    csrOffsets = (int64 *) palloc0(dataCursor * sizeof(int64));
    csrValues = (int64 *) palloc0(tupleCount * 2 * sizeof(int64));

    //tuplestore_end(tsIn);


    INSTR_TIME_SET_CURRENT(starttime);

    double invc = 1.0 / dataCursor;

    for(int x = 0; x < tupleCount; x++)
    {     
        int64 srcAlias;
        int64 srcId = (edges + x)->src;
        int64 dstId = (edges + x)->dst;


        int dstOffset;
        int dstAlias;
        it = (struct PageRankNode *) (prData + srcId);

        if (it->csrOffset == -1) 
        {
            it->csrOffset = 0;
            it->pageRank1 = invc;
            csrOffsets[srcId] = csrCursor;
            csrCursor += it->numLinks;
        }


        csrValues[csrOffsets[srcId] + it->csrOffset++] = dstId;

        it = (struct PageRankNode *) (prData + dstId);

        if (it->csrOffset == -1) 
        {
            it->csrOffset = 0;
            it->pageRank1 = invc;
            csrOffsets[dstId] = csrCursor;
            csrCursor += it->numLinks;
        }

        csrValues[csrOffsets[dstId] + it->csrOffset++] = srcId;
    }


    int batchSize = ceil(dataCursor / nthreads);


    for (int j = 0; j < nthreads; j++)
    {
        workerArgs[j].dampingFactor = dampingFactor;
        workerArgs[j].count = (j == nthreads - 1 && nthreads > 1) ? (dataCursor - batchSize * j) : batchSize;
        workerArgs[j].totalCount = dataCursor;
        workerArgs[j].prData = prData;
        workerArgs[j].start = j * batchSize;
        workerArgs[j].csrOffsets = csrOffsets;
        workerArgs[j].csrValues = csrValues;
    }

    for(int i = 0; i < iterations; i++)
    {
        for (int j = 0; j < nthreads; j++)
        {
            workerArgs[j].even = i % 2 == 0;
            pthread_create(&workers[j], NULL, &pagerank_worker, (void *) (workerArgs + j));
        }

        double delta = 0;

        for (int j = 0; j < nthreads; j++)
        {
            pthread_join(workers[j], NULL);
            delta += workerArgs[j].delta;
        }

        if (delta < threshold)
        {
            break;
        }
    }


    replIsNull[0] = false;
    replIsNull[1] = false;

    for(it = prData; it < prData + dataCursor; it++)
    {
        replVal[0] = it->origKey;
        replVal[1] = Float8GetDatum(it->pageRank1);
        tuple = heap_form_tuple(outDesc, replVal, replIsNull);
        tuplestore_puttuple(tsOut, tuple);
    }
        

    rsinfo->returnMode = SFRM_Materialize;
    rsinfo->setResult = tsOut;
    rsinfo->setDesc = outDesc;

    MemoryContextSwitchTo(oldcontext);

    return (Datum) 0;
}



Datum
pagerank(PG_FUNCTION_ARGS)
{
    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    LambdaExpr* lambdaSrc = PG_GETARG_LAMBDA(1);
    LambdaExpr* lambdaDst = PG_GETARG_LAMBDA(2);

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);

    ExecInitLambdaExpr((Node *) lambdaSrc, false);
    ExecInitLambdaExpr((Node *) lambdaDst, false);
    jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return pagerank_internal(fcinfo, 16);
}


Datum
pagerank_threads(PG_FUNCTION_ARGS)
{
    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    LambdaExpr* lambdaSrc = PG_GETARG_LAMBDA(1);
    LambdaExpr* lambdaDst = PG_GETARG_LAMBDA(2);

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);

    ExecInitLambdaExpr((Node *) lambdaSrc, false);
    ExecInitLambdaExpr((Node *) lambdaDst, false);
    jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return pagerank_internal(fcinfo, PG_GETARG_INT32(6));
}


PG_FUNCTION_INFO_V1(annotate_query);

Datum
annotate_query(PG_FUNCTION_ARGS)
{
    text    *sql_t = PG_GETARG_TEXT_P(0);
    bool    pretty_b = PG_GETARG_BOOL(1);
    text    *out_t;
    char    *sql, *out;
    List    *tree;

    sql = text_to_cstring(sql_t);
    tree = raw_parser(sql);

    out = nodeToString(tree);

    out_t = cstring_to_text(out);
    PG_RETURN_TEXT_P(out_t);
}