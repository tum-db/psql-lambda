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



extern TupleDesc kmeans_threads_record_type(List *args)
{
    LambdaExpr *lambda = (LambdaExpr *) list_nth(args, 2);
    TupleDesc nodeDesc = (TupleDesc) list_nth(lambda->argtypes, 1);
    TupleDesc outDesc;
    outDesc = CreateTemplateTupleDesc(nodeDesc->natts + 1, false);

    for (int i = 0; i < nodeDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), nodeDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, nodeDesc->natts + 1, "cluster",
               INT4OID, -1, 0);

    return outDesc;
}


PG_MODULE_MAGIC;
PG_FUNCTION_INFO_V1_RECTYPE(kmeans, kmeans_threads_record_type);
PG_FUNCTION_INFO_V1_RECTYPE(kmeans_threads, kmeans_threads_record_type);



struct KMeansNode
{
    float8 x;
    float8 y;
    struct KMeansCentroid *centroid;
};

struct KMeansCentroid
{
    int id;
    float8 x;
    float8 y;
    float8 avgXAgg;
    float8 avgYAgg;
    int numAssignments;
};


struct KMeansWorkerArgs
{
    int threadid;
    struct KMeansNode *nodeStates;
    struct KMeansCentroid *clusterStates;
    TupleDesc nodeDesc;
    TupleDesc clusterDesc;
    LambdaExpr *distFunc;
    Datum **lambdaArgs;
    Datum *clusters;
    Datum *tuples;
    int count;
    int offset;
    int clusterCount;
    bool changesMade;
    float8 *avgXAgg;
    float8 *avgYAgg;
    int *clusterAssignCount;
};

void *kmeans_worker(void *arg)
{
    struct KMeansWorkerArgs *args = (struct KMeansWorkerArgs *) arg;
    struct KMeansCentroid *cluster;

    for(int x = args->offset; x < args->offset + args->count; x++)
    {
        int c = 0;
        bool isnull;
        float8 minDist = 0.0;
        struct KMeansCentroid *clusterMin = NULL;
        struct KMeansNode *node = args->nodeStates + x;

        args->lambdaArgs[1] = args->tuples + x * args->nodeDesc->natts;
        clusterMin = NULL;

        for(cluster = args->clusterStates; cluster < args->clusterStates + args->clusterCount; cluster++)
        {      
            args->lambdaArgs[0] = args->clusters + c * args->clusterDesc->natts;           
            /*float8 dist = DatumGetFloat8(castNode(ExprState,
                args->distFunc->exprstate)->evalfunc_simple(args->lambdaArgs));*/
            //float8 dist = pow(node->x - cluster->x, 2) + pow(node->y - cluster->y, 2);
            float8 dist = DatumGetFloat8(PG_SIMPLE_LAMBDA_INJECT(args->lambdaArgs, 0));
            
            if (clusterMin == NULL || isnan(minDist) && !isnan(dist) || !isnan(dist) && minDist > dist)
            {
                minDist = dist;
                clusterMin = cluster;
            }

            c++;
        }

        args->changesMade |= node->centroid != clusterMin; 
        node->centroid = clusterMin;

        args->clusterAssignCount[clusterMin->id]++;
        args->avgXAgg[clusterMin->id] += node->x;
        args->avgYAgg[clusterMin->id] += node->y;
    }

    return (void *) 0;
}


