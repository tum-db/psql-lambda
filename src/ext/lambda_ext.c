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


extern TupleDesc label_record_type(List *args)
{
    LambdaExpr *lambda = (LambdaExpr *) list_nth(args, 1);
    TupleDesc inDesc = (TupleDesc) list_nth(lambda->argtypes, 0);
    TupleDesc outDesc;
    outDesc = CreateTemplateTupleDesc(inDesc->natts + 1, false);

    for (int i = 0; i < inDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), inDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, (AttrNumber) (outDesc->natts), "label",
               lambda->rettype, lambda->rettypmod, 0);

    return outDesc;
}


PG_MODULE_MAGIC;
PG_FUNCTION_INFO_V1_RECTYPE(label, label_record_type);
PG_FUNCTION_INFO_V1_RECTYPE(label_fast, label_record_type);


Datum
label_internal(PG_FUNCTION_ARGS)
{
    MemoryContext oldcontext;
    FuncCallContext  *funcctx; 
    MemoryContext per_query_ctx;
    int tupleCount;
    TupleDesc outDesc = NULL;
    Datum *replVal;
    Datum *oldVal;
    bool *replIsNull;
    bool *oldIsNull;

    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    if (rsinfo == NULL || !IsA(rsinfo, ReturnSetInfo))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("set-valued function called in context that cannot accept a set")));
    if (!(rsinfo->allowedModes & SFRM_Materialize))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("materialize mode required, but it is not " \
                        "allowed in this context")));

    LambdaExpr* lambda = PG_GETARG_LAMBDA(1);
    TupleDesc inDesc = (TupleDesc) list_nth(lambda->argtypes, 0);

    per_query_ctx = rsinfo->econtext->ecxt_per_query_memory;
    oldcontext = MemoryContextSwitchTo(per_query_ctx);
    PlanState *planState = (PlanState *) PG_GETARG_POINTER(0);
    TupleTableSlot *slot = MakeTupleTableSlot(NULL);
    Tuplestorestate *tsOut = tuplestore_begin_heap(true, false, work_mem);

    HeapTuple   tuple;

    outDesc = CreateTupleDescCopy(inDesc);
    oldIsNull = (bool *) palloc(inDesc->natts * sizeof(bool));
    oldVal = (Datum *) palloc(outDesc->natts * sizeof(Datum));

    outDesc = CreateTemplateTupleDesc(inDesc->natts + 1, false);

    for (int i = 0; i < inDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), inDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, (AttrNumber) (outDesc->natts), "label",
               lambda->rettype, lambda->rettypmod, 0);

    replIsNull = (bool *) palloc(outDesc->natts * sizeof(bool));
    replVal = (Datum *) palloc(outDesc->natts * sizeof(Datum));

    replIsNull[outDesc->natts - 1] = false;
    ExprStateEvalFunc evalfunc = castNode(ExprState, lambda->exprstate)->evalfunc;

    for (slot = ExecProcNode(planState); !TupIsNull(slot); slot = ExecProcNode(planState))
    {     
        bool isnull;
        Datum *val_ptr = oldVal;
        bool *null_ptr = oldIsNull;

        HeapTupleHeader hdr;

        if (slot->tts_mintuple)
        {
            hdr = slot->tts_tuple->t_data;
            heap_deform_tuple(slot->tts_tuple, inDesc, val_ptr, null_ptr);
        }
        else
        {
            slot_getallattrs(slot);

            val_ptr = slot->tts_values;
            null_ptr = slot->tts_isnull;
            hdr = slot->tts_tuple->t_data;
        }

        PG_LAMBDA_SETARG(lambda, 0, HeapTupleHeaderGetDatum(hdr));
        Datum result = PG_LAMBDA_EVAL(lambda, 0, &isnull);
       
        for (int i = 0; i < outDesc->natts - 1; i++)
        {
            replVal[i] = val_ptr[i];
            replIsNull[i] = null_ptr[i];
        }

        replVal[outDesc->natts - 1] = result;
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
label_fast_internal(PG_FUNCTION_ARGS, Datum (*evalfunc)(Datum ** arg), bool cursor)
{
    MemoryContext oldcontext;
    FuncCallContext  *funcctx; 
    MemoryContext per_query_ctx;
    int tupleCount;
    TupleDesc outDesc = NULL;
    Datum *replVal;
    Datum *oldVal;
    bool *replIsNull;
    bool *oldIsNull;
    Tuplestorestate *ttsIn;

    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    if (rsinfo == NULL || !IsA(rsinfo, ReturnSetInfo))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("set-valued function called in context that cannot accept a set")));
    if (!(rsinfo->allowedModes & SFRM_Materialize))
        ereport(ERROR,
                (errcode(ERRCODE_FEATURE_NOT_SUPPORTED),
                 errmsg("materialize mode required, but it is not " \
                        "allowed in this context")));

    LambdaExpr* lambda = PG_GETARG_LAMBDA(1);
    TupleDesc inDesc = (TupleDesc) list_nth(lambda->argtypes, 0);

    per_query_ctx = rsinfo->econtext->ecxt_per_query_memory;
    oldcontext = MemoryContextSwitchTo(per_query_ctx);
    PlanState *planState = (PlanState *) PG_GETARG_POINTER(0);

    if (!cursor)
    {
        ttsIn = ((TypedTuplestore *) PG_GETARG_POINTER(0))->tuplestorestate;    
    }

    TupleTableSlot *slot = MakeTupleTableSlot(NULL);
    Tuplestorestate *tsOut = tuplestore_begin_heap(true, false, work_mem);

    HeapTuple   tuple;

    outDesc = CreateTupleDescCopy(inDesc);
    oldIsNull = (bool *) palloc(inDesc->natts * sizeof(bool));
    oldVal = (Datum *) palloc(outDesc->natts * sizeof(Datum));

    outDesc = CreateTemplateTupleDesc(inDesc->natts + 1, false);

    for (int i = 0; i < inDesc->natts; i++)
    {
        TupleDescCopyEntry(outDesc, (AttrNumber) (i+1), inDesc, (AttrNumber) (i+1));
    }

    TupleDescInitEntry(outDesc, (AttrNumber) (outDesc->natts), "label",
               lambda->rettype, lambda->rettypmod, 0);

    replIsNull = (bool *) palloc(outDesc->natts * sizeof(bool));
    replVal = (Datum *) palloc(outDesc->natts * sizeof(Datum));

    replIsNull[outDesc->natts - 1] = false;
    bool isnull;



    if (!cursor)
    {
        while (tuplestore_gettupleslot(ttsIn, true, false, slot)) {
            heap_deform_tuple(slot->tts_tuple , inDesc, oldVal, oldIsNull);
            Datum result = evalfunc(&oldVal);

            for (int i = 0; i < outDesc->natts - 1; i++)
            {
                replVal[i] = oldVal[i];
                replIsNull[i] = oldIsNull[i];
            }

            replVal[outDesc->natts - 1] = result;
            tuple = heap_form_tuple(outDesc, replVal, replIsNull);

            tuplestore_puttuple(tsOut, tuple);
        }
    }
    else
    {
        for (slot = ExecProcNode(planState); !TupIsNull(slot); slot = ExecProcNode(planState))
        {     
            Datum *val_ptr = oldVal;
            bool *null_ptr = oldIsNull;

            HeapTupleHeader hdr;

            if (slot->tts_mintuple)
            {
                hdr = slot->tts_tuple->t_data;
                heap_deform_tuple(slot->tts_tuple, inDesc, val_ptr, null_ptr);
            }
            else
            {
                slot_getallattrs(slot);

                val_ptr = slot->tts_values;
                null_ptr = slot->tts_isnull;
                hdr = slot->tts_tuple->t_data;
            }

            
            Datum result = evalfunc(&val_ptr);

            for (int i = 0; i < outDesc->natts - 1; i++)
            {
                replVal[i] = val_ptr[i];
                replIsNull[i] = null_ptr[i];
            }

            replVal[outDesc->natts - 1] = result;
            tuple = heap_form_tuple(outDesc, replVal, replIsNull);

            tuplestore_puttuple(tsOut, tuple);
        }


    }
        

    rsinfo->returnMode = SFRM_Materialize;
    rsinfo->setResult = tsOut;
    rsinfo->setDesc = outDesc;

    MemoryContextSwitchTo(oldcontext);

    return (Datum) 0;
}