Datum
kmeans_internal2(PG_FUNCTION_ARGS, int nthreads, void* (*worker_func) (void *arg))
{
    MemoryContext oldcontext;
    ParamListInfo paramListInfo;
    FuncCallContext  *funcctx;
    MemoryContext per_query_ctx;
    int clusterCount = 0, tupleCount = 0;
    TupleDesc outDesc = NULL;
    HASHCTL ctl;
    HTAB *mapping;
    Datum *clusters, *tuples;
    Datum **lambdaArgs = (Datum **) palloc(2 * sizeof(Datum *));    
    LambdaExpr* lambda = PG_GETARG_LAMBDA(2);
    bool isnull;
    double dampingFactor;
    double threshold;
    int maxit = fcinfo->nargs == 6 ? PG_GETARG_INT32(5) : 500;
    int iterations;
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
    oldcontext = MemoryContextSwitchTo(per_query_ctx);

    //llvm_prepare_simple_expression(castNode(ExprState, lambda->exprstate));

    HeapTuple   tuple;
    struct KMeansCentroid *clusterStates;
    struct KMeansNode *nodeStates;
    bool *nullvals;
    pthread_t workers[nthreads];
    TupleDesc clusterDesc = (TupleDesc) list_nth(lambda->argtypes, 0);
    TupleDesc nodeDesc = (TupleDesc) list_nth(lambda->argtypes, 1);

    struct KMeansWorkerArgs *workerArgs = (struct KMeansWorkerArgs *) 
    palloc0(nthreads * sizeof(struct KMeansWorkerArgs));
    instr_time  starttime;
    instr_time  endtime;
    instr_time  ctr;

    TupleTableSlot *slot = MakeTupleTableSlot(NULL);
    Tuplestorestate *ttsClusters = ((TypedTuplestore *) PG_GETARG_POINTER(0))->tuplestorestate;
    Tuplestorestate *ttsPoints = ((TypedTuplestore *) PG_GETARG_POINTER(1))->tuplestorestate;

    /*PlanState *planStateC = (PlanState *) PG_GETARG_POINTER(0);
    PlanState *planStateN = (PlanState *) PG_GETARG_POINTER(1);*/

    Tuplestorestate *tsOut = tuplestore_begin_heap(true, false, work_mem);
    clusterCount = tuplestore_tuple_count(ttsClusters);
    tupleCount = tuplestore_tuple_count(ttsPoints);

    outDesc = CreateTemplateTupleDesc(nodeDesc->natts + 1, false);

    for (int i = 0; i < nodeDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), nodeDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, nodeDesc->natts + 1, "cluster",
               INT4OID, -1, 0);

    clusters = (Datum *) palloc0(clusterCount * clusterDesc->natts * sizeof(Datum));
    tuples = (Datum *) palloc0(tupleCount * nodeDesc->natts * sizeof(Datum));
    nullvals = (bool *) palloc0(Max(nodeDesc->natts, clusterDesc->natts) * sizeof(bool));
    clusterStates = (struct KMeansCentroid *) palloc0(clusterCount * sizeof(struct KMeansCentroid));
    nodeStates = (struct KMeansNode *) palloc0(tupleCount * sizeof(struct KMeansNode));
    castNode(ExprState, lambda->exprstate)->tupleDatumArray = true;

    int x = 0;

    while (tuplestore_gettupleslot(ttsClusters, true, false, slot))
    {     
        heap_deform_tuple(slot->tts_tuple, clusterDesc, clusters + x * clusterDesc->natts, nullvals);
        
        (clusterStates + x)->x = DatumGetFloat8(clusters[x * clusterDesc->natts]);
        (clusterStates + x)->y = DatumGetFloat8(clusters[x * clusterDesc->natts + 1]);
        (clusterStates + x)->id = x;

        x++;
    }

    x = 0;

    while (tuplestore_gettupleslot(ttsPoints, true, false, slot))
    {     
        heap_deform_tuple(slot->tts_tuple, nodeDesc, tuples + x * nodeDesc->natts, nullvals);
       
        (nodeStates + x)->x = DatumGetFloat8(tuples[x * nodeDesc->natts]);
        (nodeStates + x)->y = DatumGetFloat8(tuples[x * nodeDesc->natts + 1]);

        x++;
    }

    float8 clusterDiff;

    int batchSize = ceil(tupleCount / nthreads);
    bool changesMade = false;

    for (int j = 0; j < nthreads; j++)
    {
        workerArgs[j].threadid = j;
        workerArgs[j].nodeStates = nodeStates;
        workerArgs[j].clusterStates = clusterStates;
        workerArgs[j].nodeDesc = nodeDesc;
        workerArgs[j].clusterDesc = clusterDesc;
        workerArgs[j].distFunc = lambda;
        workerArgs[j].lambdaArgs = (Datum **) palloc(2 * sizeof(Datum *));
        workerArgs[j].clusters = clusters;
        workerArgs[j].tuples = tuples;
        workerArgs[j].count = (j == nthreads - 1 && nthreads > 1)
            ? (tupleCount - j * batchSize) : batchSize;
        workerArgs[j].offset = j * batchSize;
        workerArgs[j].clusterCount = clusterCount;
        workerArgs[j].avgXAgg = (float8 *) palloc(clusterCount * sizeof(float8));
        workerArgs[j].avgYAgg = (float8 *) palloc(clusterCount * sizeof(float8));
        workerArgs[j].clusterAssignCount = (int *) palloc(clusterCount * sizeof(int));
    }

    do
    {
        struct KMeansCentroid *cluster;
        clusterDiff = 0.0;
        changesMade = false;

        for (int j = 0; j < nthreads; j++)
        {
            MemSet(workerArgs[j].avgXAgg, 0, clusterCount * sizeof(float8));
            MemSet(workerArgs[j].avgYAgg, 0, clusterCount * sizeof(float8));
            MemSet(workerArgs[j].clusterAssignCount, 0, clusterCount * sizeof(int));
            
            workerArgs[j].changesMade = false;
            pthread_create(&workers[j], NULL, worker_func, (void *) (workerArgs + j));
        }

        for (int j = 0; j < nthreads; j++)
        {
            pthread_join(workers[j], NULL);
        }

        for(cluster = clusterStates; cluster < clusterStates + clusterCount; cluster++)
        {
            for (int j = 0; j < nthreads; j++)
            {
                cluster->numAssignments += workerArgs[j].clusterAssignCount[cluster->id];
                cluster->avgXAgg += workerArgs[j].avgXAgg[cluster->id];
                cluster->avgYAgg += workerArgs[j].avgYAgg[cluster->id];
                changesMade |= workerArgs[j].changesMade;
            }

            if (cluster->numAssignments > 0)
            {
                float8 newX = cluster->avgXAgg / cluster->numAssignments;
                float8 newY = cluster->avgYAgg / cluster->numAssignments;

                clusterDiff += fabs(newX - cluster->x) + fabs(newY - cluster->y);

                cluster->x = newX;
                cluster->y = newY;

                clusters[cluster->id * clusterDesc->natts] = Float8GetDatum(newX);
                clusters[cluster->id * clusterDesc->natts + 1] = Float8GetDatum(newY);
            }
            
            cluster->numAssignments = 0;
            cluster->avgXAgg = 0;
            cluster->avgYAgg = 0;
        }
    } while (changesMade && --maxit > 0);
        

    bool replIsNull[outDesc->natts];
    Datum replVal[outDesc->natts];

    for(int i = 0; i < outDesc->natts; i++)
    {
        replIsNull[i] = false;
    }


    Datum *it;
    int i = 0;

    for(it = tuples; it < tuples + tupleCount * nodeDesc->natts; it += nodeDesc->natts)
    {
        memcpy(&replVal, it, nodeDesc->natts * sizeof(Datum));
        replVal[outDesc->natts - 1] = nodeStates[i].centroid->id;
        tuple = heap_form_tuple(outDesc, replVal, replIsNull);
        tuplestore_puttuple(tsOut, tuple);
        i++;
    }
        

    rsinfo->returnMode = SFRM_Materialize;
    rsinfo->setResult = tsOut;
    rsinfo->setDesc = outDesc;

    MemoryContextSwitchTo(oldcontext);
    return (Datum) 0;
}

Datum
kmeans_internal(PG_FUNCTION_ARGS, int nthreads, void* (*worker_func) (void *arg))
{
    MemoryContext oldcontext;
    ParamListInfo paramListInfo;
    FuncCallContext  *funcctx;
    MemoryContext per_query_ctx;
    int clusterCount = 0, tupleCount = 0;
    TupleDesc outDesc = NULL;
    HASHCTL ctl;
    HTAB *mapping;
    Datum *clusters, *tuples;
    Datum **lambdaArgs = (Datum **) palloc(2 * sizeof(Datum *));    
    LambdaExpr* lambda = PG_GETARG_LAMBDA(2);
    bool isnull;
    double dampingFactor;
    double threshold;
    int maxit = fcinfo->nargs == 6 ? PG_GETARG_INT32(5) : 500;
    int iterations;
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
    oldcontext = MemoryContextSwitchTo(per_query_ctx);

    //llvm_prepare_simple_expression(castNode(ExprState, lambda->exprstate));

    HeapTuple   tuple;
    struct KMeansCentroid *clusterStates;
    struct KMeansNode *nodeStates;
    bool *nullvals;
    pthread_t workers[nthreads];
    TupleDesc clusterDesc = (TupleDesc) list_nth(lambda->argtypes, 0);
    TupleDesc nodeDesc = (TupleDesc) list_nth(lambda->argtypes, 1);

    struct KMeansWorkerArgs *workerArgs = (struct KMeansWorkerArgs *) 
    palloc0(nthreads * sizeof(struct KMeansWorkerArgs));
    instr_time  starttime;
    instr_time  endtime;
    instr_time  ctr;

    TupleTableSlot *slot = MakeTupleTableSlot(NULL);
    /*Tuplestorestate *ttsClusters = ((TypedTuplestore *) PG_GETARG_POINTER(0))->tuplestorestate;
    Tuplestorestate *ttsPoints = ((TypedTuplestore *) PG_GETARG_POINTER(1))->tuplestorestate;*/

    PlanState *planStateC = (PlanState *) PG_GETARG_POINTER(0);
    PlanState *planStateN = (PlanState *) PG_GETARG_POINTER(1);

    Tuplestorestate *tsOut = tuplestore_begin_heap(true, false, work_mem);
    clusterCount = /*tuplestore_tuple_count(ttsClusters)*/5;
    tupleCount = /*tuplestore_tuple_count(ttsPoints)*/20000000;

    outDesc = CreateTemplateTupleDesc(nodeDesc->natts + 1, false);

    for (int i = 0; i < nodeDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), nodeDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, nodeDesc->natts + 1, "cluster",
               INT4OID, -1, 0);

    clusters = (Datum *) palloc0(clusterCount * clusterDesc->natts * sizeof(Datum));
    tuples = (Datum *) palloc0(tupleCount * nodeDesc->natts * sizeof(Datum));
    nullvals = (bool *) palloc0(Max(nodeDesc->natts, clusterDesc->natts) * sizeof(bool));
    clusterStates = (struct KMeansCentroid *) palloc0(clusterCount * sizeof(struct KMeansCentroid));
    nodeStates = (struct KMeansNode *) palloc0(tupleCount * sizeof(struct KMeansNode));
    castNode(ExprState, lambda->exprstate)->tupleDatumArray = true;

    int x = 0;



    for (slot = ExecProcNode(planStateC); !TupIsNull(slot); slot = ExecProcNode(planStateC))
    {
        if (slot->tts_mintuple)
        {
            heap_deform_tuple(slot->tts_tuple, clusterDesc, clusters + x * clusterDesc->natts, nullvals);
        }
        else
        {
            slot_getallattrs(slot);
            memcpy(clusters + x * clusterDesc->natts, slot->tts_values, clusterDesc->natts * sizeof(Datum));
        }

        (clusterStates + x)->x = DatumGetFloat8(clusters[x * clusterDesc->natts]);
        (clusterStates + x)->y = DatumGetFloat8(clusters[x * clusterDesc->natts + 1]);
        (clusterStates + x)->id = x;

        x++;
    }

    x = 0;
    
    clock_t start = clock();
    for (slot = ExecProcNode(planStateN); !TupIsNull(slot); slot = ExecProcNode(planStateN))
    {     
        if (slot->tts_mintuple)
        {
            heap_deform_tuple(slot->tts_tuple, nodeDesc, tuples + x * nodeDesc->natts, nullvals);
        }
        else
        {
            slot_getallattrs(slot);
            memcpy(tuples + x * nodeDesc->natts, slot->tts_values, nodeDesc->natts * sizeof(Datum));
        }


        (nodeStates + x)->x = DatumGetFloat8(tuples[x * nodeDesc->natts]);
        (nodeStates + x)->y = DatumGetFloat8(tuples[x * nodeDesc->natts + 1]);

        x++;
    }

    clock_t stop = clock() - start;
    printf("Time to read: %lu\n", stop);
    float8 clusterDiff;

    int batchSize = ceil(tupleCount / nthreads);
    bool changesMade = false;

    for (int j = 0; j < nthreads; j++)
    {
        workerArgs[j].threadid = j;
        workerArgs[j].nodeStates = nodeStates;
        workerArgs[j].clusterStates = clusterStates;
        workerArgs[j].nodeDesc = nodeDesc;
        workerArgs[j].clusterDesc = clusterDesc;
        workerArgs[j].distFunc = lambda;
        workerArgs[j].lambdaArgs = (Datum **) palloc(2 * sizeof(Datum *));
        workerArgs[j].clusters = clusters;
        workerArgs[j].tuples = tuples;
        workerArgs[j].count = (j == nthreads - 1 && nthreads > 1)
            ? (tupleCount - j * batchSize) : batchSize;
        workerArgs[j].offset = j * batchSize;
        workerArgs[j].clusterCount = clusterCount;
        workerArgs[j].avgXAgg = (float8 *) palloc(clusterCount * sizeof(float8));
        workerArgs[j].avgYAgg = (float8 *) palloc(clusterCount * sizeof(float8));
        workerArgs[j].clusterAssignCount = (int *) palloc(clusterCount * sizeof(int));
    }



    do
    {
        struct KMeansCentroid *cluster;
        clusterDiff = 0.0;
        changesMade = false;

        for (int j = 0; j < nthreads; j++)
        {
            MemSet(workerArgs[j].avgXAgg, 0, clusterCount * sizeof(float8));
            MemSet(workerArgs[j].avgYAgg, 0, clusterCount * sizeof(float8));
            MemSet(workerArgs[j].clusterAssignCount, 0, clusterCount * sizeof(int));
            
            workerArgs[j].changesMade = false;
            pthread_create(&workers[j], NULL, worker_func, (void *) (workerArgs + j));
        }

        for (int j = 0; j < nthreads; j++)
        {
            pthread_join(workers[j], NULL);
        }

        for(cluster = clusterStates; cluster < clusterStates + clusterCount; cluster++)
        {
            for (int j = 0; j < nthreads; j++)
            {
                cluster->numAssignments += workerArgs[j].clusterAssignCount[cluster->id];
                cluster->avgXAgg += workerArgs[j].avgXAgg[cluster->id];
                cluster->avgYAgg += workerArgs[j].avgYAgg[cluster->id];
                changesMade |= workerArgs[j].changesMade;
            }

            if (cluster->numAssignments > 0)
            {
                float8 newX = cluster->avgXAgg / cluster->numAssignments;
                float8 newY = cluster->avgYAgg / cluster->numAssignments;

                clusterDiff += fabs(newX - cluster->x) + fabs(newY - cluster->y);

                cluster->x = newX;
                cluster->y = newY;

                clusters[cluster->id * clusterDesc->natts] = Float8GetDatum(newX);
                clusters[cluster->id * clusterDesc->natts + 1] = Float8GetDatum(newY);
            }
            
            cluster->numAssignments = 0;
            cluster->avgXAgg = 0;
            cluster->avgYAgg = 0;
        }
    } while (changesMade && --maxit > 0);
        

    bool replIsNull[outDesc->natts];
    Datum replVal[outDesc->natts];

    for(int i = 0; i < outDesc->natts; i++)
    {
        replIsNull[i] = false;
    }

    printf("Func end\n");

    Datum *it;
    int i = 0;

    for(it = tuples; it < tuples + tupleCount * nodeDesc->natts; it += nodeDesc->natts)
    {
        memcpy(&replVal, it, nodeDesc->natts * sizeof(Datum));
        replVal[outDesc->natts - 1] = nodeStates[i].centroid->id;
        tuple = heap_form_tuple(outDesc, replVal, replIsNull);
        tuplestore_puttuple(tsOut, tuple);
        i++;
    }
        

    rsinfo->returnMode = SFRM_Materialize;
    rsinfo->setResult = tsOut;
    rsinfo->setDesc = outDesc;

    MemoryContextSwitchTo(oldcontext);
    return (Datum) 0;
}