Datum
label(PG_FUNCTION_ARGS)
{
     ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    LambdaExpr* lambda = PG_GETARG_LAMBDA(1);

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);

    ExecInitLambdaExpr((Node *) lambda, false);

    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return label_internal(fcinfo);
}


Datum
label_fast(PG_FUNCTION_ARGS)
{
    ReturnSetInfo *rsinfo = (ReturnSetInfo *) fcinfo->resultinfo;

    LambdaExpr* lambda = PG_GETARG_LAMBDA(1);

    if (lambda->rettype != FLOAT8OID && lambda->rettype != FLOAT4OID &&
        lambda->rettype != INT4OID && lambda->rettype != INT8OID)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must return a float or integer value. You might need to add type casts.")));
    }
    else if (list_length(lambda->argtypes) != 1)
    {
        ereport(ERROR,
            (errcode(ERRCODE_INTERNAL_ERROR),
             errmsg("lambda function must take exactly 1 argument.")));
    }

    llvm_enter_tmp_context(rsinfo->econtext->ecxt_estate);
    LLVMJitContext* jitContext = (LLVMJitContext *) (rsinfo->econtext->ecxt_estate->es_jit);

    ExecInitLambdaExpr((Node *) lambda, true);
    Datum (*compiled_func)(Datum **);
    compiled_func = llvm_prepare_simple_expression(castNode(ExprState, lambda->exprstate));

    llvm_leave_tmp_context(rsinfo->econtext->ecxt_estate);

    return label_fast_internal(fcinfo, compiled_func, fcinfo->nargs == 3 && PG_GETARG_BOOL(2));
}