Datum
kmeans(PG_FUNCTION_ARGS)
{
    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LambdaExpr* lambda = PG_GETARG_LAMBDA(2);
    LLVMJitContext* jitContext;

    if (lambda->rettype != FLOAT8OID)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must return a float8 value.")));
    }
    else if (list_length(lambda->argtypes) != 2)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must take exactly 2 arguments.")));
    }

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);

    ExecInitLambdaExpr((Node *) lambda, true);
    jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    Datum (*compiled_func)(FunctionCallInfo);

    compiled_func = llvm_prepare_lambda_tablefunc(jitContext, "ext/kmeans_ext.bc", "kmeans_worker", 1);
    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return kmeans_internal2(fcinfo, 16, (void* (*) (void *arg)) compiled_func);
}

Datum
kmeans_threads(PG_FUNCTION_ARGS)
{
    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LambdaExpr* lambda = PG_GETARG_LAMBDA(2);
    int nthreads = PG_GETARG_INT32(4);
    LLVMJitContext* jitContext;

    if (lambda->rettype != FLOAT8OID)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must return a float8 value.")));
    }
    else if (list_length(lambda->argtypes) != 2)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must take exactly 2 arguments.")));
    }

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);

    ExecInitLambdaExpr((Node *) lambda, true);
    jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    Datum (*compiled_func)(FunctionCallInfo);

    compiled_func = llvm_prepare_lambda_tablefunc(jitContext, "ext/kmeans_ext.bc", "kmeans_worker", 1);
    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return kmeans_internal2(fcinfo, nthreads, (void* (*) (void *arg)) compiled_func);
}