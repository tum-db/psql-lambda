; ModuleID = 'execExprInterp.bc'
source_filename = "execExprInterp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ExprEvalOpLookup = type { i8*, i32 }
%struct.MemoryContextData = type { i32, i8, i8, %struct.MemoryContextMethods*, %struct.MemoryContextData*, %struct.MemoryContextData*, %struct.MemoryContextData*, %struct.MemoryContextData*, i8*, i8*, %struct.MemoryContextCallback* }
%struct.MemoryContextMethods = type { i8* (%struct.MemoryContextData*, i64)*, void (%struct.MemoryContextData*, i8*)*, i8* (%struct.MemoryContextData*, i8*, i64)*, void (%struct.MemoryContextData*)*, void (%struct.MemoryContextData*)*, i64 (%struct.MemoryContextData*, i8*)*, i1 (%struct.MemoryContextData*)*, void (%struct.MemoryContextData*, void (%struct.MemoryContextData*, i8*, i8*)*, i8*, %struct.MemoryContextCounters*)* }
%struct.MemoryContextCounters = type { i64, i64, i64, i64 }
%struct.MemoryContextCallback = type { void (i8*)*, i8*, %struct.MemoryContextCallback* }
%struct.ExprState = type { %struct.Node, i8, i8, i64, %struct.TupleTableSlot*, %struct.ExprEvalStep*, i64 (%struct.ExprState*, %struct.ExprContext*, i8*)*, %struct.Expr*, i8*, i32, i32, %struct.PlanState*, %struct.ParamListInfoData*, i64*, i8*, i64*, i8* }
%struct.Node = type { i32 }
%struct.TupleTableSlot = type { i32, i8, i8, i8, i8, %struct.HeapTupleData*, %struct.tupleDesc*, %struct.MemoryContextData*, i32, i32, i64*, i8*, %struct.MinimalTupleData*, %struct.HeapTupleData, i32, i8 }
%struct.tupleDesc = type { i32, i32, i32, i8, i32, %struct.tupleConstr*, [0 x %struct.FormData_pg_attribute] }
%struct.tupleConstr = type { %struct.attrDefault*, %struct.constrCheck*, %struct.attrMissing*, i16, i16, i8 }
%struct.attrDefault = type { i16, i8* }
%struct.constrCheck = type { i8*, i8*, i8, i8 }
%struct.attrMissing = type opaque
%struct.FormData_pg_attribute = type { i32, %struct.nameData, i32, i32, i16, i16, i32, i32, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32 }
%struct.nameData = type { [64 x i8] }
%struct.MinimalTupleData = type { i32, [6 x i8], i16, i16, i8, [0 x i8] }
%struct.HeapTupleData = type { i32, %struct.ItemPointerData, i32, %struct.HeapTupleHeaderData* }
%struct.ItemPointerData = type { %struct.BlockIdData, i16 }
%struct.BlockIdData = type { i16, i16 }
%struct.HeapTupleHeaderData = type { %union.anon, %struct.ItemPointerData, i16, i16, i8, [0 x i8] }
%union.anon = type { %struct.HeapTupleFields }
%struct.HeapTupleFields = type { i32, i32, %union.anon.0 }
%union.anon.0 = type { i32 }
%struct.ExprEvalStep = type { i64, i64*, i8*, %union.anon.1 }
%union.anon.1 = type { %struct.anon.25 }
%struct.anon.25 = type { i64*, i8*, i32, i32, %struct.FmgrInfo*, %struct.FunctionCallInfoData* }
%struct.FmgrInfo = type { i64 (%struct.FunctionCallInfoData*)*, i32, i16, i8, i8, i8, i8*, %struct.MemoryContextData*, %struct.Node* }
%struct.FunctionCallInfoData = type { %struct.FmgrInfo*, %struct.Node*, %struct.Node*, i32, i8, i16, [100 x i64], [100 x i8] }
%struct.ExprContext = type { i32, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.MemoryContextData*, %struct.MemoryContextData*, %struct.ParamExecData*, %struct.ParamListInfoData*, i64*, i8*, i64, i8, i64, i8, %struct.EState*, %struct.ExprContext_CB* }
%struct.ParamExecData = type { i8*, i64, i8 }
%struct.EState = type { i32, i32, %struct.SnapshotData*, %struct.SnapshotData*, %struct.List*, %struct.PlannedStmt*, i8*, %struct.JunkFilter*, i32, %struct.ResultRelInfo*, i32, %struct.ResultRelInfo*, %struct.ResultRelInfo*, i32, %struct.List*, %struct.List*, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.ParamListInfoData*, %struct.ParamExecData*, %struct.QueryEnvironment*, %struct.MemoryContextData*, %struct.List*, %struct.List*, i64, i32, i32, i32, i8, %struct.List*, %struct.List*, %struct.List*, %struct.ExprContext*, %struct.HeapTupleData**, i8*, i8*, i8, %struct.dsa_area*, i32, %struct.JitContext*, %struct.JitInstrumentation* }
%struct.SnapshotData = type { i1 (%struct.HeapTupleData*, %struct.SnapshotData*, i32)*, i32, i32, i32*, i32, i32*, i32, i8, i8, i8, i32, i32, i32, i32, %struct.pairingheap_node, i64, i64 }
%struct.pairingheap_node = type { %struct.pairingheap_node*, %struct.pairingheap_node*, %struct.pairingheap_node* }
%struct.PlannedStmt = type { i32, i32, i64, i8, i8, i8, i8, i8, i8, i32, %struct.Plan*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.Bitmapset*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.Node*, i32, i32 }
%struct.Plan = type { i32, double, double, double, i32, i8, i8, i32, %struct.List*, %struct.List*, %struct.Plan*, %struct.Plan*, %struct.List*, %struct.Bitmapset*, %struct.Bitmapset* }
%struct.Bitmapset = type { i32, [0 x i32] }
%struct.JunkFilter = type { i32, %struct.List*, %struct.tupleDesc*, i16*, %struct.TupleTableSlot*, i16 }
%struct.ResultRelInfo = type { i32, i32, %struct.RelationData*, i32, %struct.RelationData**, %struct.IndexInfo**, %struct.TriggerDesc*, %struct.FmgrInfo*, %struct.ExprState**, %struct.Instrumentation*, %struct.FdwRoutine*, i8*, i8, %struct.List*, %struct.List*, %struct.ExprState**, %struct.JunkFilter*, %struct.List*, %struct.ProjectionInfo*, %struct.List*, %struct.OnConflictSetState*, %struct.List*, %struct.ExprState*, %struct.RelationData*, i8 }
%struct.IndexInfo = type { i32, i32, i32, [32 x i16], %struct.List*, %struct.List*, %struct.List*, %struct.ExprState*, i32*, i32*, i16*, i32*, i32*, i16*, i8, i8, i8, i8, i32, i32, i8*, %struct.MemoryContextData* }
%struct.TriggerDesc = type { %struct.Trigger*, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.Trigger = type { i32, i8*, i32, i16, i8, i8, i32, i32, i32, i8, i8, i16, i16, i16*, i8**, i8*, i8*, i8* }
%struct.Instrumentation = type { i8, i8, i8, %struct.timespec, %struct.timespec, double, double, %struct.BufferUsage, double, double, double, double, double, double, double, %struct.BufferUsage }
%struct.timespec = type { i64, i64 }
%struct.BufferUsage = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, %struct.timespec, %struct.timespec }
%struct.FdwRoutine = type opaque
%struct.ProjectionInfo = type { i32, %struct.ExprState, %struct.ExprContext* }
%struct.OnConflictSetState = type { i32, %struct.ProjectionInfo*, %struct.tupleDesc*, %struct.ExprState* }
%struct.RelationData = type opaque
%struct.QueryEnvironment = type opaque
%struct.List = type { i32, i32, %struct.ListCell*, %struct.ListCell* }
%struct.ListCell = type { %union.anon.4, %struct.ListCell* }
%union.anon.4 = type { i8* }
%struct.dsa_area = type opaque
%struct.JitContext = type opaque
%struct.JitInstrumentation = type opaque
%struct.ExprContext_CB = type { %struct.ExprContext_CB*, void (i64)*, i64 }
%struct.Expr = type { i32 }
%struct.PlanState = type { i32, %struct.Plan*, %struct.EState*, %struct.TupleTableSlot* (%struct.PlanState*)*, %struct.TupleTableSlot* (%struct.PlanState*)*, %struct.Instrumentation*, %struct.WorkerInstrumentation*, %struct.SharedJitInstrumentation*, %struct.ExprState*, %struct.PlanState*, %struct.PlanState*, %struct.List*, %struct.List*, %struct.Bitmapset*, %struct.TupleTableSlot*, %struct.ExprContext*, %struct.ProjectionInfo*, %struct.tupleDesc* }
%struct.WorkerInstrumentation = type { i32, [0 x %struct.Instrumentation] }
%struct.SharedJitInstrumentation = type opaque
%struct.ParamListInfoData = type { %struct.ParamExternData* (%struct.ParamListInfoData*, i32, i1, %struct.ParamExternData*)*, i8*, void (%struct.ParamListInfoData*, %struct.Param*, %struct.ExprState*, i64*, i8*)*, i8*, void (%struct.ParseState*, i8*)*, i8*, i32, [0 x %struct.ParamExternData] }
%struct.ParamExternData = type { i64, i8, i16, i32 }
%struct.Param = type { %struct.Expr, i32, i32, i32, i32, i32, i32 }
%struct.ParseState = type { %struct.ParseState*, i8*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, i8, %struct.List*, %struct.List*, %struct.CommonTableExpr*, %struct.RelationData*, %struct.RangeTblEntry*, i8, %struct.List*, i32, i32, %struct.List*, %struct.List*, i8, i8, %struct.LambdaExpr*, %struct.List*, %struct.QueryEnvironment*, i8, i8, i8, i8, i8, %struct.Node*, %struct.Node* (%struct.ParseState*, %struct.ColumnRef*)*, %struct.Node* (%struct.ParseState*, %struct.ColumnRef*, %struct.Node*)*, %struct.Node* (%struct.ParseState*, %struct.ParamRef*)*, %struct.Node* (%struct.ParseState*, %struct.Param*, i32, i32, i32)*, i8* }
%struct.CommonTableExpr = type { i32, i8*, %struct.List*, %struct.Node*, i32, i8, i32, %struct.List*, %struct.List*, %struct.List*, %struct.List* }
%struct.RangeTblEntry = type { i32, i32, i32, i8, %struct.TableSampleClause*, %struct.Query*, i8, i32, %struct.List*, %struct.List*, i8, %struct.TableFunc*, %struct.List*, i8*, i32, i8, %struct.List*, %struct.List*, %struct.List*, i8*, double, %struct.Alias*, %struct.Alias*, i8, i8, i8, i32, i32, %struct.Bitmapset*, %struct.Bitmapset*, %struct.Bitmapset*, %struct.List* }
%struct.TableSampleClause = type { i32, i32, %struct.List*, %struct.Expr* }
%struct.Query = type { i32, i32, i32, i64, i8, %struct.Node*, i32, i8, i8, i8, i8, i8, i8, i8, i8, i8, %struct.List*, %struct.List*, %struct.FromExpr*, %struct.List*, i32, %struct.OnConflictExpr*, %struct.List*, %struct.List*, %struct.List*, %struct.Node*, %struct.List*, %struct.List*, %struct.List*, %struct.Node*, %struct.Node*, %struct.List*, %struct.Node*, %struct.List*, %struct.List*, i32, i32 }
%struct.FromExpr = type { i32, %struct.List*, %struct.Node* }
%struct.OnConflictExpr = type { i32, i32, %struct.List*, %struct.Node*, i32, %struct.List*, %struct.Node*, i32, %struct.List* }
%struct.TableFunc = type { i32, %struct.List*, %struct.List*, %struct.Node*, %struct.Node*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.Bitmapset*, i32, i32 }
%struct.Alias = type { i32, i8*, %struct.List* }
%struct.LambdaExpr = type { i32, %struct.List*, %struct.Expr*, %struct.List*, i32, i32, %struct.Node*, %struct.Node*, i32 }
%struct.ColumnRef = type { i32, %struct.List*, i32 }
%struct.ParamRef = type { i32, i32, i32 }
%struct.anon.5 = type { i32, i32 }
%struct.PgStat_FunctionCallUsage = type { %struct.PgStat_FunctionCounts*, %struct.timespec, %struct.timespec, %struct.timespec }
%struct.PgStat_FunctionCounts = type { i64, %struct.timespec, %struct.timespec }
%struct.SubPlanState = type { i32, %struct.SubPlan*, %struct.PlanState*, %struct.PlanState*, %struct.ExprState*, %struct.List*, %struct.HeapTupleData*, i64, i64, %struct.tupleDesc*, %struct.ProjectionInfo*, %struct.ProjectionInfo*, %struct.TupleHashTableData*, %struct.TupleHashTableData*, i8, i8, %struct.MemoryContextData*, %struct.MemoryContextData*, %struct.ExprContext*, i16*, i32*, %struct.FmgrInfo*, %struct.FmgrInfo*, %struct.FmgrInfo*, %struct.FmgrInfo*, %struct.ExprState* }
%struct.SubPlan = type { %struct.Expr, i32, %struct.Node*, %struct.List*, i32, i8*, i32, i32, i32, i8, i8, i8, %struct.List*, %struct.List*, %struct.List*, double, double }
%struct.TupleHashTableData = type { %struct.tuplehash_hash*, i32, i16*, %struct.FmgrInfo*, %struct.ExprState*, %struct.MemoryContextData*, %struct.MemoryContextData*, i64, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.FmgrInfo*, %struct.ExprState*, i32, %struct.ExprContext* }
%struct.tuplehash_hash = type { i64, i32, i32, i32, %struct.TupleHashEntryData*, %struct.MemoryContextData*, i8* }
%struct.TupleHashEntryData = type { %struct.MinimalTupleData*, i8*, i32, i32 }
%struct.anon.19 = type { i32, i32 }
%struct.varlena = type { [4 x i8], [0 x i8] }
%struct.ArrayMapState = type { %struct.ArrayMetaState, %struct.ArrayMetaState }
%struct.ArrayMetaState = type { i32, i16, i8, i8, i8, i32, i32, %struct.FmgrInfo }
%struct.anon.23 = type { %struct.FmgrInfo*, %struct.FunctionCallInfoData*, i64 (%struct.FunctionCallInfoData*)*, i32, i32 }
%struct.ArrayRefState = type { i8, i32, i16, i16, i8, i8, i32, [6 x i8], [6 x i32], i32, [6 x i8], [6 x i32], i64, i8, i64, i8, i64, i8 }
%struct.anon.28 = type { %struct.ArrayRefState*, i32, i8, i32 }
%struct.AggrefExprState = type { i32, %struct.Aggref*, i32 }
%struct.Aggref = type { %struct.Expr, i32, i32, i32, i32, i32, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.List*, %struct.Expr*, i8, i8, i8, i32, i32, i32 }
%struct.AggState = type { %struct.ScanState, %struct.List*, i32, i32, i32, i32, %struct.AggStatePerPhaseData*, i32, i32, %struct.AggStatePerAggData*, %struct.AggStatePerTransData*, %struct.ExprContext*, %struct.ExprContext**, %struct.ExprContext*, %struct.ExprContext*, %struct.AggStatePerAggData*, %struct.AggStatePerTransData*, i8, i8, i32, i32, %struct.Bitmapset*, %struct.List*, i32, %struct.AggStatePerPhaseData*, %struct.Tuplesortstate*, %struct.Tuplesortstate*, %struct.TupleTableSlot*, %struct.AggStatePerGroupData**, %struct.HeapTupleData*, i8, i32, %struct.AggStatePerHashData*, %struct.AggStatePerGroupData**, %struct.AggStatePerGroupData**, %struct.ProjectionInfo* }
%struct.ScanState = type { %struct.PlanState, %struct.RelationData*, %struct.HeapScanDescData*, %struct.TupleTableSlot* }
%struct.HeapScanDescData = type opaque
%struct.AggStatePerAggData = type { %struct.Aggref*, i32, i32, %struct.FmgrInfo, i32, %struct.List*, i16, i8, i8 }
%struct.AggStatePerTransData = type { %struct.Aggref*, i8, i32, i32, i32, i32, i32, i32, %struct.FmgrInfo, %struct.FmgrInfo, %struct.FmgrInfo, i32, i32, i32, i16*, i32*, i32*, i8*, %struct.FmgrInfo, %struct.ExprState*, i64, i8, i16, i16, i8, i8, %struct.TupleTableSlot*, %struct.TupleTableSlot*, %struct.tupleDesc*, %struct.Tuplesortstate**, %struct.FunctionCallInfoData, %struct.FunctionCallInfoData, %struct.FunctionCallInfoData }
%struct.AggStatePerPhaseData = type { i32, i32, i32*, %struct.Bitmapset**, %struct.ExprState**, %struct.Agg*, %struct.Sort*, %struct.ExprState* }
%struct.Agg = type { %struct.Plan, i32, i32, i32, i16*, i32*, i64, %struct.Bitmapset*, %struct.List*, %struct.List* }
%struct.Sort = type { %struct.Plan, i32, i16*, i32*, i32*, i8* }
%struct.Tuplesortstate = type opaque
%struct.AggStatePerHashData = type { %struct.TupleHashTableData*, %struct.tuplehash_iterator, %struct.TupleTableSlot*, %struct.FmgrInfo*, i32*, i32, i32, i32, i16*, i16*, %struct.Agg* }
%struct.tuplehash_iterator = type { i32, i32, i8 }
%struct.AggStatePerGroupData = type { i64, i8, i8 }
%struct.WindowFuncExprState = type { i32, %struct.WindowFunc*, %struct.List*, %struct.ExprState*, i32 }
%struct.WindowFunc = type { %struct.Expr, i32, i32, i32, i32, %struct.List*, %struct.Expr*, i32, i8, i8, i32 }
%struct.AlternativeSubPlanState = type { i32, %struct.AlternativeSubPlan*, %struct.List*, i32 }
%struct.AlternativeSubPlan = type { %struct.Expr, %struct.List* }
%struct.anon.40 = type { i8*, i32, i32 }
%struct.anon.41 = type { %struct.AggState*, %struct.AggStatePerTransData*, %struct.ExprContext*, i32, i32, i32, i32 }
%struct.anon.42 = type { %struct.AggState*, i32, i32, i32, i32 }
%struct.anon.43 = type { %struct.AggState*, %struct.AggStatePerTransData*, %struct.ExprContext*, i32, i32, i32 }
%struct.anon.2 = type { i32, i32 }
%struct.anon.13 = type { i32, i32 }
%struct.SQLValueFunction = type { %struct.Expr, i32, i32, i32, i32 }
%struct.TimeTzADT = type { i64, i32 }
%struct.anon.20 = type { i64*, i8*, i32, i32, i16, i8, i8, i8 }
%struct.ArrayType = type { i32, i32, i32, i32 }
%struct.anon.26 = type { i16, i32, %struct.tupleDesc* }
%struct.varattrib_1b = type { i8, [0 x i8] }
%struct.varattrib_1b_e = type { i8, i8, [0 x i8] }
%struct.ExpandedObjectHeader = type { i32, %struct.ExpandedObjectMethods*, %struct.MemoryContextData*, [10 x i8], [10 x i8] }
%struct.ExpandedObjectMethods = type { i64 (%struct.ExpandedObjectHeader*)*, void (%struct.ExpandedObjectHeader*, i8*, i64)* }
%struct.ExpandedRecordHeader = type { %struct.ExpandedObjectHeader, i32, i32, i32, i32, i32, %struct.tupleDesc*, i64, i64*, i8*, i32, i64, i64, i32, i8, %struct.HeapTupleData*, i8*, i8*, %struct.MemoryContextData*, %struct.ExpandedRecordHeader*, i8*, %struct.MemoryContextCallback }
%struct.FieldStore = type { %struct.Expr, %struct.Expr*, %struct.List*, %struct.List*, i32 }
%struct.ConvertRowtypeExpr = type { %struct.Expr, %struct.Expr*, i32, i32, i32 }
%struct.TupleConversionMap = type { %struct.tupleDesc*, %struct.tupleDesc*, i16*, i64*, i8*, i64*, i8* }
%struct.anon.32 = type { i32, i8, i16, i8, i8, %struct.FmgrInfo*, %struct.FunctionCallInfoData*, i64 (%struct.FunctionCallInfoData*)* }
%struct.StringInfoData = type { i8*, i32, i32, i32 }
%struct.XmlExpr = type { %struct.Expr, i32, i8*, %struct.List*, %struct.List*, %struct.List*, i32, i32, i32, i32 }
%struct.Value = type { i32, %union.ValUnion }
%union.ValUnion = type { i8* }
%struct.anon.3 = type { %struct.Var*, i8, i8, %struct.tupleDesc*, %struct.JunkFilter* }
%struct.Var = type { %struct.Expr, i32, i16, i32, i32, i32, i32, i32, i16, i32 }

@.str = private unnamed_addr constant [7 x i8] c"NO JIT\00", align 1
@dispatch_table = internal unnamed_addr global i8** null, align 8
@reverse_dispatch_table = internal global [86 x %struct.ExprEvalOpLookup] zeroinitializer, align 16
@.str.1 = private unnamed_addr constant [17 x i8] c"execExprInterp.c\00", align 1
@__func__.ExecEvalParamExtern = private unnamed_addr constant [20 x i8] c"ExecEvalParamExtern\00", align 1
@.str.2 = private unnamed_addr constant [75 x i8] c"type of parameter %d (%s) does not match that when preparing the plan (%s)\00", align 1
@.str.3 = private unnamed_addr constant [32 x i8] c"no value found for parameter %d\00", align 1
@__func__.ExecEvalCurrentOfExpr = private unnamed_addr constant [22 x i8] c"ExecEvalCurrentOfExpr\00", align 1
@.str.4 = private unnamed_addr constant [54 x i8] c"WHERE CURRENT OF is not supported for this table type\00", align 1
@__func__.ExecEvalNextValueExpr = private unnamed_addr constant [22 x i8] c"ExecEvalNextValueExpr\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"unsupported sequence type %u\00", align 1
@__func__.ExecEvalArrayExpr = private unnamed_addr constant [18 x i8] c"ExecEvalArrayExpr\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"cannot merge incompatible arrays\00", align 1
@.str.7 = private unnamed_addr constant [87 x i8] c"Array with element type %s cannot be included in ARRAY construct with element type %s.\00", align 1
@.str.8 = private unnamed_addr constant [65 x i8] c"number of array dimensions (%d) exceeds the maximum allowed (%d)\00", align 1
@.str.9 = private unnamed_addr constant [77 x i8] c"multidimensional arrays must have array expressions with matching dimensions\00", align 1
@__func__.ExecEvalFieldSelect = private unnamed_addr constant [20 x i8] c"ExecEvalFieldSelect\00", align 1
@.str.10 = private unnamed_addr constant [57 x i8] c"unsupported reference to system column %d in FieldSelect\00", align 1
@.str.11 = private unnamed_addr constant [49 x i8] c"attribute number %d exceeds number of columns %d\00", align 1
@.str.12 = private unnamed_addr constant [28 x i8] c"attribute %d has wrong type\00", align 1
@.str.13 = private unnamed_addr constant [41 x i8] c"Table has type %s, but query expects %s.\00", align 1
@__func__.ExecEvalFieldStoreDeForm = private unnamed_addr constant [25 x i8] c"ExecEvalFieldStoreDeForm\00", align 1
@.str.14 = private unnamed_addr constant [38 x i8] c"too many columns in composite type %u\00", align 1
@__func__.ExecEvalArrayRefSubscript = private unnamed_addr constant [26 x i8] c"ExecEvalArrayRefSubscript\00", align 1
@.str.15 = private unnamed_addr constant [47 x i8] c"array subscript in assignment must not be null\00", align 1
@.str.16 = private unnamed_addr constant [27 x i8] c"could not convert row type\00", align 1
@__func__.ExecEvalConstraintNotNull = private unnamed_addr constant [26 x i8] c"ExecEvalConstraintNotNull\00", align 1
@.str.17 = private unnamed_addr constant [37 x i8] c"domain %s does not allow null values\00", align 1
@__func__.ExecEvalConstraintCheck = private unnamed_addr constant [24 x i8] c"ExecEvalConstraintCheck\00", align 1
@.str.18 = private unnamed_addr constant [51 x i8] c"value for domain %s violates check constraint \22%s\22\00", align 1
@.str.19 = private unnamed_addr constant [12 x i8] c"<%s>%s</%s>\00", align 1
@__func__.ExecEvalXmlExpr = private unnamed_addr constant [16 x i8] c"ExecEvalXmlExpr\00", align 1
@.str.20 = private unnamed_addr constant [27 x i8] c"unrecognized XML operation\00", align 1
@__func__.ExecEvalWholeRowVar = private unnamed_addr constant [20 x i8] c"ExecEvalWholeRowVar\00", align 1
@.str.21 = private unnamed_addr constant [57 x i8] c"table row type and query-specified row type do not match\00", align 1
@.str.22 = private unnamed_addr constant [55 x i8] c"Table row contains %d attribute, but query expects %d.\00", align 1
@.str.23 = private unnamed_addr constant [56 x i8] c"Table row contains %d attributes, but query expects %d.\00", align 1
@.str.24 = private unnamed_addr constant [64 x i8] c"Table has type %s at ordinal position %d, but query expects %s.\00", align 1
@.str.25 = private unnamed_addr constant [71 x i8] c"Physical storage mismatch on dropped attribute at ordinal position %d.\00", align 1
@CurrentMemoryContext = external dso_local local_unnamed_addr global %struct.MemoryContextData*, align 8
@ExecInterpExpr.dispatch_table = internal constant [87 x i8*] [i8* blockaddress(@ExecInterpExpr, %1614), i8* blockaddress(@ExecInterpExpr, %43), i8* blockaddress(@ExecInterpExpr, %50), i8* blockaddress(@ExecInterpExpr, %55), i8* blockaddress(@ExecInterpExpr, %60), i8* blockaddress(@ExecInterpExpr, %76), i8* blockaddress(@ExecInterpExpr, %92), i8* blockaddress(@ExecInterpExpr, %108), i8* blockaddress(@ExecInterpExpr, %120), i8* blockaddress(@ExecInterpExpr, %132), i8* blockaddress(@ExecInterpExpr, %144), i8* blockaddress(@ExecInterpExpr, %146), i8* blockaddress(@ExecInterpExpr, %166), i8* blockaddress(@ExecInterpExpr, %186), i8* blockaddress(@ExecInterpExpr, %206), i8* blockaddress(@ExecInterpExpr, %218), i8* blockaddress(@ExecInterpExpr, %240), i8* blockaddress(@ExecInterpExpr, %254), i8* blockaddress(@ExecInterpExpr, %269), i8* blockaddress(@ExecInterpExpr, %302), i8* blockaddress(@ExecInterpExpr, %317), i8* blockaddress(@ExecInterpExpr, %350), i8* blockaddress(@ExecInterpExpr, %354), i8* blockaddress(@ExecInterpExpr, %377), i8* blockaddress(@ExecInterpExpr, %397), i8* blockaddress(@ExecInterpExpr, %401), i8* blockaddress(@ExecInterpExpr, %424), i8* blockaddress(@ExecInterpExpr, %444), i8* blockaddress(@ExecInterpExpr, %451), i8* blockaddress(@ExecInterpExpr, %471), i8* blockaddress(@ExecInterpExpr, %478), i8* blockaddress(@ExecInterpExpr, %492), i8* blockaddress(@ExecInterpExpr, %506), i8* blockaddress(@ExecInterpExpr, %525), i8* blockaddress(@ExecInterpExpr, %534), i8* blockaddress(@ExecInterpExpr, %544), i8* blockaddress(@ExecInterpExpr, %546), i8* blockaddress(@ExecInterpExpr, %548), i8* blockaddress(@ExecInterpExpr, %559), i8* blockaddress(@ExecInterpExpr, %574), i8* blockaddress(@ExecInterpExpr, %589), i8* blockaddress(@ExecInterpExpr, %600), i8* blockaddress(@ExecInterpExpr, %621), i8* blockaddress(@ExecInterpExpr, %623), i8* blockaddress(@ExecInterpExpr, %628), i8* blockaddress(@ExecInterpExpr, %672), i8* blockaddress(@ExecInterpExpr, %691), i8* blockaddress(@ExecInterpExpr, %741), i8* blockaddress(@ExecInterpExpr, %778), i8* blockaddress(@ExecInterpExpr, %813), i8* blockaddress(@ExecInterpExpr, %849), i8* blockaddress(@ExecInterpExpr, %851), i8* blockaddress(@ExecInterpExpr, %852), i8* blockaddress(@ExecInterpExpr, %881), i8* blockaddress(@ExecInterpExpr, %883), i8* blockaddress(@ExecInterpExpr, %917), i8* blockaddress(@ExecInterpExpr, %936), i8* blockaddress(@ExecInterpExpr, %996), i8* blockaddress(@ExecInterpExpr, %1025), i8* blockaddress(@ExecInterpExpr, %1092), i8* blockaddress(@ExecInterpExpr, %1094), i8* blockaddress(@ExecInterpExpr, %1096), i8* blockaddress(@ExecInterpExpr, %1116), i8* blockaddress(@ExecInterpExpr, %1156), i8* blockaddress(@ExecInterpExpr, %1158), i8* blockaddress(@ExecInterpExpr, %1160), i8* blockaddress(@ExecInterpExpr, %650), i8* blockaddress(@ExecInterpExpr, %1212), i8* blockaddress(@ExecInterpExpr, %1214), i8* blockaddress(@ExecInterpExpr, %1208), i8* blockaddress(@ExecInterpExpr, %1210), i8* blockaddress(@ExecInterpExpr, %1216), i8* blockaddress(@ExecInterpExpr, %1218), i8* blockaddress(@ExecInterpExpr, %1238), i8* blockaddress(@ExecInterpExpr, %1274), i8* blockaddress(@ExecInterpExpr, %1294), i8* blockaddress(@ExecInterpExpr, %1304), i8* blockaddress(@ExecInterpExpr, %1314), i8* blockaddress(@ExecInterpExpr, %1327), i8* blockaddress(@ExecInterpExpr, %1352), i8* blockaddress(@ExecInterpExpr, %1378), i8* blockaddress(@ExecInterpExpr, %1433), i8* blockaddress(@ExecInterpExpr, %1459), i8* blockaddress(@ExecInterpExpr, %1509), i8* blockaddress(@ExecInterpExpr, %1571), i8* blockaddress(@ExecInterpExpr, %1591), i8* blockaddress(@ExecInterpExpr, %1614)], align 16
@.str.26 = private unnamed_addr constant [16 x i8] c"Const EXPR: %i\0A\00", align 1
@__func__.CheckVarSlotCompatibility = private unnamed_addr constant [26 x i8] c"CheckVarSlotCompatibility\00", align 1
@.str.27 = private unnamed_addr constant [41 x i8] c"attribute %d of type %s has been dropped\00", align 1
@.str.28 = private unnamed_addr constant [39 x i8] c"attribute %d of type %s has wrong type\00", align 1
@.str.29 = private unnamed_addr constant [16 x i8] c"Just const: %i\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @ExecReadyInterpretedExpr(%struct.ExprState* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  %3 = load i8**, i8*** @dispatch_table, align 8
  %4 = icmp eq i8** %3, null
  br i1 %4, label %5, label %18

; <label>:5:                                      ; preds = %1
  store i8** getelementptr inbounds ([87 x i8*], [87 x i8*]* @ExecInterpExpr.dispatch_table, i64 0, i64 0), i8*** @dispatch_table, align 8
  br label %6

; <label>:6:                                      ; preds = %6, %5
  %7 = phi i64 [ 0, %5 ], [ %15, %6 ]
  %8 = getelementptr [87 x i8*], [87 x i8*]* @ExecInterpExpr.dispatch_table, i64 0, i64 %7
  %9 = bitcast i8** %8 to i64*
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %7
  %12 = bitcast %struct.ExprEvalOpLookup* %11 to i64*
  store i64 %10, i64* %12, align 16
  %13 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %7, i32 1
  %14 = trunc i64 %7 to i32
  store i32 %14, i32* %13, align 8
  %15 = add nuw nsw i64 %7, 1
  %16 = icmp eq i64 %15, 86
  br i1 %16, label %17, label %6

; <label>:17:                                     ; preds = %6
  tail call void @pg_qsort(i8* bitcast ([86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table to i8*), i64 86, i64 16, i32 (i8*, i8*)* nonnull @dispatch_compare_ptr) #9
  br label %18

; <label>:18:                                     ; preds = %17, %1
  %19 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 1
  %20 = load i8, i8* %19, align 4
  %21 = and i8 %20, 2
  %22 = icmp eq i8 %21, 0
  br i1 %22, label %23, label %110

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 6
  store i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecInterpExprStillValid, i64 (%struct.ExprState*, %struct.ExprContext*, i8*)** %24, align 8
  %25 = or i8 %20, 2
  store i8 %25, i8* %19, align 4
  %26 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 9
  %27 = load i32, i32* %26, align 8
  switch i32 %27, label %87 [
    i32 3, label %28
    i32 2, label %79
  ]

; <label>:28:                                     ; preds = %23
  %29 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %30 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %29, align 8
  %31 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %30, i64 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %30, i64 1, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = trunc i64 %35 to i32
  %37 = icmp eq i32 %33, 1
  %38 = icmp eq i32 %36, 4
  %39 = and i1 %37, %38
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %28
  %41 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustInnerVar to i8*), i8** %41, align 8
  br label %110

; <label>:42:                                     ; preds = %28
  %43 = icmp eq i32 %33, 2
  %44 = icmp eq i32 %36, 5
  %45 = and i1 %43, %44
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %42
  %47 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustOuterVar to i8*), i8** %47, align 8
  br label %110

; <label>:48:                                     ; preds = %42
  %49 = icmp eq i32 %33, 3
  %50 = icmp eq i32 %36, 6
  %51 = and i1 %49, %50
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %48
  %53 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustScanVar to i8*), i8** %53, align 8
  br label %110

; <label>:54:                                     ; preds = %48
  %55 = icmp eq i32 %36, 11
  %56 = and i1 %37, %55
  br i1 %56, label %57, label %59

; <label>:57:                                     ; preds = %54
  %58 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustAssignInnerVar to i8*), i8** %58, align 8
  br label %110

; <label>:59:                                     ; preds = %54
  %60 = icmp eq i32 %36, 12
  %61 = and i1 %43, %60
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %59
  %63 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustAssignOuterVar to i8*), i8** %63, align 8
  br label %110

; <label>:64:                                     ; preds = %59
  %65 = icmp eq i32 %36, 13
  %66 = and i1 %49, %65
  br i1 %66, label %67, label %69

; <label>:67:                                     ; preds = %64
  %68 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustAssignScanVar to i8*), i8** %68, align 8
  br label %110

; <label>:69:                                     ; preds = %64
  %70 = icmp eq i32 %33, 44
  %71 = icmp eq i32 %36, 18
  %72 = and i1 %70, %71
  br i1 %72, label %73, label %89

; <label>:73:                                     ; preds = %69
  %74 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %30, i64 0, i32 3, i32 0, i32 0
  %75 = load i64*, i64** %74, align 8
  %76 = icmp eq i64* %75, null
  br i1 %76, label %89, label %77

; <label>:77:                                     ; preds = %73
  %78 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustApplyFuncToCase to i8*), i8** %78, align 8
  br label %110

; <label>:79:                                     ; preds = %23
  %80 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %81 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %80, align 8
  %82 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %81, i64 0, i32 0
  %83 = load i64, i64* %82, align 8
  %84 = icmp eq i64 %83, 16
  br i1 %84, label %85, label %89

; <label>:85:                                     ; preds = %79
  %86 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecJustConst to i8*), i8** %86, align 8
  br label %110

; <label>:87:                                     ; preds = %23
  %88 = icmp sgt i32 %27, 0
  br i1 %88, label %89, label %106

; <label>:89:                                     ; preds = %87, %79, %73, %69
  %90 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %91 = load i8**, i8*** @dispatch_table, align 8
  br label %92

; <label>:92:                                     ; preds = %92, %89
  %93 = phi i64 [ 0, %89 ], [ %100, %92 ]
  %94 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %90, align 8
  %95 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %94, i64 %93, i32 0
  %96 = load i64, i64* %95, align 8
  %97 = getelementptr i8*, i8** %91, i64 %96
  %98 = bitcast i8** %97 to i64*
  %99 = load i64, i64* %98, align 8
  store i64 %99, i64* %95, align 8
  %100 = add nuw nsw i64 %93, 1
  %101 = load i32, i32* %26, align 8
  %102 = sext i32 %101 to i64
  %103 = icmp slt i64 %100, %102
  br i1 %103, label %92, label %104

; <label>:104:                                    ; preds = %92
  %105 = load i8, i8* %19, align 4
  br label %106

; <label>:106:                                    ; preds = %104, %87
  %107 = phi i8 [ %105, %104 ], [ %25, %87 ]
  %108 = or i8 %107, 4
  store i8 %108, i8* %19, align 4
  %109 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  store i8* bitcast (i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* @ExecInterpExpr to i8*), i8** %109, align 8
  br label %110

; <label>:110:                                    ; preds = %106, %85, %77, %67, %62, %57, %52, %46, %40, %18
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define dso_local i64 @ExecInterpExprStillValid(%struct.ExprState*, %struct.ExprContext*, i8*) #0 {
  tail call void @CheckExprStillValid(%struct.ExprState* %0, %struct.ExprContext* %1)
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 8
  %5 = bitcast i8** %4 to i64 (%struct.ExprState*, %struct.ExprContext*, i8*)**
  %6 = load i64 (%struct.ExprState*, %struct.ExprContext*, i8*)*, i64 (%struct.ExprState*, %struct.ExprContext*, i8*)** %5, align 8
  %7 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 6
  store i64 (%struct.ExprState*, %struct.ExprContext*, i8*)* %6, i64 (%struct.ExprState*, %struct.ExprContext*, i8*)** %7, align 8
  %8 = tail call i64 %6(%struct.ExprState* %0, %struct.ExprContext* %1, i8* %2) #9
  ret i64 %8
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustInnerVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8*) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, 1
  %10 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 2
  %11 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %12 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %11, i32 %9, i8* %2) #9
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustOuterVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8*) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, 1
  %10 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 3
  %11 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %12 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %11, i32 %9, i8* %2) #9
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustScanVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8*) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = add i32 %8, 1
  %10 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 1
  %11 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %12 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %11, i32 %9, i8* %2) #9
  ret i64 %12
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustAssignInnerVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8* nocapture readnone) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to %struct.anon.5*
  %8 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %7, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = add i32 %9, 1
  %11 = bitcast %union.anon.1* %6 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 2
  %14 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %13, align 8
  %15 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 4
  %16 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %15, align 8
  %17 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 11
  %18 = load i8*, i8** %17, align 8
  %19 = sext i32 %12 to i64
  %20 = getelementptr i8, i8* %18, i64 %19
  %21 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %14, i32 %10, i8* %20) #9
  %22 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 10
  %23 = load i64*, i64** %22, align 8
  %24 = getelementptr i64, i64* %23, i64 %19
  store i64 %21, i64* %24, align 8
  ret i64 0
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustAssignOuterVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8* nocapture readnone) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to %struct.anon.5*
  %8 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %7, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = add i32 %9, 1
  %11 = bitcast %union.anon.1* %6 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 3
  %14 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %13, align 8
  %15 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 4
  %16 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %15, align 8
  %17 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 11
  %18 = load i8*, i8** %17, align 8
  %19 = sext i32 %12 to i64
  %20 = getelementptr i8, i8* %18, i64 %19
  %21 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %14, i32 %10, i8* %20) #9
  %22 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 10
  %23 = load i64*, i64** %22, align 8
  %24 = getelementptr i64, i64* %23, i64 %19
  store i64 %21, i64* %24, align 8
  ret i64 0
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustAssignScanVar(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly, i8* nocapture readnone) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3
  %7 = bitcast %union.anon.1* %6 to %struct.anon.5*
  %8 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %7, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = add i32 %9, 1
  %11 = bitcast %union.anon.1* %6 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 1
  %14 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %13, align 8
  %15 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 4
  %16 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %15, align 8
  %17 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 11
  %18 = load i8*, i8** %17, align 8
  %19 = sext i32 %12 to i64
  %20 = getelementptr i8, i8* %18, i64 %19
  %21 = tail call i64 @slot_getattr(%struct.TupleTableSlot* %14, i32 %10, i8* %20) #9
  %22 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %16, i64 0, i32 10
  %23 = load i64*, i64** %22, align 8
  %24 = getelementptr i64, i64* %23, i64 %19
  store i64 %21, i64* %24, align 8
  ret i64 0
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustApplyFuncToCase(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readnone, i8* nocapture) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 3, i32 0, i32 0
  %7 = load i64*, i64** %6, align 8
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  store i64 %8, i64* %10, align 8
  %11 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 3, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8
  %13 = load i8, i8* %12, align 1, !range !2
  %14 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 2
  %15 = load i8*, i8** %14, align 8
  store i8 %13, i8* %15, align 1
  %16 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3, i32 0, i32 1
  %17 = bitcast i8** %16 to %struct.FunctionCallInfoData**
  %18 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %17, align 8
  %19 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3, i32 0, i32 4
  %20 = bitcast %struct.FmgrInfo** %19 to i32*
  %21 = load i32, i32* %20, align 8
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %25, label %32

; <label>:23:                                     ; preds = %25
  %24 = icmp slt i32 %31, %21
  br i1 %24, label %25, label %32

; <label>:25:                                     ; preds = %23, %3
  %26 = phi i32 [ %31, %23 ], [ 0, %3 ]
  %27 = sext i32 %26 to i64
  %28 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %18, i64 0, i32 7, i64 %27
  %29 = load i8, i8* %28, align 1, !range !2
  %30 = icmp eq i8 %29, 0
  %31 = add nuw i32 %26, 1
  br i1 %30, label %23, label %39

; <label>:32:                                     ; preds = %23, %3
  %33 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %18, i64 0, i32 4
  store i8 0, i8* %33, align 4
  %34 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 1, i32 3, i32 0, i32 2
  %35 = bitcast i32* %34 to i64 (%struct.FunctionCallInfoData*)**
  %36 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %35, align 8
  %37 = tail call i64 %36(%struct.FunctionCallInfoData* %18) #9
  %38 = load i8, i8* %33, align 4, !range !2
  br label %39

; <label>:39:                                     ; preds = %32, %25
  %40 = phi i8 [ %38, %32 ], [ 1, %25 ]
  %41 = phi i64 [ %37, %32 ], [ 0, %25 ]
  store i8 %40, i8* %2, align 1
  ret i64 %41
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define internal i64 @ExecJustConst(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readnone, i8* nocapture) #0 {
  %4 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %5 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 3
  %7 = bitcast %union.anon.1* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.29, i64 0, i64 0), i64 %8)
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %5, i64 0, i32 3, i32 0, i32 1
  %11 = bitcast i8** %10 to i8*
  %12 = load i8, i8* %11, align 8, !range !2
  store i8 %12, i8* %2, align 1
  %13 = load i64, i64* %7, align 8
  ret i64 %13
}

; Function Attrs: nounwind uwtable
define internal i64 @ExecInterpExpr(%struct.ExprState*, %struct.ExprContext*, i8* nocapture) #0 {
  %4 = alloca %struct.PgStat_FunctionCallUsage, align 8
  %5 = alloca %struct.PgStat_FunctionCallUsage, align 8
  %6 = icmp eq %struct.ExprState* %0, null
  br i1 %6, label %1617, label %7, !prof !3

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %9 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %10 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 4
  %11 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %12 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 2
  %13 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %12, align 8
  %14 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 3
  %15 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %14, align 8
  %16 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 1
  %17 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %16, align 8
  %18 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %13, i64 0, i32 10
  %19 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %13, i64 0, i32 11
  %20 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %15, i64 0, i32 10
  %21 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %15, i64 0, i32 11
  %22 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %17, i64 0, i32 10
  %23 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %17, i64 0, i32 11
  %24 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %13, i64 0, i32 5
  %25 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %13, i64 0, i32 6
  %26 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %15, i64 0, i32 5
  %27 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %15, i64 0, i32 6
  %28 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %17, i64 0, i32 5
  %29 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %17, i64 0, i32 6
  %30 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %11, i64 0, i32 10
  %31 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %11, i64 0, i32 11
  %32 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 3
  %33 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 2
  %34 = bitcast %struct.PgStat_FunctionCallUsage* %5 to i8*
  %35 = bitcast %struct.PgStat_FunctionCallUsage* %4 to i8*
  %36 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 6
  %37 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 8
  %38 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 9
  %39 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 10
  %40 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 11
  %41 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 12
  %42 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 13
  br label %1619

; <label>:43:                                     ; preds = %1619
  %44 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %45 = bitcast %union.anon.1* %44 to i32*
  %46 = load i32, i32* %45, align 8
  call void @slot_getsomeattrs(%struct.TupleTableSlot* %13, i32 %46) #9
  %47 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:48:                                     ; preds = %1591, %1571, %1567, %1459, %1457, %1451, %1431, %1397, %1376, %1370, %1327, %1321, %1304, %1294, %1274, %1267, %1218, %1216, %1214, %1212, %1210, %1208, %1206, %1158, %1156, %1148, %1131, %1096, %1094, %1092, %1090, %1023, %994, %988, %976, %955, %917, %915, %881, %877, %849, %840, %834, %811, %776, %739, %686, %670, %648, %623, %621, %611, %598, %587, %572, %557, %546, %544, %534, %525, %523, %516, %504, %497, %490, %483, %471, %469, %461, %444, %442, %422, %415, %395, %375, %368, %348, %302, %300, %254, %240, %238, %206, %186, %166, %146, %144, %132, %120, %108, %92, %76, %60, %55, %50, %43
  %49 = phi %struct.ExprEvalStep* [ %1613, %1591 ], [ %1590, %1571 ], [ %1570, %1567 ], [ %1508, %1459 ], [ %1456, %1451 ], [ %1458, %1457 ], [ %1430, %1397 ], [ %1432, %1431 ], [ %1375, %1370 ], [ %1377, %1376 ], [ %1351, %1327 ], [ %1326, %1321 ], [ %1313, %1304 ], [ %1303, %1294 ], [ %1293, %1274 ], [ %1273, %1267 ], [ %1237, %1218 ], [ %1217, %1216 ], [ %1211, %1210 ], [ %1209, %1208 ], [ %1215, %1214 ], [ %1213, %1212 ], [ %671, %670 ], [ %1207, %1206 ], [ %1159, %1158 ], [ %1157, %1156 ], [ %1147, %1131 ], [ %1155, %1148 ], [ %1115, %1096 ], [ %1095, %1094 ], [ %1093, %1092 ], [ %1091, %1090 ], [ %1024, %1023 ], [ %963, %955 ], [ %982, %976 ], [ %993, %988 ], [ %995, %994 ], [ %935, %917 ], [ %916, %915 ], [ %882, %881 ], [ %880, %877 ], [ %850, %849 ], [ %848, %840 ], [ %839, %834 ], [ %812, %811 ], [ %777, %776 ], [ %740, %739 ], [ %690, %686 ], [ %649, %648 ], [ %627, %623 ], [ %622, %621 ], [ %620, %611 ], [ %599, %598 ], [ %588, %587 ], [ %573, %572 ], [ %558, %557 ], [ %547, %546 ], [ %545, %544 ], [ %543, %534 ], [ %533, %525 ], [ %522, %516 ], [ %524, %523 ], [ %505, %504 ], [ %503, %497 ], [ %489, %483 ], [ %491, %490 ], [ %477, %471 ], [ %468, %461 ], [ %470, %469 ], [ %450, %444 ], [ %443, %442 ], [ %423, %422 ], [ %421, %415 ], [ %396, %395 ], [ %376, %375 ], [ %374, %368 ], [ %349, %348 ], [ %316, %302 ], [ %301, %300 ], [ %268, %254 ], [ %253, %240 ], [ %239, %238 ], [ %217, %206 ], [ %205, %186 ], [ %185, %166 ], [ %165, %146 ], [ %145, %144 ], [ %143, %132 ], [ %131, %120 ], [ %119, %108 ], [ %107, %92 ], [ %91, %76 ], [ %75, %60 ], [ %59, %55 ], [ %54, %50 ], [ %47, %43 ]
  br label %1619

; <label>:50:                                     ; preds = %1619
  %51 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %52 = bitcast %union.anon.1* %51 to i32*
  %53 = load i32, i32* %52, align 8
  call void @slot_getsomeattrs(%struct.TupleTableSlot* %15, i32 %53) #9
  %54 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:55:                                     ; preds = %1619
  %56 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %57 = bitcast %union.anon.1* %56 to i32*
  %58 = load i32, i32* %57, align 8
  call void @slot_getsomeattrs(%struct.TupleTableSlot* %17, i32 %58) #9
  %59 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:60:                                     ; preds = %1619
  %61 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %62 = bitcast %union.anon.1* %61 to i32*
  %63 = load i32, i32* %62, align 8
  %64 = load i64*, i64** %18, align 8
  %65 = sext i32 %63 to i64
  %66 = getelementptr i64, i64* %64, i64 %65
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %69 = load i64*, i64** %68, align 8
  store i64 %67, i64* %69, align 8
  %70 = load i8*, i8** %19, align 8
  %71 = getelementptr i8, i8* %70, i64 %65
  %72 = load i8, i8* %71, align 1, !range !2
  %73 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %74 = load i8*, i8** %73, align 8
  store i8 %72, i8* %74, align 1
  %75 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:76:                                     ; preds = %1619
  %77 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %78 = bitcast %union.anon.1* %77 to i32*
  %79 = load i32, i32* %78, align 8
  %80 = load i64*, i64** %20, align 8
  %81 = sext i32 %79 to i64
  %82 = getelementptr i64, i64* %80, i64 %81
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %85 = load i64*, i64** %84, align 8
  store i64 %83, i64* %85, align 8
  %86 = load i8*, i8** %21, align 8
  %87 = getelementptr i8, i8* %86, i64 %81
  %88 = load i8, i8* %87, align 1, !range !2
  %89 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %90 = load i8*, i8** %89, align 8
  store i8 %88, i8* %90, align 1
  %91 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:92:                                     ; preds = %1619
  %93 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %94 = bitcast %union.anon.1* %93 to i32*
  %95 = load i32, i32* %94, align 8
  %96 = load i64*, i64** %22, align 8
  %97 = sext i32 %95 to i64
  %98 = getelementptr i64, i64* %96, i64 %97
  %99 = load i64, i64* %98, align 8
  %100 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %101 = load i64*, i64** %100, align 8
  store i64 %99, i64* %101, align 8
  %102 = load i8*, i8** %23, align 8
  %103 = getelementptr i8, i8* %102, i64 %97
  %104 = load i8, i8* %103, align 1, !range !2
  %105 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %106 = load i8*, i8** %105, align 8
  store i8 %104, i8* %106, align 1
  %107 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:108:                                    ; preds = %1619
  %109 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %110 = bitcast %union.anon.1* %109 to i32*
  %111 = load i32, i32* %110, align 8
  %112 = load %struct.HeapTupleData*, %struct.HeapTupleData** %24, align 8
  %113 = load %struct.tupleDesc*, %struct.tupleDesc** %25, align 8
  %114 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %115 = load i8*, i8** %114, align 8
  %116 = call i64 @heap_getsysattr(%struct.HeapTupleData* %112, i32 %111, %struct.tupleDesc* %113, i8* %115) #9
  %117 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %118 = load i64*, i64** %117, align 8
  store i64 %116, i64* %118, align 8
  %119 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:120:                                    ; preds = %1619
  %121 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %122 = bitcast %union.anon.1* %121 to i32*
  %123 = load i32, i32* %122, align 8
  %124 = load %struct.HeapTupleData*, %struct.HeapTupleData** %26, align 8
  %125 = load %struct.tupleDesc*, %struct.tupleDesc** %27, align 8
  %126 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %127 = load i8*, i8** %126, align 8
  %128 = call i64 @heap_getsysattr(%struct.HeapTupleData* %124, i32 %123, %struct.tupleDesc* %125, i8* %127) #9
  %129 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %130 = load i64*, i64** %129, align 8
  store i64 %128, i64* %130, align 8
  %131 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:132:                                    ; preds = %1619
  %133 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %134 = bitcast %union.anon.1* %133 to i32*
  %135 = load i32, i32* %134, align 8
  %136 = load %struct.HeapTupleData*, %struct.HeapTupleData** %28, align 8
  %137 = load %struct.tupleDesc*, %struct.tupleDesc** %29, align 8
  %138 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %139 = load i8*, i8** %138, align 8
  %140 = call i64 @heap_getsysattr(%struct.HeapTupleData* %136, i32 %135, %struct.tupleDesc* %137, i8* %139) #9
  %141 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %142 = load i64*, i64** %141, align 8
  store i64 %140, i64* %142, align 8
  %143 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:144:                                    ; preds = %1619
  call void @ExecEvalWholeRowVar(%struct.ExprState* undef, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1)
  %145 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:146:                                    ; preds = %1619
  %147 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %148 = bitcast %union.anon.1* %147 to %struct.anon.5*
  %149 = bitcast %union.anon.1* %147 to i32*
  %150 = load i32, i32* %149, align 8
  %151 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %148, i64 0, i32 1
  %152 = load i32, i32* %151, align 4
  %153 = load i64*, i64** %18, align 8
  %154 = sext i32 %152 to i64
  %155 = getelementptr i64, i64* %153, i64 %154
  %156 = load i64, i64* %155, align 8
  %157 = load i64*, i64** %30, align 8
  %158 = sext i32 %150 to i64
  %159 = getelementptr i64, i64* %157, i64 %158
  store i64 %156, i64* %159, align 8
  %160 = load i8*, i8** %19, align 8
  %161 = getelementptr i8, i8* %160, i64 %154
  %162 = load i8, i8* %161, align 1, !range !2
  %163 = load i8*, i8** %31, align 8
  %164 = getelementptr i8, i8* %163, i64 %158
  store i8 %162, i8* %164, align 1
  %165 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:166:                                    ; preds = %1619
  %167 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %168 = bitcast %union.anon.1* %167 to %struct.anon.5*
  %169 = bitcast %union.anon.1* %167 to i32*
  %170 = load i32, i32* %169, align 8
  %171 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %168, i64 0, i32 1
  %172 = load i32, i32* %171, align 4
  %173 = load i64*, i64** %20, align 8
  %174 = sext i32 %172 to i64
  %175 = getelementptr i64, i64* %173, i64 %174
  %176 = load i64, i64* %175, align 8
  %177 = load i64*, i64** %30, align 8
  %178 = sext i32 %170 to i64
  %179 = getelementptr i64, i64* %177, i64 %178
  store i64 %176, i64* %179, align 8
  %180 = load i8*, i8** %21, align 8
  %181 = getelementptr i8, i8* %180, i64 %174
  %182 = load i8, i8* %181, align 1, !range !2
  %183 = load i8*, i8** %31, align 8
  %184 = getelementptr i8, i8* %183, i64 %178
  store i8 %182, i8* %184, align 1
  %185 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:186:                                    ; preds = %1619
  %187 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %188 = bitcast %union.anon.1* %187 to %struct.anon.5*
  %189 = bitcast %union.anon.1* %187 to i32*
  %190 = load i32, i32* %189, align 8
  %191 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %188, i64 0, i32 1
  %192 = load i32, i32* %191, align 4
  %193 = load i64*, i64** %22, align 8
  %194 = sext i32 %192 to i64
  %195 = getelementptr i64, i64* %193, i64 %194
  %196 = load i64, i64* %195, align 8
  %197 = load i64*, i64** %30, align 8
  %198 = sext i32 %190 to i64
  %199 = getelementptr i64, i64* %197, i64 %198
  store i64 %196, i64* %199, align 8
  %200 = load i8*, i8** %23, align 8
  %201 = getelementptr i8, i8* %200, i64 %194
  %202 = load i8, i8* %201, align 1, !range !2
  %203 = load i8*, i8** %31, align 8
  %204 = getelementptr i8, i8* %203, i64 %198
  store i8 %202, i8* %204, align 1
  %205 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:206:                                    ; preds = %1619
  %207 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %208 = bitcast %union.anon.1* %207 to i32*
  %209 = load i32, i32* %208, align 8
  %210 = load i64, i64* %32, align 8
  %211 = load i64*, i64** %30, align 8
  %212 = sext i32 %209 to i64
  %213 = getelementptr i64, i64* %211, i64 %212
  store i64 %210, i64* %213, align 8
  %214 = load i8, i8* %33, align 1, !range !2
  %215 = load i8*, i8** %31, align 8
  %216 = getelementptr i8, i8* %215, i64 %212
  store i8 %214, i8* %216, align 1
  %217 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:218:                                    ; preds = %1619
  %219 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %220 = bitcast %union.anon.1* %219 to i32*
  %221 = load i32, i32* %220, align 8
  %222 = load i8, i8* %33, align 1, !range !2
  %223 = load i8*, i8** %31, align 8
  %224 = sext i32 %221 to i64
  %225 = getelementptr i8, i8* %223, i64 %224
  store i8 %222, i8* %225, align 1
  %226 = load i8*, i8** %31, align 8
  %227 = getelementptr i8, i8* %226, i64 %224
  %228 = load i8, i8* %227, align 1, !range !2
  %229 = icmp eq i8 %228, 0
  %230 = load i64, i64* %32, align 8
  br i1 %229, label %231, label %235

; <label>:231:                                    ; preds = %218
  %232 = call i64 @MakeExpandedObjectReadOnlyInternal(i64 %230) #9
  %233 = load i64*, i64** %30, align 8
  %234 = getelementptr i64, i64* %233, i64 %224
  store i64 %232, i64* %234, align 8
  br label %238

; <label>:235:                                    ; preds = %218
  %236 = load i64*, i64** %30, align 8
  %237 = getelementptr i64, i64* %236, i64 %224
  store i64 %230, i64* %237, align 8
  br label %238

; <label>:238:                                    ; preds = %235, %231
  %239 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:240:                                    ; preds = %1619
  %241 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %242 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %243 = bitcast i8** %242 to i8*
  %244 = load i8, i8* %243, align 8, !range !2
  %245 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %246 = load i8*, i8** %245, align 8
  store i8 %244, i8* %246, align 1
  %247 = bitcast %union.anon.1* %241 to i64*
  %248 = load i64, i64* %247, align 8
  %249 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %250 = load i64*, i64** %249, align 8
  store i64 %248, i64* %250, align 8
  %251 = load i64, i64* %247, align 8
  %252 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.26, i64 0, i64 0), i64 %251)
  %253 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:254:                                    ; preds = %1619
  %255 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %256 = bitcast i8** %255 to %struct.FunctionCallInfoData**
  %257 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %256, align 8
  %258 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %257, i64 0, i32 4
  store i8 0, i8* %258, align 4
  %259 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %260 = bitcast i32* %259 to i64 (%struct.FunctionCallInfoData*)**
  %261 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %260, align 8
  %262 = call i64 %261(%struct.FunctionCallInfoData* %257) #9
  %263 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %264 = load i64*, i64** %263, align 8
  store i64 %262, i64* %264, align 8
  %265 = load i8, i8* %258, align 4, !range !2
  %266 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %267 = load i8*, i8** %266, align 8
  store i8 %265, i8* %267, align 1
  %268 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:269:                                    ; preds = %1619
  %270 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %271 = bitcast i8** %270 to %struct.FunctionCallInfoData**
  %272 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %271, align 8
  %273 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %274 = bitcast %struct.FmgrInfo** %273 to i32*
  %275 = load i32, i32* %274, align 8
  %276 = icmp sgt i32 %275, 0
  br i1 %276, label %279, label %289

; <label>:277:                                    ; preds = %279
  %278 = icmp slt i32 %285, %275
  br i1 %278, label %279, label %289

; <label>:279:                                    ; preds = %277, %269
  %280 = phi i32 [ %285, %277 ], [ 0, %269 ]
  %281 = sext i32 %280 to i64
  %282 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %272, i64 0, i32 7, i64 %281
  %283 = load i8, i8* %282, align 1, !range !2
  %284 = icmp eq i8 %283, 0
  %285 = add nuw i32 %280, 1
  br i1 %284, label %277, label %286

; <label>:286:                                    ; preds = %279
  %287 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %288 = load i8*, i8** %287, align 8
  store i8 1, i8* %288, align 1
  br label %300

; <label>:289:                                    ; preds = %277, %269
  %290 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %272, i64 0, i32 4
  store i8 0, i8* %290, align 4
  %291 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %292 = bitcast i32* %291 to i64 (%struct.FunctionCallInfoData*)**
  %293 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %292, align 8
  %294 = call i64 %293(%struct.FunctionCallInfoData* %272) #9
  %295 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %296 = load i64*, i64** %295, align 8
  store i64 %294, i64* %296, align 8
  %297 = load i8, i8* %290, align 4, !range !2
  %298 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %299 = load i8*, i8** %298, align 8
  store i8 %297, i8* %299, align 1
  br label %300

; <label>:300:                                    ; preds = %289, %286
  %301 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:302:                                    ; preds = %1619
  %303 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %304 = bitcast i8** %303 to %struct.FunctionCallInfoData**
  %305 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %304, align 8
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %34) #9
  call void @pgstat_init_function_usage(%struct.FunctionCallInfoData* %305, %struct.PgStat_FunctionCallUsage* nonnull %5) #9
  %306 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %305, i64 0, i32 4
  store i8 0, i8* %306, align 4
  %307 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %308 = bitcast i32* %307 to i64 (%struct.FunctionCallInfoData*)**
  %309 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %308, align 8
  %310 = call i64 %309(%struct.FunctionCallInfoData* %305) #9
  %311 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %312 = load i64*, i64** %311, align 8
  store i64 %310, i64* %312, align 8
  %313 = load i8, i8* %306, align 4, !range !2
  %314 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %315 = load i8*, i8** %314, align 8
  store i8 %313, i8* %315, align 1
  call void @pgstat_end_function_usage(%struct.PgStat_FunctionCallUsage* nonnull %5, i1 zeroext true) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %34) #9
  %316 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:317:                                    ; preds = %1619
  %318 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %319 = bitcast i8** %318 to %struct.FunctionCallInfoData**
  %320 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %319, align 8
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %35) #9
  %321 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %322 = bitcast %struct.FmgrInfo** %321 to i32*
  %323 = load i32, i32* %322, align 8
  %324 = icmp sgt i32 %323, 0
  br i1 %324, label %327, label %337

; <label>:325:                                    ; preds = %327
  %326 = icmp slt i32 %333, %323
  br i1 %326, label %327, label %337

; <label>:327:                                    ; preds = %325, %317
  %328 = phi i32 [ %333, %325 ], [ 0, %317 ]
  %329 = sext i32 %328 to i64
  %330 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %320, i64 0, i32 7, i64 %329
  %331 = load i8, i8* %330, align 1, !range !2
  %332 = icmp eq i8 %331, 0
  %333 = add nuw i32 %328, 1
  br i1 %332, label %325, label %334

; <label>:334:                                    ; preds = %327
  %335 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %336 = load i8*, i8** %335, align 8
  store i8 1, i8* %336, align 1
  br label %348

; <label>:337:                                    ; preds = %325, %317
  call void @pgstat_init_function_usage(%struct.FunctionCallInfoData* %320, %struct.PgStat_FunctionCallUsage* nonnull %4) #9
  %338 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %320, i64 0, i32 4
  store i8 0, i8* %338, align 4
  %339 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %340 = bitcast i32* %339 to i64 (%struct.FunctionCallInfoData*)**
  %341 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %340, align 8
  %342 = call i64 %341(%struct.FunctionCallInfoData* %320) #9
  %343 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %344 = load i64*, i64** %343, align 8
  store i64 %342, i64* %344, align 8
  %345 = load i8, i8* %338, align 4, !range !2
  %346 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %347 = load i8*, i8** %346, align 8
  store i8 %345, i8* %347, align 1
  call void @pgstat_end_function_usage(%struct.PgStat_FunctionCallUsage* nonnull %4, i1 zeroext true) #9
  br label %348

; <label>:348:                                    ; preds = %337, %334
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %35) #9
  %349 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:350:                                    ; preds = %1619
  %351 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %352 = bitcast %union.anon.1* %351 to i8**
  %353 = load i8*, i8** %352, align 8
  store i8 0, i8* %353, align 1
  br label %354

; <label>:354:                                    ; preds = %1619, %350
  %355 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %356 = load i8*, i8** %355, align 8
  %357 = load i8, i8* %356, align 1, !range !2
  %358 = icmp eq i8 %357, 0
  br i1 %358, label %363, label %359

; <label>:359:                                    ; preds = %354
  %360 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %361 = bitcast %union.anon.1* %360 to i8**
  %362 = load i8*, i8** %361, align 8
  store i8 1, i8* %362, align 1
  br label %375

; <label>:363:                                    ; preds = %354
  %364 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %365 = load i64*, i64** %364, align 8
  %366 = load i64, i64* %365, align 8
  %367 = icmp eq i64 %366, 0
  br i1 %367, label %368, label %375

; <label>:368:                                    ; preds = %363
  %369 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %370 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %371 = bitcast i8** %370 to i32*
  %372 = load i32, i32* %371, align 8
  %373 = sext i32 %372 to i64
  %374 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %369, i64 %373
  br label %48

; <label>:375:                                    ; preds = %363, %359
  %376 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:377:                                    ; preds = %1619
  %378 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %379 = load i8*, i8** %378, align 8
  %380 = load i8, i8* %379, align 1, !range !2
  %381 = icmp eq i8 %380, 0
  br i1 %381, label %382, label %395

; <label>:382:                                    ; preds = %377
  %383 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %384 = load i64*, i64** %383, align 8
  %385 = load i64, i64* %384, align 8
  %386 = icmp eq i64 %385, 0
  br i1 %386, label %395, label %387

; <label>:387:                                    ; preds = %382
  %388 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %389 = bitcast %union.anon.1* %388 to i8**
  %390 = load i8*, i8** %389, align 8
  %391 = load i8, i8* %390, align 1, !range !2
  %392 = icmp eq i8 %391, 0
  br i1 %392, label %395, label %393

; <label>:393:                                    ; preds = %387
  store i64 0, i64* %384, align 8
  %394 = load i8*, i8** %378, align 8
  store i8 1, i8* %394, align 1
  br label %395

; <label>:395:                                    ; preds = %393, %387, %382, %377
  %396 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:397:                                    ; preds = %1619
  %398 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %399 = bitcast %union.anon.1* %398 to i8**
  %400 = load i8*, i8** %399, align 8
  store i8 0, i8* %400, align 1
  br label %401

; <label>:401:                                    ; preds = %1619, %397
  %402 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %403 = load i8*, i8** %402, align 8
  %404 = load i8, i8* %403, align 1, !range !2
  %405 = icmp eq i8 %404, 0
  br i1 %405, label %410, label %406

; <label>:406:                                    ; preds = %401
  %407 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %408 = bitcast %union.anon.1* %407 to i8**
  %409 = load i8*, i8** %408, align 8
  store i8 1, i8* %409, align 1
  br label %422

; <label>:410:                                    ; preds = %401
  %411 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %412 = load i64*, i64** %411, align 8
  %413 = load i64, i64* %412, align 8
  %414 = icmp eq i64 %413, 0
  br i1 %414, label %422, label %415

; <label>:415:                                    ; preds = %410
  %416 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %417 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %418 = bitcast i8** %417 to i32*
  %419 = load i32, i32* %418, align 8
  %420 = sext i32 %419 to i64
  %421 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %416, i64 %420
  br label %48

; <label>:422:                                    ; preds = %410, %406
  %423 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:424:                                    ; preds = %1619
  %425 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %426 = load i8*, i8** %425, align 8
  %427 = load i8, i8* %426, align 1, !range !2
  %428 = icmp eq i8 %427, 0
  br i1 %428, label %429, label %442

; <label>:429:                                    ; preds = %424
  %430 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %431 = load i64*, i64** %430, align 8
  %432 = load i64, i64* %431, align 8
  %433 = icmp eq i64 %432, 0
  br i1 %433, label %434, label %442

; <label>:434:                                    ; preds = %429
  %435 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %436 = bitcast %union.anon.1* %435 to i8**
  %437 = load i8*, i8** %436, align 8
  %438 = load i8, i8* %437, align 1, !range !2
  %439 = icmp eq i8 %438, 0
  br i1 %439, label %442, label %440

; <label>:440:                                    ; preds = %434
  store i64 0, i64* %431, align 8
  %441 = load i8*, i8** %425, align 8
  store i8 1, i8* %441, align 1
  br label %442

; <label>:442:                                    ; preds = %440, %434, %429, %424
  %443 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:444:                                    ; preds = %1619
  %445 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %446 = load i64*, i64** %445, align 8
  %447 = load i64, i64* %446, align 8
  %448 = icmp eq i64 %447, 0
  %449 = zext i1 %448 to i64
  store i64 %449, i64* %446, align 8
  %450 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:451:                                    ; preds = %1619
  %452 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %453 = load i8*, i8** %452, align 8
  %454 = load i8, i8* %453, align 1, !range !2
  %455 = icmp eq i8 %454, 0
  %456 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  br i1 %455, label %457, label %461

; <label>:457:                                    ; preds = %451
  %458 = load i64*, i64** %456, align 8
  %459 = load i64, i64* %458, align 8
  %460 = icmp eq i64 %459, 0
  br i1 %460, label %461, label %469

; <label>:461:                                    ; preds = %457, %451
  store i8 0, i8* %453, align 1
  %462 = load i64*, i64** %456, align 8
  store i64 0, i64* %462, align 8
  %463 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %464 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %465 = bitcast %union.anon.1* %464 to i32*
  %466 = load i32, i32* %465, align 8
  %467 = sext i32 %466 to i64
  %468 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %463, i64 %467
  br label %48

; <label>:469:                                    ; preds = %457
  %470 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:471:                                    ; preds = %1619
  %472 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %473 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %474 = bitcast %union.anon.1* %473 to i32*
  %475 = load i32, i32* %474, align 8
  %476 = sext i32 %475 to i64
  %477 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %472, i64 %476
  br label %48

; <label>:478:                                    ; preds = %1619
  %479 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %480 = load i8*, i8** %479, align 8
  %481 = load i8, i8* %480, align 1, !range !2
  %482 = icmp eq i8 %481, 0
  br i1 %482, label %490, label %483

; <label>:483:                                    ; preds = %478
  %484 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %485 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %486 = bitcast %union.anon.1* %485 to i32*
  %487 = load i32, i32* %486, align 8
  %488 = sext i32 %487 to i64
  %489 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %484, i64 %488
  br label %48

; <label>:490:                                    ; preds = %478
  %491 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:492:                                    ; preds = %1619
  %493 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %494 = load i8*, i8** %493, align 8
  %495 = load i8, i8* %494, align 1, !range !2
  %496 = icmp eq i8 %495, 0
  br i1 %496, label %497, label %504

; <label>:497:                                    ; preds = %492
  %498 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %499 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %500 = bitcast %union.anon.1* %499 to i32*
  %501 = load i32, i32* %500, align 8
  %502 = sext i32 %501 to i64
  %503 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %498, i64 %502
  br label %48

; <label>:504:                                    ; preds = %492
  %505 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:506:                                    ; preds = %1619
  %507 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %508 = load i8*, i8** %507, align 8
  %509 = load i8, i8* %508, align 1, !range !2
  %510 = icmp eq i8 %509, 0
  br i1 %510, label %511, label %516

; <label>:511:                                    ; preds = %506
  %512 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %513 = load i64*, i64** %512, align 8
  %514 = load i64, i64* %513, align 8
  %515 = icmp eq i64 %514, 0
  br i1 %515, label %516, label %523

; <label>:516:                                    ; preds = %511, %506
  %517 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %518 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %519 = bitcast %union.anon.1* %518 to i32*
  %520 = load i32, i32* %519, align 8
  %521 = sext i32 %520 to i64
  %522 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %517, i64 %521
  br label %48

; <label>:523:                                    ; preds = %511
  %524 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:525:                                    ; preds = %1619
  %526 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %527 = load i8*, i8** %526, align 8
  %528 = load i8, i8* %527, align 1, !range !2
  %529 = zext i8 %528 to i64
  %530 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %531 = load i64*, i64** %530, align 8
  store i64 %529, i64* %531, align 8
  %532 = load i8*, i8** %526, align 8
  store i8 0, i8* %532, align 1
  %533 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:534:                                    ; preds = %1619
  %535 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %536 = load i8*, i8** %535, align 8
  %537 = load i8, i8* %536, align 1, !range !2
  %538 = xor i8 %537, 1
  %539 = zext i8 %538 to i64
  %540 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %541 = load i64*, i64** %540, align 8
  store i64 %539, i64* %541, align 8
  %542 = load i8*, i8** %535, align 8
  store i8 0, i8* %542, align 1
  %543 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:544:                                    ; preds = %1619
  call fastcc void @ExecEvalRowNullInt(%struct.ExprEvalStep* %1620, %struct.ExprContext* %1, i1 zeroext true) #9
  %545 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:546:                                    ; preds = %1619
  call fastcc void @ExecEvalRowNullInt(%struct.ExprEvalStep* %1620, %struct.ExprContext* %1, i1 zeroext false) #9
  %547 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:548:                                    ; preds = %1619
  %549 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %550 = load i8*, i8** %549, align 8
  %551 = load i8, i8* %550, align 1, !range !2
  %552 = icmp eq i8 %551, 0
  br i1 %552, label %557, label %553

; <label>:553:                                    ; preds = %548
  %554 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %555 = load i64*, i64** %554, align 8
  store i64 0, i64* %555, align 8
  %556 = load i8*, i8** %549, align 8
  store i8 0, i8* %556, align 1
  br label %557

; <label>:557:                                    ; preds = %553, %548
  %558 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:559:                                    ; preds = %1619
  %560 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %561 = load i8*, i8** %560, align 8
  %562 = load i8, i8* %561, align 1, !range !2
  %563 = icmp eq i8 %562, 0
  %564 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %565 = load i64*, i64** %564, align 8
  br i1 %563, label %568, label %566

; <label>:566:                                    ; preds = %559
  store i64 1, i64* %565, align 8
  %567 = load i8*, i8** %560, align 8
  store i8 0, i8* %567, align 1
  br label %572

; <label>:568:                                    ; preds = %559
  %569 = load i64, i64* %565, align 8
  %570 = icmp eq i64 %569, 0
  %571 = zext i1 %570 to i64
  store i64 %571, i64* %565, align 8
  br label %572

; <label>:572:                                    ; preds = %568, %566
  %573 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:574:                                    ; preds = %1619
  %575 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %576 = load i8*, i8** %575, align 8
  %577 = load i8, i8* %576, align 1, !range !2
  %578 = icmp eq i8 %577, 0
  %579 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %580 = load i64*, i64** %579, align 8
  br i1 %578, label %583, label %581

; <label>:581:                                    ; preds = %574
  store i64 0, i64* %580, align 8
  %582 = load i8*, i8** %575, align 8
  store i8 0, i8* %582, align 1
  br label %587

; <label>:583:                                    ; preds = %574
  %584 = load i64, i64* %580, align 8
  %585 = icmp eq i64 %584, 0
  %586 = zext i1 %585 to i64
  store i64 %586, i64* %580, align 8
  br label %587

; <label>:587:                                    ; preds = %583, %581
  %588 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:589:                                    ; preds = %1619
  %590 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %591 = load i8*, i8** %590, align 8
  %592 = load i8, i8* %591, align 1, !range !2
  %593 = icmp eq i8 %592, 0
  br i1 %593, label %598, label %594

; <label>:594:                                    ; preds = %589
  %595 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %596 = load i64*, i64** %595, align 8
  store i64 1, i64* %596, align 8
  %597 = load i8*, i8** %590, align 8
  store i8 0, i8* %597, align 1
  br label %598

; <label>:598:                                    ; preds = %594, %589
  %599 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:600:                                    ; preds = %1619
  %601 = load %struct.ParamExecData*, %struct.ParamExecData** %36, align 8
  %602 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %603 = bitcast %union.anon.1* %602 to i32*
  %604 = load i32, i32* %603, align 8
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %601, i64 %605, i32 0
  %607 = load i8*, i8** %606, align 8
  %608 = icmp eq i8* %607, null
  br i1 %608, label %611, label %609, !prof !4

; <label>:609:                                    ; preds = %600
  %610 = bitcast i8* %607 to %struct.SubPlanState*
  call void @ExecSetParamPlan(%struct.SubPlanState* %610, %struct.ExprContext* nonnull %1) #9
  br label %611

; <label>:611:                                    ; preds = %609, %600
  %612 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %601, i64 %605, i32 1
  %613 = load i64, i64* %612, align 8
  %614 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %615 = load i64*, i64** %614, align 8
  store i64 %613, i64* %615, align 8
  %616 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %601, i64 %605, i32 2
  %617 = load i8, i8* %616, align 8, !range !2
  %618 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %619 = load i8*, i8** %618, align 8
  store i8 %617, i8* %619, align 1
  %620 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:621:                                    ; preds = %1619
  call void @ExecEvalParamExtern(%struct.ExprState* undef, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1)
  %622 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:623:                                    ; preds = %1619
  %624 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %625 = bitcast %union.anon.1* %624 to void (%struct.ExprState*, %struct.ExprEvalStep*, %struct.ExprContext*)**
  %626 = load void (%struct.ExprState*, %struct.ExprEvalStep*, %struct.ExprContext*)*, void (%struct.ExprState*, %struct.ExprEvalStep*, %struct.ExprContext*)** %625, align 8
  call void %626(%struct.ExprState* nonnull %0, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1) #9
  %627 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:628:                                    ; preds = %1619
  %629 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 0
  %630 = load i64*, i64** %629, align 8
  %631 = icmp eq i64* %630, null
  br i1 %631, label %641, label %632

; <label>:632:                                    ; preds = %628
  %633 = load i64, i64* %630, align 8
  %634 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %635 = load i64*, i64** %634, align 8
  store i64 %633, i64* %635, align 8
  %636 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %637 = load i8*, i8** %636, align 8
  %638 = load i8, i8* %637, align 1, !range !2
  %639 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %640 = load i8*, i8** %639, align 8
  store i8 %638, i8* %640, align 1
  br label %648

; <label>:641:                                    ; preds = %628
  %642 = load i64, i64* %39, align 8
  %643 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %644 = load i64*, i64** %643, align 8
  store i64 %642, i64* %644, align 8
  %645 = load i8, i8* %40, align 8, !range !2
  %646 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %647 = load i8*, i8** %646, align 8
  store i8 %645, i8* %647, align 1
  br label %648

; <label>:648:                                    ; preds = %641, %632
  %649 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:650:                                    ; preds = %1619
  %651 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 0
  %652 = load i64*, i64** %651, align 8
  %653 = icmp eq i64* %652, null
  br i1 %653, label %663, label %654

; <label>:654:                                    ; preds = %650
  %655 = load i64, i64* %652, align 8
  %656 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %657 = load i64*, i64** %656, align 8
  store i64 %655, i64* %657, align 8
  %658 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %659 = load i8*, i8** %658, align 8
  %660 = load i8, i8* %659, align 1, !range !2
  %661 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %662 = load i8*, i8** %661, align 8
  store i8 %660, i8* %662, align 1
  br label %670

; <label>:663:                                    ; preds = %650
  %664 = load i64, i64* %41, align 8
  %665 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %666 = load i64*, i64** %665, align 8
  store i64 %664, i64* %666, align 8
  %667 = load i8, i8* %42, align 8, !range !2
  %668 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %669 = load i8*, i8** %668, align 8
  store i8 %667, i8* %669, align 1
  br label %670

; <label>:670:                                    ; preds = %663, %654
  %671 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:672:                                    ; preds = %1619
  %673 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %674 = load i8*, i8** %673, align 8
  %675 = load i8, i8* %674, align 1, !range !2
  %676 = icmp eq i8 %675, 0
  br i1 %676, label %677, label %686

; <label>:677:                                    ; preds = %672
  %678 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 0
  %679 = load i64*, i64** %678, align 8
  %680 = load i64, i64* %679, align 8
  %681 = call i64 @MakeExpandedObjectReadOnlyInternal(i64 %680) #9
  %682 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %683 = load i64*, i64** %682, align 8
  store i64 %681, i64* %683, align 8
  %684 = load i8*, i8** %673, align 8
  %685 = load i8, i8* %684, align 1, !range !2
  br label %686

; <label>:686:                                    ; preds = %677, %672
  %687 = phi i8 [ 1, %672 ], [ %685, %677 ]
  %688 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %689 = load i8*, i8** %688, align 8
  store i8 %687, i8* %689, align 1
  %690 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:691:                                    ; preds = %1619
  %692 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %693 = load i8*, i8** %692, align 8
  %694 = load i8, i8* %693, align 1, !range !2
  %695 = icmp eq i8 %694, 0
  br i1 %695, label %696, label %712

; <label>:696:                                    ; preds = %691
  %697 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %698 = bitcast i8** %697 to %struct.FunctionCallInfoData**
  %699 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %698, align 8
  %700 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %701 = load i64*, i64** %700, align 8
  %702 = load i64, i64* %701, align 8
  %703 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %699, i64 0, i32 6, i64 0
  store i64 %702, i64* %703, align 8
  %704 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %699, i64 0, i32 7, i64 0
  store i8 0, i8* %704, align 8
  %705 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %699, i64 0, i32 4
  store i8 0, i8* %705, align 4
  %706 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %699, i64 0, i32 0
  %707 = load %struct.FmgrInfo*, %struct.FmgrInfo** %706, align 8
  %708 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %707, i64 0, i32 0
  %709 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %708, align 8
  %710 = call i64 %709(%struct.FunctionCallInfoData* %699) #9
  %711 = inttoptr i64 %710 to i8*
  br label %712

; <label>:712:                                    ; preds = %696, %691
  %713 = phi i8* [ %711, %696 ], [ null, %691 ]
  %714 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %715 = bitcast i32* %714 to %struct.FmgrInfo**
  %716 = load %struct.FmgrInfo*, %struct.FmgrInfo** %715, align 8
  %717 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %716, i64 0, i32 3
  %718 = load i8, i8* %717, align 2, !range !2
  %719 = icmp eq i8 %718, 0
  %720 = icmp ne i8* %713, null
  %721 = or i1 %720, %719
  br i1 %721, label %722, label %739

; <label>:722:                                    ; preds = %712
  %723 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %724 = bitcast %struct.FmgrInfo** %723 to %struct.FunctionCallInfoData**
  %725 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %724, align 8
  %726 = ptrtoint i8* %713 to i64
  %727 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %725, i64 0, i32 6, i64 0
  store i64 %726, i64* %727, align 8
  %728 = load i8*, i8** %692, align 8
  %729 = load i8, i8* %728, align 1, !range !2
  %730 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %725, i64 0, i32 7, i64 0
  store i8 %729, i8* %730, align 8
  %731 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %725, i64 0, i32 4
  store i8 0, i8* %731, align 4
  %732 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %725, i64 0, i32 0
  %733 = load %struct.FmgrInfo*, %struct.FmgrInfo** %732, align 8
  %734 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %733, i64 0, i32 0
  %735 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %734, align 8
  %736 = call i64 %735(%struct.FunctionCallInfoData* %725) #9
  %737 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %738 = load i64*, i64** %737, align 8
  store i64 %736, i64* %738, align 8
  br label %739

; <label>:739:                                    ; preds = %722, %712
  %740 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:741:                                    ; preds = %1619
  %742 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %743 = bitcast i8** %742 to %struct.FunctionCallInfoData**
  %744 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %743, align 8
  %745 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %744, i64 0, i32 7, i64 0
  %746 = load i8, i8* %745, align 8, !range !2
  %747 = icmp eq i8 %746, 0
  %748 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %744, i64 0, i32 7, i64 1
  %749 = load i8, i8* %748, align 1, !range !2
  %750 = icmp eq i8 %749, 0
  br i1 %747, label %757, label %751

; <label>:751:                                    ; preds = %741
  br i1 %750, label %758, label %752

; <label>:752:                                    ; preds = %751
  %753 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %754 = load i64*, i64** %753, align 8
  store i64 0, i64* %754, align 8
  %755 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %756 = load i8*, i8** %755, align 8
  store i8 0, i8* %756, align 1
  br label %776

; <label>:757:                                    ; preds = %741
  br i1 %750, label %763, label %758

; <label>:758:                                    ; preds = %757, %751
  %759 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %760 = load i64*, i64** %759, align 8
  store i64 1, i64* %760, align 8
  %761 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %762 = load i8*, i8** %761, align 8
  store i8 0, i8* %762, align 1
  br label %776

; <label>:763:                                    ; preds = %757
  %764 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %744, i64 0, i32 4
  store i8 0, i8* %764, align 4
  %765 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %766 = bitcast i32* %765 to i64 (%struct.FunctionCallInfoData*)**
  %767 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %766, align 8
  %768 = call i64 %767(%struct.FunctionCallInfoData* nonnull %744) #9
  %769 = icmp eq i64 %768, 0
  %770 = zext i1 %769 to i64
  %771 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %772 = load i64*, i64** %771, align 8
  store i64 %770, i64* %772, align 8
  %773 = load i8, i8* %764, align 4, !range !2
  %774 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %775 = load i8*, i8** %774, align 8
  store i8 %773, i8* %775, align 1
  br label %776

; <label>:776:                                    ; preds = %763, %758, %752
  %777 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:778:                                    ; preds = %1619
  %779 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %780 = bitcast i8** %779 to %struct.FunctionCallInfoData**
  %781 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %780, align 8
  %782 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %781, i64 0, i32 7, i64 0
  %783 = load i8, i8* %782, align 8, !range !2
  %784 = icmp eq i8 %783, 0
  %785 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %781, i64 0, i32 7, i64 1
  %786 = load i8, i8* %785, align 1, !range !2
  %787 = icmp eq i8 %786, 0
  br i1 %784, label %794, label %788

; <label>:788:                                    ; preds = %778
  br i1 %787, label %795, label %789

; <label>:789:                                    ; preds = %788
  %790 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %791 = load i64*, i64** %790, align 8
  store i64 1, i64* %791, align 8
  %792 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %793 = load i8*, i8** %792, align 8
  store i8 0, i8* %793, align 1
  br label %811

; <label>:794:                                    ; preds = %778
  br i1 %787, label %800, label %795

; <label>:795:                                    ; preds = %794, %788
  %796 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %797 = load i64*, i64** %796, align 8
  store i64 0, i64* %797, align 8
  %798 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %799 = load i8*, i8** %798, align 8
  store i8 0, i8* %799, align 1
  br label %811

; <label>:800:                                    ; preds = %794
  %801 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %781, i64 0, i32 4
  store i8 0, i8* %801, align 4
  %802 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %803 = bitcast i32* %802 to i64 (%struct.FunctionCallInfoData*)**
  %804 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %803, align 8
  %805 = call i64 %804(%struct.FunctionCallInfoData* nonnull %781) #9
  %806 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %807 = load i64*, i64** %806, align 8
  store i64 %805, i64* %807, align 8
  %808 = load i8, i8* %801, align 4, !range !2
  %809 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %810 = load i8*, i8** %809, align 8
  store i8 %808, i8* %810, align 1
  br label %811

; <label>:811:                                    ; preds = %800, %795, %789
  %812 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:813:                                    ; preds = %1619
  %814 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %815 = bitcast i8** %814 to %struct.FunctionCallInfoData**
  %816 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %815, align 8
  %817 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %816, i64 0, i32 7, i64 0
  %818 = load i8, i8* %817, align 8, !range !2
  %819 = icmp eq i8 %818, 0
  br i1 %819, label %820, label %840

; <label>:820:                                    ; preds = %813
  %821 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %816, i64 0, i32 7, i64 1
  %822 = load i8, i8* %821, align 1, !range !2
  %823 = icmp eq i8 %822, 0
  br i1 %823, label %824, label %840

; <label>:824:                                    ; preds = %820
  %825 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %816, i64 0, i32 4
  store i8 0, i8* %825, align 4
  %826 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %827 = bitcast i32* %826 to i64 (%struct.FunctionCallInfoData*)**
  %828 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %827, align 8
  %829 = call i64 %828(%struct.FunctionCallInfoData* nonnull %816) #9
  %830 = load i8, i8* %825, align 4, !range !2
  %831 = icmp eq i8 %830, 0
  %832 = icmp ne i64 %829, 0
  %833 = and i1 %832, %831
  br i1 %833, label %834, label %840

; <label>:834:                                    ; preds = %824
  %835 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %836 = load i64*, i64** %835, align 8
  store i64 0, i64* %836, align 8
  %837 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %838 = load i8*, i8** %837, align 8
  store i8 1, i8* %838, align 1
  %839 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:840:                                    ; preds = %824, %820, %813
  %841 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %816, i64 0, i32 6, i64 0
  %842 = load i64, i64* %841, align 8
  %843 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %844 = load i64*, i64** %843, align 8
  store i64 %842, i64* %844, align 8
  %845 = load i8, i8* %817, align 8, !range !2
  %846 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %847 = load i8*, i8** %846, align 8
  store i8 %845, i8* %847, align 1
  %848 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:849:                                    ; preds = %1619
  call void @ExecEvalSQLValueFunction(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %850 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:851:                                    ; preds = %1619
  call void @ExecEvalCurrentOfExpr(%struct.ExprState* undef, %struct.ExprEvalStep* undef)
  unreachable

; <label>:852:                                    ; preds = %1619
  %853 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %854 = bitcast %union.anon.1* %853 to %struct.anon.19*
  %855 = bitcast %union.anon.1* %853 to i32*
  %856 = load i32, i32* %855, align 8
  %857 = call i64 @nextval_internal(i32 %856, i1 zeroext false) #9
  %858 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %854, i64 0, i32 1
  %859 = load i32, i32* %858, align 4
  switch i32 %859, label %873 [
    i32 21, label %860
    i32 23, label %865
    i32 20, label %870
  ]

; <label>:860:                                    ; preds = %852
  %861 = shl i64 %857, 48
  %862 = ashr exact i64 %861, 48
  %863 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %864 = load i64*, i64** %863, align 8
  store i64 %862, i64* %864, align 8
  br label %877

; <label>:865:                                    ; preds = %852
  %866 = shl i64 %857, 32
  %867 = ashr exact i64 %866, 32
  %868 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %869 = load i64*, i64** %868, align 8
  store i64 %867, i64* %869, align 8
  br label %877

; <label>:870:                                    ; preds = %852
  %871 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %872 = load i64*, i64** %871, align 8
  store i64 %857, i64* %872, align 8
  br label %877

; <label>:873:                                    ; preds = %852
  %874 = bitcast %union.anon.1* %853 to %struct.anon.19*
  %875 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %874, i64 0, i32 1
  call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2418, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @__func__.ExecEvalNextValueExpr, i64 0, i64 0)) #9
  %876 = load i32, i32* %875, align 4
  call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0), i32 %876) #9
  unreachable

; <label>:877:                                    ; preds = %870, %865, %860
  %878 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %879 = load i8*, i8** %878, align 8
  store i8 0, i8* %879, align 1
  %880 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:881:                                    ; preds = %1619
  call void @ExecEvalArrayExpr(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %882 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:883:                                    ; preds = %1619
  %884 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %885 = load i8*, i8** %884, align 8
  %886 = load i8, i8* %885, align 1, !range !2
  %887 = icmp eq i8 %886, 0
  br i1 %887, label %888, label %915

; <label>:888:                                    ; preds = %883
  %889 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %890 = load i64*, i64** %889, align 8
  %891 = load i64, i64* %890, align 8
  %892 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %893 = bitcast %union.anon.1* %892 to %struct.ExprState**
  %894 = load %struct.ExprState*, %struct.ExprState** %893, align 8
  %895 = icmp eq %struct.ExprState* %894, null
  br i1 %895, label %896, label %906

; <label>:896:                                    ; preds = %888
  %897 = inttoptr i64 %891 to %struct.varlena*
  %898 = call %struct.varlena* @pg_detoast_datum_copy(%struct.varlena* %897) #9
  %899 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %900 = bitcast i8** %899 to i32*
  %901 = load i32, i32* %900, align 8
  %902 = getelementptr inbounds %struct.varlena, %struct.varlena* %898, i64 3
  %903 = bitcast %struct.varlena* %902 to i32*
  store i32 %901, i32* %903, align 4
  %904 = ptrtoint %struct.varlena* %898 to i64
  %905 = load i64*, i64** %889, align 8
  store i64 %904, i64* %905, align 8
  br label %915

; <label>:906:                                    ; preds = %888
  %907 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %908 = bitcast i8** %907 to i32*
  %909 = load i32, i32* %908, align 8
  %910 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %911 = bitcast i32* %910 to %struct.ArrayMapState**
  %912 = load %struct.ArrayMapState*, %struct.ArrayMapState** %911, align 8
  %913 = call i64 @array_map(i64 %891, %struct.ExprState* nonnull %894, %struct.ExprContext* %1, i32 %909, %struct.ArrayMapState* %912) #9
  %914 = load i64*, i64** %889, align 8
  store i64 %913, i64* %914, align 8
  br label %915

; <label>:915:                                    ; preds = %906, %896, %883
  %916 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:917:                                    ; preds = %1619
  %918 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %919 = bitcast %union.anon.1* %918 to %struct.tupleDesc**
  %920 = load %struct.tupleDesc*, %struct.tupleDesc** %919, align 8
  %921 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %922 = bitcast i8** %921 to i64**
  %923 = load i64*, i64** %922, align 8
  %924 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %925 = bitcast i32* %924 to i8**
  %926 = load i8*, i8** %925, align 8
  %927 = call %struct.HeapTupleData* @heap_form_tuple(%struct.tupleDesc* %920, i64* %923, i8* %926) #9
  %928 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %927, i64 0, i32 3
  %929 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %928, align 8
  %930 = call i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData* %929) #9
  %931 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %932 = load i64*, i64** %931, align 8
  store i64 %930, i64* %932, align 8
  %933 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %934 = load i8*, i8** %933, align 8
  store i8 0, i8* %934, align 1
  %935 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:936:                                    ; preds = %1619
  %937 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %938 = bitcast %union.anon.1* %937 to %struct.anon.23*
  %939 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %940 = bitcast i8** %939 to %struct.FunctionCallInfoData**
  %941 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %940, align 8
  %942 = bitcast %union.anon.1* %937 to %struct.FmgrInfo**
  %943 = load %struct.FmgrInfo*, %struct.FmgrInfo** %942, align 8
  %944 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %943, i64 0, i32 3
  %945 = load i8, i8* %944, align 2, !range !2
  %946 = icmp eq i8 %945, 0
  br i1 %946, label %964, label %947

; <label>:947:                                    ; preds = %936
  %948 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %941, i64 0, i32 7, i64 0
  %949 = load i8, i8* %948, align 8, !range !2
  %950 = icmp eq i8 %949, 0
  br i1 %950, label %951, label %955

; <label>:951:                                    ; preds = %947
  %952 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %941, i64 0, i32 7, i64 1
  %953 = load i8, i8* %952, align 1, !range !2
  %954 = icmp eq i8 %953, 0
  br i1 %954, label %964, label %955

; <label>:955:                                    ; preds = %951, %947
  %956 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %957 = load i8*, i8** %956, align 8
  store i8 1, i8* %957, align 1
  %958 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %959 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %960 = bitcast %struct.FmgrInfo** %959 to i32*
  %961 = load i32, i32* %960, align 8
  %962 = sext i32 %961 to i64
  %963 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %958, i64 %962
  br label %48

; <label>:964:                                    ; preds = %951, %936
  %965 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %941, i64 0, i32 4
  store i8 0, i8* %965, align 4
  %966 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %967 = bitcast i32* %966 to i64 (%struct.FunctionCallInfoData*)**
  %968 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %967, align 8
  %969 = call i64 %968(%struct.FunctionCallInfoData* %941) #9
  %970 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %971 = load i64*, i64** %970, align 8
  store i64 %969, i64* %971, align 8
  %972 = load i8, i8* %965, align 4, !range !2
  %973 = icmp eq i8 %972, 0
  %974 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %975 = load i8*, i8** %974, align 8
  br i1 %973, label %983, label %976

; <label>:976:                                    ; preds = %964
  store i8 1, i8* %975, align 1
  %977 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %978 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %979 = bitcast %struct.FmgrInfo** %978 to i32*
  %980 = load i32, i32* %979, align 8
  %981 = sext i32 %980 to i64
  %982 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %977, i64 %981
  br label %48

; <label>:983:                                    ; preds = %964
  store i8 0, i8* %975, align 1
  %984 = load i64*, i64** %970, align 8
  %985 = load i64, i64* %984, align 8
  %986 = trunc i64 %985 to i32
  %987 = icmp eq i32 %986, 0
  br i1 %987, label %994, label %988

; <label>:988:                                    ; preds = %983
  %989 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %990 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %938, i64 0, i32 4
  %991 = load i32, i32* %990, align 4
  %992 = sext i32 %991 to i64
  %993 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %989, i64 %992
  br label %48

; <label>:994:                                    ; preds = %983
  %995 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:996:                                    ; preds = %1619
  %997 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %998 = load i64*, i64** %997, align 8
  %999 = load i64, i64* %998, align 8
  %1000 = trunc i64 %999 to i32
  %1001 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1002 = bitcast %union.anon.1* %1001 to i32*
  %1003 = load i32, i32* %1002, align 8
  %1004 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1005 = load i8*, i8** %1004, align 8
  store i8 0, i8* %1005, align 1
  switch i32 %1003, label %1023 [
    i32 1, label %1006
    i32 2, label %1010
    i32 4, label %1014
    i32 5, label %1019
  ]

; <label>:1006:                                   ; preds = %996
  %1007 = lshr i64 %999, 31
  %1008 = and i64 %1007, 1
  %1009 = load i64*, i64** %997, align 8
  store i64 %1008, i64* %1009, align 8
  br label %1023

; <label>:1010:                                   ; preds = %996
  %1011 = icmp slt i32 %1000, 1
  %1012 = zext i1 %1011 to i64
  %1013 = load i64*, i64** %997, align 8
  store i64 %1012, i64* %1013, align 8
  br label %1023

; <label>:1014:                                   ; preds = %996
  %1015 = lshr i64 %999, 31
  %1016 = and i64 %1015, 1
  %1017 = xor i64 %1016, 1
  %1018 = load i64*, i64** %997, align 8
  store i64 %1017, i64* %1018, align 8
  br label %1023

; <label>:1019:                                   ; preds = %996
  %1020 = icmp sgt i32 %1000, 0
  %1021 = zext i1 %1020 to i64
  %1022 = load i64*, i64** %997, align 8
  store i64 %1021, i64* %1022, align 8
  br label %1023

; <label>:1023:                                   ; preds = %1019, %1014, %1010, %1006, %996
  %1024 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1025:                                   ; preds = %1619
  %1026 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 0
  %1027 = load i64*, i64** %1026, align 8
  %1028 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1029 = load i8*, i8** %1028, align 8
  %1030 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 5
  %1031 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %1030, align 8
  %1032 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 3
  %1033 = load i32, i32* %1032, align 4
  %1034 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1035 = load i8*, i8** %1034, align 8
  store i8 1, i8* %1035, align 1
  %1036 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1037 = load i32, i32* %1036, align 8
  %1038 = icmp sgt i32 %1037, 0
  br i1 %1038, label %1039, label %1090

; <label>:1039:                                   ; preds = %1025
  %1040 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1041 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1031, i64 0, i32 6, i64 0
  %1042 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1031, i64 0, i32 6, i64 1
  %1043 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1031, i64 0, i32 4
  %1044 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1031, i64 0, i32 0
  %1045 = icmp eq i32 %1033, 1
  %1046 = icmp eq i32 %1033, 0
  br label %1047

; <label>:1047:                                   ; preds = %1085, %1039
  %1048 = phi i64 [ 0, %1039 ], [ %1086, %1085 ]
  %1049 = getelementptr i8, i8* %1029, i64 %1048
  %1050 = load i8, i8* %1049, align 1, !range !2
  %1051 = icmp eq i8 %1050, 0
  br i1 %1051, label %1052, label %1085

; <label>:1052:                                   ; preds = %1047
  %1053 = load i8*, i8** %1034, align 8
  %1054 = load i8, i8* %1053, align 1, !range !2
  %1055 = icmp eq i8 %1054, 0
  br i1 %1055, label %1061, label %1056

; <label>:1056:                                   ; preds = %1052
  %1057 = getelementptr i64, i64* %1027, i64 %1048
  %1058 = load i64, i64* %1057, align 8
  %1059 = load i64*, i64** %1040, align 8
  store i64 %1058, i64* %1059, align 8
  %1060 = load i8*, i8** %1034, align 8
  store i8 0, i8* %1060, align 1
  br label %1085

; <label>:1061:                                   ; preds = %1052
  %1062 = load i64*, i64** %1040, align 8
  %1063 = load i64, i64* %1062, align 8
  store i64 %1063, i64* %1041, align 8
  %1064 = getelementptr i64, i64* %1027, i64 %1048
  %1065 = load i64, i64* %1064, align 8
  store i64 %1065, i64* %1042, align 8
  store i8 0, i8* %1043, align 4
  %1066 = load %struct.FmgrInfo*, %struct.FmgrInfo** %1044, align 8
  %1067 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %1066, i64 0, i32 0
  %1068 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %1067, align 8
  %1069 = call i64 %1068(%struct.FunctionCallInfoData* %1031) #9
  %1070 = trunc i64 %1069 to i32
  %1071 = load i8, i8* %1043, align 4, !range !2
  %1072 = icmp eq i8 %1071, 0
  br i1 %1072, label %1073, label %1085

; <label>:1073:                                   ; preds = %1061
  %1074 = icmp sgt i32 %1070, 0
  %1075 = and i1 %1045, %1074
  br i1 %1075, label %1076, label %1079

; <label>:1076:                                   ; preds = %1073
  %1077 = load i64, i64* %1064, align 8
  %1078 = load i64*, i64** %1040, align 8
  store i64 %1077, i64* %1078, align 8
  br label %1085

; <label>:1079:                                   ; preds = %1073
  %1080 = icmp slt i32 %1070, 0
  %1081 = and i1 %1046, %1080
  br i1 %1081, label %1082, label %1085

; <label>:1082:                                   ; preds = %1079
  %1083 = load i64, i64* %1064, align 8
  %1084 = load i64*, i64** %1040, align 8
  store i64 %1083, i64* %1084, align 8
  br label %1085

; <label>:1085:                                   ; preds = %1082, %1079, %1076, %1061, %1056, %1047
  %1086 = add nuw nsw i64 %1048, 1
  %1087 = load i32, i32* %1036, align 8
  %1088 = sext i32 %1087 to i64
  %1089 = icmp slt i64 %1086, %1088
  br i1 %1089, label %1047, label %1090

; <label>:1090:                                   ; preds = %1085, %1025
  %1091 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1092:                                   ; preds = %1619
  call void @ExecEvalFieldSelect(%struct.ExprState* undef, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1)
  %1093 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1094:                                   ; preds = %1619
  call void @ExecEvalFieldStoreDeForm(%struct.ExprState* undef, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1)
  %1095 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1096:                                   ; preds = %1619
  %1097 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1098 = bitcast i8** %1097 to %struct.tupleDesc***
  %1099 = load %struct.tupleDesc**, %struct.tupleDesc*** %1098, align 8
  %1100 = load %struct.tupleDesc*, %struct.tupleDesc** %1099, align 8
  %1101 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1102 = bitcast i32* %1101 to i64**
  %1103 = load i64*, i64** %1102, align 8
  %1104 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1105 = bitcast %struct.FmgrInfo** %1104 to i8**
  %1106 = load i8*, i8** %1105, align 8
  %1107 = call %struct.HeapTupleData* @heap_form_tuple(%struct.tupleDesc* %1100, i64* %1103, i8* %1106) #9
  %1108 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %1107, i64 0, i32 3
  %1109 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %1108, align 8
  %1110 = call i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData* %1109) #9
  %1111 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1112 = load i64*, i64** %1111, align 8
  store i64 %1110, i64* %1112, align 8
  %1113 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1114 = load i8*, i8** %1113, align 8
  store i8 0, i8* %1114, align 1
  %1115 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1116:                                   ; preds = %1619
  %1117 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1118 = bitcast %union.anon.1* %1117 to %struct.ArrayRefState**
  %1119 = load %struct.ArrayRefState*, %struct.ArrayRefState** %1118, align 8
  %1120 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1119, i64 0, i32 13
  %1121 = load i8, i8* %1120, align 8, !range !2
  %1122 = icmp eq i8 %1121, 0
  br i1 %1122, label %1131, label %1123

; <label>:1123:                                   ; preds = %1116
  %1124 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1119, i64 0, i32 0
  %1125 = load i8, i8* %1124, align 8, !range !2
  %1126 = icmp eq i8 %1125, 0
  br i1 %1126, label %1148, label %1127

; <label>:1127:                                   ; preds = %1123
  %1128 = call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3062, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.ExecEvalArrayRefSubscript, i64 0, i64 0), i8* null) #9
  %1129 = call i32 @errcode(i32 67108994) #9
  %1130 = call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i64 0, i64 0)) #9
  call void (i32, ...) @errfinish(i32 %1129, i32 %1130) #9
  unreachable

; <label>:1131:                                   ; preds = %1116
  %1132 = bitcast %union.anon.1* %1117 to %struct.anon.28*
  %1133 = getelementptr inbounds %struct.anon.28, %struct.anon.28* %1132, i64 0, i32 2
  %1134 = load i8, i8* %1133, align 4, !range !2
  %1135 = icmp eq i8 %1134, 0
  %1136 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1119, i64 0, i32 8, i64 0
  %1137 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1119, i64 0, i32 11, i64 0
  %1138 = select i1 %1135, i32* %1137, i32* %1136
  %1139 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1140 = bitcast i8** %1139 to i32*
  %1141 = load i32, i32* %1140, align 8
  %1142 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1119, i64 0, i32 12
  %1143 = load i64, i64* %1142, align 8
  %1144 = trunc i64 %1143 to i32
  %1145 = sext i32 %1141 to i64
  %1146 = getelementptr i32, i32* %1138, i64 %1145
  store i32 %1144, i32* %1146, align 4
  %1147 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1148:                                   ; preds = %1123
  %1149 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1150 = load i8*, i8** %1149, align 8
  store i8 1, i8* %1150, align 1
  %1151 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %1152 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1153 = load i32, i32* %1152, align 8
  %1154 = sext i32 %1153 to i64
  %1155 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1151, i64 %1154
  br label %48

; <label>:1156:                                   ; preds = %1619
  call void @ExecEvalArrayRefOld(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1157 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1158:                                   ; preds = %1619
  call void @ExecEvalArrayRefAssign(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1159 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1160:                                   ; preds = %1619
  %1161 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1162 = bitcast %union.anon.1* %1161 to %struct.ArrayRefState**
  %1163 = load %struct.ArrayRefState*, %struct.ArrayRefState** %1162, align 8
  %1164 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 9
  %1165 = load i32, i32* %1164, align 4
  %1166 = icmp eq i32 %1165, 0
  %1167 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1168 = load i64*, i64** %1167, align 8
  %1169 = load i64, i64* %1168, align 8
  %1170 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 6
  %1171 = load i32, i32* %1170, align 8
  %1172 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 8, i64 0
  br i1 %1166, label %1173, label %1189

; <label>:1173:                                   ; preds = %1160
  %1174 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 2
  %1175 = load i16, i16* %1174, align 8
  %1176 = sext i16 %1175 to i32
  %1177 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 3
  %1178 = load i16, i16* %1177, align 2
  %1179 = sext i16 %1178 to i32
  %1180 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 4
  %1181 = load i8, i8* %1180, align 4, !range !2
  %1182 = icmp ne i8 %1181, 0
  %1183 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 5
  %1184 = load i8, i8* %1183, align 1
  %1185 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1186 = load i8*, i8** %1185, align 8
  %1187 = call i64 @array_get_element(i64 %1169, i32 %1171, i32* nonnull %1172, i32 %1176, i32 %1179, i1 zeroext %1182, i8 signext %1184, i8* %1186) #9
  %1188 = load i64*, i64** %1167, align 8
  store i64 %1187, i64* %1188, align 8
  br label %1206

; <label>:1189:                                   ; preds = %1160
  %1190 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 11, i64 0
  %1191 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 7, i64 0
  %1192 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 10, i64 0
  %1193 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 2
  %1194 = load i16, i16* %1193, align 8
  %1195 = sext i16 %1194 to i32
  %1196 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 3
  %1197 = load i16, i16* %1196, align 2
  %1198 = sext i16 %1197 to i32
  %1199 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 4
  %1200 = load i8, i8* %1199, align 4, !range !2
  %1201 = icmp ne i8 %1200, 0
  %1202 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %1163, i64 0, i32 5
  %1203 = load i8, i8* %1202, align 1
  %1204 = call i64 @array_get_slice(i64 %1169, i32 %1171, i32* nonnull %1172, i32* nonnull %1190, i8* nonnull %1191, i8* nonnull %1192, i32 %1195, i32 %1198, i1 zeroext %1201, i8 signext %1203) #9
  %1205 = load i64*, i64** %1167, align 8
  store i64 %1204, i64* %1205, align 8
  br label %1206

; <label>:1206:                                   ; preds = %1189, %1173
  %1207 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1208:                                   ; preds = %1619
  call void @ExecEvalConvertRowtype(%struct.ExprState* undef, %struct.ExprEvalStep* %1620, %struct.ExprContext* %1)
  %1209 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1210:                                   ; preds = %1619
  call void @ExecEvalScalarArrayOp(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1211 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1212:                                   ; preds = %1619
  call void @ExecEvalConstraintNotNull(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1213 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1214:                                   ; preds = %1619
  call void @ExecEvalConstraintCheck(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1215 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1216:                                   ; preds = %1619
  call void @ExecEvalXmlExpr(%struct.ExprState* undef, %struct.ExprEvalStep* %1620)
  %1217 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1218:                                   ; preds = %1619
  %1219 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1220 = bitcast %union.anon.1* %1219 to %struct.AggrefExprState**
  %1221 = load %struct.AggrefExprState*, %struct.AggrefExprState** %1220, align 8
  %1222 = load i64*, i64** %37, align 8
  %1223 = getelementptr inbounds %struct.AggrefExprState, %struct.AggrefExprState* %1221, i64 0, i32 2
  %1224 = load i32, i32* %1223, align 8
  %1225 = sext i32 %1224 to i64
  %1226 = getelementptr i64, i64* %1222, i64 %1225
  %1227 = load i64, i64* %1226, align 8
  %1228 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1229 = load i64*, i64** %1228, align 8
  store i64 %1227, i64* %1229, align 8
  %1230 = load i8*, i8** %38, align 8
  %1231 = load i32, i32* %1223, align 8
  %1232 = sext i32 %1231 to i64
  %1233 = getelementptr i8, i8* %1230, i64 %1232
  %1234 = load i8, i8* %1233, align 1, !range !2
  %1235 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1236 = load i8*, i8** %1235, align 8
  store i8 %1234, i8* %1236, align 1
  %1237 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1238:                                   ; preds = %1619
  %1239 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1240 = bitcast %union.anon.1* %1239 to %struct.AggState**
  %1241 = load %struct.AggState*, %struct.AggState** %1240, align 8
  %1242 = getelementptr inbounds %struct.AggState, %struct.AggState* %1241, i64 0, i32 21
  %1243 = load %struct.Bitmapset*, %struct.Bitmapset** %1242, align 8
  %1244 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1245 = bitcast i8** %1244 to %struct.List**
  %1246 = load %struct.List*, %struct.List** %1245, align 8
  %1247 = icmp eq %struct.List* %1246, null
  br i1 %1247, label %1267, label %1248

; <label>:1248:                                   ; preds = %1238
  %1249 = getelementptr inbounds %struct.List, %struct.List* %1246, i64 0, i32 2
  %1250 = load %struct.ListCell*, %struct.ListCell** %1249, align 8
  %1251 = icmp eq %struct.ListCell* %1250, null
  br i1 %1251, label %1267, label %1252

; <label>:1252:                                   ; preds = %1252, %1248
  %1253 = phi i32 [ %1261, %1252 ], [ 0, %1248 ]
  %1254 = phi %struct.ListCell* [ %1263, %1252 ], [ %1250, %1248 ]
  %1255 = bitcast %struct.ListCell* %1254 to i32*
  %1256 = load i32, i32* %1255, align 8
  %1257 = shl i32 %1253, 1
  %1258 = call zeroext i1 @bms_is_member(i32 %1256, %struct.Bitmapset* %1243) #9
  %1259 = xor i1 %1258, true
  %1260 = zext i1 %1259 to i32
  %1261 = or i32 %1257, %1260
  %1262 = getelementptr inbounds %struct.ListCell, %struct.ListCell* %1254, i64 0, i32 1
  %1263 = load %struct.ListCell*, %struct.ListCell** %1262, align 8
  %1264 = icmp eq %struct.ListCell* %1263, null
  br i1 %1264, label %1265, label %1252

; <label>:1265:                                   ; preds = %1252
  %1266 = sext i32 %1261 to i64
  br label %1267

; <label>:1267:                                   ; preds = %1265, %1248, %1238
  %1268 = phi i64 [ 0, %1248 ], [ %1266, %1265 ], [ 0, %1238 ]
  %1269 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1270 = load i64*, i64** %1269, align 8
  store i64 %1268, i64* %1270, align 8
  %1271 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1272 = load i8*, i8** %1271, align 8
  store i8 0, i8* %1272, align 1
  %1273 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1274:                                   ; preds = %1619
  %1275 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1276 = bitcast %union.anon.1* %1275 to %struct.WindowFuncExprState**
  %1277 = load %struct.WindowFuncExprState*, %struct.WindowFuncExprState** %1276, align 8
  %1278 = load i64*, i64** %37, align 8
  %1279 = getelementptr inbounds %struct.WindowFuncExprState, %struct.WindowFuncExprState* %1277, i64 0, i32 4
  %1280 = load i32, i32* %1279, align 8
  %1281 = sext i32 %1280 to i64
  %1282 = getelementptr i64, i64* %1278, i64 %1281
  %1283 = load i64, i64* %1282, align 8
  %1284 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1285 = load i64*, i64** %1284, align 8
  store i64 %1283, i64* %1285, align 8
  %1286 = load i8*, i8** %38, align 8
  %1287 = load i32, i32* %1279, align 8
  %1288 = sext i32 %1287 to i64
  %1289 = getelementptr i8, i8* %1286, i64 %1288
  %1290 = load i8, i8* %1289, align 1, !range !2
  %1291 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1292 = load i8*, i8** %1291, align 8
  store i8 %1290, i8* %1292, align 1
  %1293 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1294:                                   ; preds = %1619
  %1295 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1296 = bitcast %union.anon.1* %1295 to %struct.SubPlanState**
  %1297 = load %struct.SubPlanState*, %struct.SubPlanState** %1296, align 8
  call void @check_stack_depth() #9
  %1298 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1299 = load i8*, i8** %1298, align 8
  %1300 = call i64 @ExecSubPlan(%struct.SubPlanState* %1297, %struct.ExprContext* %1, i8* %1299) #9
  %1301 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1302 = load i64*, i64** %1301, align 8
  store i64 %1300, i64* %1302, align 8
  %1303 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1304:                                   ; preds = %1619
  %1305 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1306 = bitcast %union.anon.1* %1305 to %struct.AlternativeSubPlanState**
  %1307 = load %struct.AlternativeSubPlanState*, %struct.AlternativeSubPlanState** %1306, align 8
  call void @check_stack_depth() #9
  %1308 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1309 = load i8*, i8** %1308, align 8
  %1310 = call i64 @ExecAlternativeSubPlan(%struct.AlternativeSubPlanState* %1307, %struct.ExprContext* %1, i8* %1309) #9
  %1311 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1312 = load i64*, i64** %1311, align 8
  store i64 %1310, i64* %1312, align 8
  %1313 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1314:                                   ; preds = %1619
  %1315 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1316 = bitcast i8** %1315 to %struct.FunctionCallInfoData**
  %1317 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %1316, align 8
  %1318 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1317, i64 0, i32 7, i64 0
  %1319 = load i8, i8* %1318, align 1, !range !2
  %1320 = icmp eq i8 %1319, 0
  br i1 %1320, label %1327, label %1321

; <label>:1321:                                   ; preds = %1314
  %1322 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %1323 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1324 = load i32, i32* %1323, align 8
  %1325 = sext i32 %1324 to i64
  %1326 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1322, i64 %1325
  br label %48

; <label>:1327:                                   ; preds = %1619, %1314
  %1328 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1329 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1330 = bitcast i8** %1329 to %struct.FunctionCallInfoData**
  %1331 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %1330, align 8
  %1332 = bitcast %union.anon.1* %1328 to %struct.AggState**
  %1333 = load %struct.AggState*, %struct.AggState** %1332, align 8
  %1334 = getelementptr inbounds %struct.AggState, %struct.AggState* %1333, i64 0, i32 13
  %1335 = load %struct.ExprContext*, %struct.ExprContext** %1334, align 8
  %1336 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1335, i64 0, i32 5
  %1337 = bitcast %struct.MemoryContextData** %1336 to i64*
  %1338 = load i64, i64* %1337, align 8
  %1339 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %1338, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1340 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1331, i64 0, i32 4
  store i8 0, i8* %1340, align 4
  %1341 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1331, i64 0, i32 0
  %1342 = load %struct.FmgrInfo*, %struct.FmgrInfo** %1341, align 8
  %1343 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %1342, i64 0, i32 0
  %1344 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %1343, align 8
  %1345 = call i64 %1344(%struct.FunctionCallInfoData* %1331) #9
  %1346 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1347 = load i64*, i64** %1346, align 8
  store i64 %1345, i64* %1347, align 8
  %1348 = load i8, i8* %1340, align 4, !range !2
  %1349 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1350 = load i8*, i8** %1349, align 8
  store i8 %1348, i8* %1350, align 1
  store i64 %1339, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1351 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1352:                                   ; preds = %1619
  %1353 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1354 = bitcast %union.anon.1* %1353 to %struct.anon.40*
  %1355 = bitcast %union.anon.1* %1353 to i8**
  %1356 = load i8*, i8** %1355, align 8
  %1357 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1358 = bitcast i8** %1357 to i32*
  %1359 = load i32, i32* %1358, align 8
  %1360 = icmp sgt i32 %1359, 0
  br i1 %1360, label %1363, label %1376

; <label>:1361:                                   ; preds = %1363
  %1362 = icmp slt i32 %1369, %1359
  br i1 %1362, label %1363, label %1376

; <label>:1363:                                   ; preds = %1361, %1352
  %1364 = phi i32 [ %1369, %1361 ], [ 0, %1352 ]
  %1365 = sext i32 %1364 to i64
  %1366 = getelementptr i8, i8* %1356, i64 %1365
  %1367 = load i8, i8* %1366, align 1, !range !2
  %1368 = icmp eq i8 %1367, 0
  %1369 = add nuw i32 %1364, 1
  br i1 %1368, label %1361, label %1370

; <label>:1370:                                   ; preds = %1363
  %1371 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %1372 = getelementptr inbounds %struct.anon.40, %struct.anon.40* %1354, i64 0, i32 2
  %1373 = load i32, i32* %1372, align 4
  %1374 = sext i32 %1373 to i64
  %1375 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1371, i64 %1374
  br label %48

; <label>:1376:                                   ; preds = %1361, %1352
  %1377 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1378:                                   ; preds = %1619
  %1379 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1380 = bitcast %union.anon.1* %1379 to %struct.anon.41*
  %1381 = bitcast %union.anon.1* %1379 to %struct.AggState**
  %1382 = load %struct.AggState*, %struct.AggState** %1381, align 8
  %1383 = getelementptr inbounds %struct.AggState, %struct.AggState* %1382, i64 0, i32 34
  %1384 = load %struct.AggStatePerGroupData**, %struct.AggStatePerGroupData*** %1383, align 8
  %1385 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 5
  %1386 = bitcast %struct.FunctionCallInfoData** %1385 to i32*
  %1387 = load i32, i32* %1386, align 8
  %1388 = sext i32 %1387 to i64
  %1389 = getelementptr %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1384, i64 %1388
  %1390 = load %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1389, align 8
  %1391 = getelementptr inbounds %struct.anon.41, %struct.anon.41* %1380, i64 0, i32 4
  %1392 = load i32, i32* %1391, align 4
  %1393 = sext i32 %1392 to i64
  %1394 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1390, i64 %1393, i32 2
  %1395 = load i8, i8* %1394, align 1, !range !2
  %1396 = icmp eq i8 %1395, 0
  br i1 %1396, label %1431, label %1397

; <label>:1397:                                   ; preds = %1378
  %1398 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1399 = bitcast i8** %1398 to %struct.AggStatePerTransData**
  %1400 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %1399, align 8
  %1401 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1402 = bitcast i32* %1401 to i64*
  %1403 = load i64, i64* %1402, align 8
  %1404 = getelementptr inbounds %struct.AggState, %struct.AggState* %1382, i64 0, i32 14
  %1405 = bitcast %struct.ExprContext** %1404 to i64*
  store i64 %1403, i64* %1405, align 8
  %1406 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1407 = bitcast %struct.FmgrInfo** %1406 to i32*
  %1408 = load i32, i32* %1407, align 8
  %1409 = getelementptr inbounds %struct.AggState, %struct.AggState* %1382, i64 0, i32 20
  store i32 %1408, i32* %1409, align 8
  %1410 = inttoptr i64 %1403 to %struct.ExprContext*
  %1411 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1410, i64 0, i32 5
  %1412 = bitcast %struct.MemoryContextData** %1411 to i64*
  %1413 = load i64, i64* %1412, align 8
  %1414 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %1413, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1415 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1400, i64 0, i32 30, i32 6, i64 1
  %1416 = load i64, i64* %1415, align 8
  %1417 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1400, i64 0, i32 25
  %1418 = load i8, i8* %1417, align 1, !range !2
  %1419 = icmp ne i8 %1418, 0
  %1420 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1400, i64 0, i32 23
  %1421 = load i16, i16* %1420, align 4
  %1422 = sext i16 %1421 to i32
  %1423 = call i64 @datumCopy(i64 %1416, i1 zeroext %1419, i32 %1422) #9
  %1424 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1390, i64 %1393, i32 0
  store i64 %1423, i64* %1424, align 8
  %1425 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1390, i64 %1393, i32 1
  store i8 0, i8* %1425, align 8
  store i8 0, i8* %1394, align 1
  store i64 %1414, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1426 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %1427 = getelementptr inbounds %struct.anon.41, %struct.anon.41* %1380, i64 0, i32 6
  %1428 = load i32, i32* %1427, align 4
  %1429 = sext i32 %1428 to i64
  %1430 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1426, i64 %1429
  br label %48

; <label>:1431:                                   ; preds = %1378
  %1432 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1433:                                   ; preds = %1619
  %1434 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1435 = bitcast %union.anon.1* %1434 to %struct.anon.42*
  %1436 = bitcast %union.anon.1* %1434 to %struct.AggState**
  %1437 = load %struct.AggState*, %struct.AggState** %1436, align 8
  %1438 = getelementptr inbounds %struct.AggState, %struct.AggState* %1437, i64 0, i32 34
  %1439 = load %struct.AggStatePerGroupData**, %struct.AggStatePerGroupData*** %1438, align 8
  %1440 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1441 = load i32, i32* %1440, align 8
  %1442 = sext i32 %1441 to i64
  %1443 = getelementptr %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1439, i64 %1442
  %1444 = load %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1443, align 8
  %1445 = getelementptr inbounds %struct.anon.42, %struct.anon.42* %1435, i64 0, i32 2
  %1446 = load i32, i32* %1445, align 4
  %1447 = sext i32 %1446 to i64
  %1448 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1444, i64 %1447, i32 1
  %1449 = load i8, i8* %1448, align 8, !range !2
  %1450 = icmp eq i8 %1449, 0
  br i1 %1450, label %1457, label %1451, !prof !4

; <label>:1451:                                   ; preds = %1433
  %1452 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %8, align 8
  %1453 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 3
  %1454 = load i32, i32* %1453, align 4
  %1455 = sext i32 %1454 to i64
  %1456 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1452, i64 %1455
  br label %48

; <label>:1457:                                   ; preds = %1433
  %1458 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1459:                                   ; preds = %1619
  %1460 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1461 = bitcast %union.anon.1* %1460 to %struct.anon.43*
  %1462 = bitcast %union.anon.1* %1460 to %struct.AggState**
  %1463 = load %struct.AggState*, %struct.AggState** %1462, align 8
  %1464 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1465 = bitcast i8** %1464 to %struct.AggStatePerTransData**
  %1466 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %1465, align 8
  %1467 = getelementptr inbounds %struct.AggState, %struct.AggState* %1463, i64 0, i32 34
  %1468 = load %struct.AggStatePerGroupData**, %struct.AggStatePerGroupData*** %1467, align 8
  %1469 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 5
  %1470 = bitcast %struct.FunctionCallInfoData** %1469 to i32*
  %1471 = load i32, i32* %1470, align 8
  %1472 = sext i32 %1471 to i64
  %1473 = getelementptr %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1468, i64 %1472
  %1474 = load %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1473, align 8
  %1475 = getelementptr inbounds %struct.anon.43, %struct.anon.43* %1461, i64 0, i32 4
  %1476 = load i32, i32* %1475, align 4
  %1477 = sext i32 %1476 to i64
  %1478 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1466, i64 0, i32 30
  %1479 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1480 = bitcast i32* %1479 to i64*
  %1481 = load i64, i64* %1480, align 8
  %1482 = getelementptr inbounds %struct.AggState, %struct.AggState* %1463, i64 0, i32 14
  %1483 = bitcast %struct.ExprContext** %1482 to i64*
  store i64 %1481, i64* %1483, align 8
  %1484 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1485 = bitcast %struct.FmgrInfo** %1484 to i32*
  %1486 = load i32, i32* %1485, align 8
  %1487 = getelementptr inbounds %struct.AggState, %struct.AggState* %1463, i64 0, i32 20
  store i32 %1486, i32* %1487, align 8
  %1488 = getelementptr inbounds %struct.AggState, %struct.AggState* %1463, i64 0, i32 16
  store %struct.AggStatePerTransData* %1466, %struct.AggStatePerTransData** %1488, align 8
  %1489 = getelementptr inbounds %struct.AggState, %struct.AggState* %1463, i64 0, i32 13
  %1490 = load %struct.ExprContext*, %struct.ExprContext** %1489, align 8
  %1491 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1490, i64 0, i32 5
  %1492 = bitcast %struct.MemoryContextData** %1491 to i64*
  %1493 = load i64, i64* %1492, align 8
  %1494 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %1493, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1495 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1474, i64 %1477, i32 0
  %1496 = load i64, i64* %1495, align 8
  %1497 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1466, i64 0, i32 30, i32 6, i64 0
  store i64 %1496, i64* %1497, align 8
  %1498 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1474, i64 %1477, i32 1
  %1499 = load i8, i8* %1498, align 8, !range !2
  %1500 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1466, i64 0, i32 30, i32 7, i64 0
  store i8 %1499, i8* %1500, align 8
  %1501 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1466, i64 0, i32 30, i32 4
  store i8 0, i8* %1501, align 4
  %1502 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1478, i64 0, i32 0
  %1503 = load %struct.FmgrInfo*, %struct.FmgrInfo** %1502, align 8
  %1504 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %1503, i64 0, i32 0
  %1505 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %1504, align 8
  %1506 = call i64 %1505(%struct.FunctionCallInfoData* nonnull %1478) #9
  store i64 %1506, i64* %1495, align 8
  %1507 = load i8, i8* %1501, align 4, !range !2
  store i8 %1507, i8* %1498, align 8
  store i64 %1494, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1508 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1509:                                   ; preds = %1619
  %1510 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3
  %1511 = bitcast %union.anon.1* %1510 to %struct.anon.43*
  %1512 = bitcast %union.anon.1* %1510 to %struct.AggState**
  %1513 = load %struct.AggState*, %struct.AggState** %1512, align 8
  %1514 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1515 = bitcast i8** %1514 to %struct.AggStatePerTransData**
  %1516 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %1515, align 8
  %1517 = getelementptr inbounds %struct.AggState, %struct.AggState* %1513, i64 0, i32 34
  %1518 = load %struct.AggStatePerGroupData**, %struct.AggStatePerGroupData*** %1517, align 8
  %1519 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 5
  %1520 = bitcast %struct.FunctionCallInfoData** %1519 to i32*
  %1521 = load i32, i32* %1520, align 8
  %1522 = sext i32 %1521 to i64
  %1523 = getelementptr %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1518, i64 %1522
  %1524 = load %struct.AggStatePerGroupData*, %struct.AggStatePerGroupData** %1523, align 8
  %1525 = getelementptr inbounds %struct.anon.43, %struct.anon.43* %1511, i64 0, i32 4
  %1526 = load i32, i32* %1525, align 4
  %1527 = sext i32 %1526 to i64
  %1528 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1516, i64 0, i32 30
  %1529 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 2
  %1530 = bitcast i32* %1529 to i64*
  %1531 = load i64, i64* %1530, align 8
  %1532 = getelementptr inbounds %struct.AggState, %struct.AggState* %1513, i64 0, i32 14
  %1533 = bitcast %struct.ExprContext** %1532 to i64*
  store i64 %1531, i64* %1533, align 8
  %1534 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1535 = bitcast %struct.FmgrInfo** %1534 to i32*
  %1536 = load i32, i32* %1535, align 8
  %1537 = getelementptr inbounds %struct.AggState, %struct.AggState* %1513, i64 0, i32 20
  store i32 %1536, i32* %1537, align 8
  %1538 = getelementptr inbounds %struct.AggState, %struct.AggState* %1513, i64 0, i32 16
  store %struct.AggStatePerTransData* %1516, %struct.AggStatePerTransData** %1538, align 8
  %1539 = getelementptr inbounds %struct.AggState, %struct.AggState* %1513, i64 0, i32 13
  %1540 = load %struct.ExprContext*, %struct.ExprContext** %1539, align 8
  %1541 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1540, i64 0, i32 5
  %1542 = bitcast %struct.MemoryContextData** %1541 to i64*
  %1543 = load i64, i64* %1542, align 8
  %1544 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %1543, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1545 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1524, i64 %1527, i32 0
  %1546 = load i64, i64* %1545, align 8
  %1547 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1516, i64 0, i32 30, i32 6, i64 0
  store i64 %1546, i64* %1547, align 8
  %1548 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %1524, i64 %1527, i32 1
  %1549 = load i8, i8* %1548, align 8, !range !2
  %1550 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1516, i64 0, i32 30, i32 7, i64 0
  store i8 %1549, i8* %1550, align 8
  %1551 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1516, i64 0, i32 30, i32 4
  store i8 0, i8* %1551, align 4
  %1552 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %1528, i64 0, i32 0
  %1553 = load %struct.FmgrInfo*, %struct.FmgrInfo** %1552, align 8
  %1554 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %1553, i64 0, i32 0
  %1555 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %1554, align 8
  %1556 = call i64 %1555(%struct.FunctionCallInfoData* nonnull %1528) #9
  %1557 = inttoptr i64 %1556 to i8*
  %1558 = load i64, i64* %1545, align 8
  %1559 = inttoptr i64 %1558 to i8*
  %1560 = icmp eq i8* %1557, %1559
  br i1 %1560, label %1567, label %1561

; <label>:1561:                                   ; preds = %1509
  %1562 = load i8, i8* %1551, align 4, !range !2
  %1563 = icmp ne i8 %1562, 0
  %1564 = load i8, i8* %1548, align 8, !range !2
  %1565 = icmp ne i8 %1564, 0
  %1566 = call i64 @ExecAggTransReparent(%struct.AggState* %1513, %struct.AggStatePerTransData* %1516, i64 %1556, i1 zeroext %1563, i64 %1558, i1 zeroext %1565)
  br label %1567

; <label>:1567:                                   ; preds = %1561, %1509
  %1568 = phi i64 [ %1566, %1561 ], [ %1556, %1509 ]
  store i64 %1568, i64* %1545, align 8
  %1569 = load i8, i8* %1551, align 4, !range !2
  store i8 %1569, i8* %1548, align 8
  store i64 %1544, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %1570 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1571:                                   ; preds = %1619
  %1572 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1573 = bitcast i8** %1572 to %struct.AggStatePerTransData**
  %1574 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %1573, align 8
  %1575 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1576 = bitcast %struct.FmgrInfo** %1575 to i32*
  %1577 = load i32, i32* %1576, align 8
  %1578 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1574, i64 0, i32 29
  %1579 = load %struct.Tuplesortstate**, %struct.Tuplesortstate*** %1578, align 8
  %1580 = sext i32 %1577 to i64
  %1581 = getelementptr %struct.Tuplesortstate*, %struct.Tuplesortstate** %1579, i64 %1580
  %1582 = load %struct.Tuplesortstate*, %struct.Tuplesortstate** %1581, align 8
  %1583 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 1
  %1584 = load i64*, i64** %1583, align 8
  %1585 = load i64, i64* %1584, align 8
  %1586 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 2
  %1587 = load i8*, i8** %1586, align 8
  %1588 = load i8, i8* %1587, align 1, !range !2
  %1589 = icmp ne i8 %1588, 0
  call void @tuplesort_putdatum(%struct.Tuplesortstate* %1582, i64 %1585, i1 zeroext %1589) #9
  %1590 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1591:                                   ; preds = %1619
  %1592 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 1
  %1593 = bitcast i8** %1592 to %struct.AggStatePerTransData**
  %1594 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %1593, align 8
  %1595 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 0, i32 3, i32 0, i32 4
  %1596 = bitcast %struct.FmgrInfo** %1595 to i32*
  %1597 = load i32, i32* %1596, align 8
  %1598 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1594, i64 0, i32 26
  %1599 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %1598, align 8
  %1600 = call %struct.TupleTableSlot* @ExecClearTuple(%struct.TupleTableSlot* %1599) #9
  %1601 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1594, i64 0, i32 2
  %1602 = load i32, i32* %1601, align 4
  %1603 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %1598, align 8
  %1604 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %1603, i64 0, i32 9
  store i32 %1602, i32* %1604, align 4
  %1605 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %1598, align 8
  %1606 = call %struct.TupleTableSlot* @ExecStoreVirtualTuple(%struct.TupleTableSlot* %1605) #9
  %1607 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1594, i64 0, i32 29
  %1608 = load %struct.Tuplesortstate**, %struct.Tuplesortstate*** %1607, align 8
  %1609 = sext i32 %1597 to i64
  %1610 = getelementptr %struct.Tuplesortstate*, %struct.Tuplesortstate** %1608, i64 %1609
  %1611 = load %struct.Tuplesortstate*, %struct.Tuplesortstate** %1610, align 8
  %1612 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %1598, align 8
  call void @tuplesort_puttupleslot(%struct.Tuplesortstate* %1611, %struct.TupleTableSlot* %1612) #9
  %1613 = getelementptr %struct.ExprEvalStep, %struct.ExprEvalStep* %1620, i64 1
  br label %48

; <label>:1614:                                   ; preds = %1619
  %1615 = load i8, i8* %33, align 1, !range !2
  store i8 %1615, i8* %2, align 1
  %1616 = load i64, i64* %32, align 8
  br label %1617

; <label>:1617:                                   ; preds = %1614, %3
  %1618 = phi i64 [ %1616, %1614 ], [ ptrtoint ([87 x i8*]* @ExecInterpExpr.dispatch_table to i64), %3 ]
  ret i64 %1618

; <label>:1619:                                   ; preds = %48, %7
  %1620 = phi %struct.ExprEvalStep* [ %9, %7 ], [ %49, %48 ]
  %1621 = bitcast %struct.ExprEvalStep* %1620 to i8**
  %1622 = load i8*, i8** %1621, align 8
  indirectbr i8* %1622, [label %1614, label %43, label %50, label %55, label %60, label %76, label %92, label %108, label %120, label %132, label %144, label %146, label %166, label %186, label %206, label %218, label %240, label %254, label %269, label %302, label %317, label %350, label %354, label %377, label %397, label %401, label %424, label %444, label %451, label %471, label %478, label %492, label %506, label %525, label %534, label %544, label %546, label %548, label %559, label %574, label %589, label %600, label %621, label %623, label %628, label %672, label %691, label %741, label %778, label %813, label %849, label %851, label %852, label %881, label %883, label %917, label %936, label %996, label %1025, label %1092, label %1094, label %1096, label %1116, label %1156, label %1158, label %1160, label %650, label %1212, label %1214, label %1208, label %1210, label %1216, label %1218, label %1238, label %1274, label %1294, label %1304, label %1314, label %1327, label %1352, label %1378, label %1433, label %1459, label %1509, label %1571, label %1591]
}

; Function Attrs: nounwind uwtable
define dso_local void @CheckExprStillValid(%struct.ExprState* nocapture readonly, %struct.ExprContext* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 2
  %4 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %3, align 8
  %5 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 3
  %6 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %5, align 8
  %7 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %1, i64 0, i32 1
  %8 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %7, align 8
  %9 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 9
  %10 = load i32, i32* %9, align 8
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %12, label %76

; <label>:12:                                     ; preds = %2
  %13 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 5
  %14 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 1
  br label %15

; <label>:15:                                     ; preds = %71, %12
  %16 = phi i64 [ 0, %12 ], [ %72, %71 ]
  %17 = load %struct.ExprEvalStep*, %struct.ExprEvalStep** %13, align 8
  %18 = load i8, i8* %14, align 4
  %19 = and i8 %18, 4
  %20 = icmp eq i8 %19, 0
  %21 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %17, i64 %16, i32 0
  %22 = load i64, i64* %21, align 8
  br i1 %20, label %43, label %23

; <label>:23:                                     ; preds = %15
  %24 = inttoptr i64 %22 to i8*
  br label %25

; <label>:25:                                     ; preds = %37, %23
  %26 = phi i64 [ %39, %37 ], [ 0, %23 ]
  %27 = phi i64 [ %38, %37 ], [ 86, %23 ]
  %28 = add i64 %27, %26
  %29 = lshr i64 %28, 1
  %30 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %29, i32 0
  %31 = load i8*, i8** %30, align 16
  %32 = icmp ugt i8* %31, %24
  br i1 %32, label %37, label %33

; <label>:33:                                     ; preds = %25
  %34 = icmp ult i8* %31, %24
  br i1 %34, label %35, label %40

; <label>:35:                                     ; preds = %33
  %36 = add nuw i64 %29, 1
  br label %37

; <label>:37:                                     ; preds = %35, %25
  %38 = phi i64 [ %27, %35 ], [ %29, %25 ]
  %39 = phi i64 [ %36, %35 ], [ %26, %25 ]
  br label %25

; <label>:40:                                     ; preds = %33
  %41 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %29, i32 1
  %42 = load i32, i32* %41, align 8
  br label %45

; <label>:43:                                     ; preds = %15
  %44 = trunc i64 %22 to i32
  br label %45

; <label>:45:                                     ; preds = %43, %40
  %46 = phi i32 [ %42, %40 ], [ %44, %43 ]
  switch i32 %46, label %71 [
    i32 4, label %47
    i32 5, label %55
    i32 6, label %63
  ]

; <label>:47:                                     ; preds = %45
  %48 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %17, i64 %16, i32 3
  %49 = bitcast %union.anon.1* %48 to %struct.anon.2*
  %50 = bitcast %union.anon.1* %48 to i32*
  %51 = load i32, i32* %50, align 8
  %52 = add i32 %51, 1
  %53 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %49, i64 0, i32 1
  %54 = load i32, i32* %53, align 4
  tail call fastcc void @CheckVarSlotCompatibility(%struct.TupleTableSlot* %4, i32 %52, i32 %54)
  br label %71

; <label>:55:                                     ; preds = %45
  %56 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %17, i64 %16, i32 3
  %57 = bitcast %union.anon.1* %56 to %struct.anon.2*
  %58 = bitcast %union.anon.1* %56 to i32*
  %59 = load i32, i32* %58, align 8
  %60 = add i32 %59, 1
  %61 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %57, i64 0, i32 1
  %62 = load i32, i32* %61, align 4
  tail call fastcc void @CheckVarSlotCompatibility(%struct.TupleTableSlot* %6, i32 %60, i32 %62)
  br label %71

; <label>:63:                                     ; preds = %45
  %64 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %17, i64 %16, i32 3
  %65 = bitcast %union.anon.1* %64 to %struct.anon.2*
  %66 = bitcast %union.anon.1* %64 to i32*
  %67 = load i32, i32* %66, align 8
  %68 = add i32 %67, 1
  %69 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %65, i64 0, i32 1
  %70 = load i32, i32* %69, align 4
  tail call fastcc void @CheckVarSlotCompatibility(%struct.TupleTableSlot* %8, i32 %68, i32 %70)
  br label %71

; <label>:71:                                     ; preds = %63, %55, %47, %45
  %72 = add nuw nsw i64 %16, 1
  %73 = load i32, i32* %9, align 8
  %74 = sext i32 %73 to i64
  %75 = icmp slt i64 %72, %74
  br i1 %75, label %15, label %76

; <label>:76:                                     ; preds = %71, %2
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i64 @ExecEvalLambdaExpr(%struct.LambdaExpr* nocapture readonly) local_unnamed_addr #0 {
  %2 = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %2) #9
  %3 = getelementptr inbounds %struct.LambdaExpr, %struct.LambdaExpr* %0, i64 0, i32 6
  %4 = bitcast %struct.Node** %3 to %struct.ExprState**
  %5 = load %struct.ExprState*, %struct.ExprState** %4, align 8
  %6 = getelementptr inbounds %struct.LambdaExpr, %struct.LambdaExpr* %0, i64 0, i32 7
  %7 = bitcast %struct.Node** %6 to %struct.ExprContext**
  %8 = load %struct.ExprContext*, %struct.ExprContext** %7, align 8
  %9 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %8, i64 0, i32 5
  %10 = bitcast %struct.MemoryContextData** %9 to i64*
  %11 = load i64, i64* %10, align 8
  %12 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %11, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %13 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %5, i64 0, i32 6
  %14 = load i64 (%struct.ExprState*, %struct.ExprContext*, i8*)*, i64 (%struct.ExprState*, %struct.ExprContext*, i8*)** %13, align 8
  %15 = call i64 %14(%struct.ExprState* %5, %struct.ExprContext* %8, i8* nonnull %2) #9
  store i64 %12, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %2) #9
  ret i64 %15
}

; Function Attrs: nounwind readonly uwtable
define dso_local i32 @ExecEvalStepOp(%struct.ExprState* nocapture readonly, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #3 {
  %3 = getelementptr inbounds %struct.ExprState, %struct.ExprState* %0, i64 0, i32 1
  %4 = load i8, i8* %3, align 4
  %5 = and i8 %4, 4
  %6 = icmp eq i8 %5, 0
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 0
  %8 = load i64, i64* %7, align 8
  br i1 %6, label %29, label %9

; <label>:9:                                      ; preds = %2
  %10 = inttoptr i64 %8 to i8*
  br label %11

; <label>:11:                                     ; preds = %23, %9
  %12 = phi i64 [ %25, %23 ], [ 0, %9 ]
  %13 = phi i64 [ %24, %23 ], [ 86, %9 ]
  %14 = add i64 %13, %12
  %15 = lshr i64 %14, 1
  %16 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %15, i32 0
  %17 = load i8*, i8** %16, align 16
  %18 = icmp ugt i8* %17, %10
  br i1 %18, label %23, label %19

; <label>:19:                                     ; preds = %11
  %20 = icmp ult i8* %17, %10
  br i1 %20, label %21, label %26

; <label>:21:                                     ; preds = %19
  %22 = add nuw i64 %15, 1
  br label %23

; <label>:23:                                     ; preds = %21, %11
  %24 = phi i64 [ %13, %21 ], [ %15, %11 ]
  %25 = phi i64 [ %22, %21 ], [ %12, %11 ]
  br label %11

; <label>:26:                                     ; preds = %19
  %27 = getelementptr [86 x %struct.ExprEvalOpLookup], [86 x %struct.ExprEvalOpLookup]* @reverse_dispatch_table, i64 0, i64 %15, i32 1
  %28 = load i32, i32* %27, align 8
  br label %31

; <label>:29:                                     ; preds = %2
  %30 = trunc i64 %8 to i32
  br label %31

; <label>:31:                                     ; preds = %29, %26
  %32 = phi i32 [ %28, %26 ], [ %30, %29 ]
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define internal fastcc void @CheckVarSlotCompatibility(%struct.TupleTableSlot* nocapture readonly, i32, i32) unnamed_addr #0 {
  %4 = icmp sgt i32 %1, 0
  br i1 %4, label %5, label %41

; <label>:5:                                      ; preds = %3
  %6 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %0, i64 0, i32 6
  %7 = load %struct.tupleDesc*, %struct.tupleDesc** %6, align 8
  %8 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %7, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = icmp slt i32 %9, %1
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %5
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 1891, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.CheckVarSlotCompatibility, i64 0, i64 0)) #9
  %12 = load i32, i32* %8, align 8
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i32 %1, i32 %12) #9
  unreachable

; <label>:13:                                     ; preds = %5
  %14 = add i32 %1, -1
  %15 = sext i32 %14 to i64
  %16 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %7, i64 0, i32 6, i64 %15, i32 16
  %17 = load i8, i8* %16, align 1, !range !2
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %26, label %19

; <label>:19:                                     ; preds = %13
  %20 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 1899, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.CheckVarSlotCompatibility, i64 0, i64 0), i8* null) #9
  %21 = tail call i32 @errcode(i32 50360452) #9
  %22 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %7, i64 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = tail call i8* @format_type_be(i32 %23) #9
  %25 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.27, i64 0, i64 0), i32 %1, i8* %24) #9
  tail call void (i32, ...) @errfinish(i32 %21, i32 %25) #9
  unreachable

; <label>:26:                                     ; preds = %13
  %27 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %7, i64 0, i32 6, i64 %15, i32 2
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, %2
  br i1 %29, label %41, label %30

; <label>:30:                                     ; preds = %26
  %31 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 1908, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.CheckVarSlotCompatibility, i64 0, i64 0), i8* null) #9
  %32 = tail call i32 @errcode(i32 67141764) #9
  %33 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %7, i64 0, i32 1
  %34 = load i32, i32* %33, align 4
  %35 = tail call i8* @format_type_be(i32 %34) #9
  %36 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.28, i64 0, i64 0), i32 %1, i8* %35) #9
  %37 = load i32, i32* %27, align 4
  %38 = tail call i8* @format_type_be(i32 %37) #9
  %39 = tail call i8* @format_type_be(i32 %2) #9
  %40 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.13, i64 0, i64 0), i8* %38, i8* %39) #9
  tail call void (i32, ...) @errfinish(i32 %32, i32 %36, i32 %40) #9
  unreachable

; <label>:41:                                     ; preds = %26, %3
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define internal i32 @dispatch_compare_ptr(i8* nocapture readonly, i8* nocapture readonly) #4 {
  %3 = bitcast i8* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = bitcast i8* %1 to i8**
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ult i8* %4, %6
  %8 = icmp ugt i8* %4, %6
  %9 = zext i1 %8 to i32
  %10 = select i1 %7, i32 -1, i32 %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalFuncExprFusage(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readnone) local_unnamed_addr #0 {
  %4 = alloca %struct.PgStat_FunctionCallUsage, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %6 = bitcast i8** %5 to %struct.FunctionCallInfoData**
  %7 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %6, align 8
  %8 = bitcast %struct.PgStat_FunctionCallUsage* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %8) #9
  call void @pgstat_init_function_usage(%struct.FunctionCallInfoData* %7, %struct.PgStat_FunctionCallUsage* nonnull %4) #9
  %9 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 4
  store i8 0, i8* %9, align 4
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %11 = bitcast i32* %10 to i64 (%struct.FunctionCallInfoData*)**
  %12 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %11, align 8
  %13 = call i64 %12(%struct.FunctionCallInfoData* %7) #9
  %14 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %15 = load i64*, i64** %14, align 8
  store i64 %13, i64* %15, align 8
  %16 = load i8, i8* %9, align 4, !range !2
  %17 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8
  store i8 %16, i8* %18, align 1
  call void @pgstat_end_function_usage(%struct.PgStat_FunctionCallUsage* nonnull %4, i1 zeroext true) #9
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %8) #9
  ret void
}

declare dso_local void @pgstat_init_function_usage(%struct.FunctionCallInfoData*, %struct.PgStat_FunctionCallUsage*) local_unnamed_addr #5

declare dso_local void @pgstat_end_function_usage(%struct.PgStat_FunctionCallUsage*, i1 zeroext) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalFuncExprStrictFusage(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readnone) local_unnamed_addr #0 {
  %4 = alloca %struct.PgStat_FunctionCallUsage, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %6 = bitcast i8** %5 to %struct.FunctionCallInfoData**
  %7 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %6, align 8
  %8 = bitcast %struct.PgStat_FunctionCallUsage* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %8) #9
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %10 = bitcast %struct.FmgrInfo** %9 to i32*
  %11 = load i32, i32* %10, align 8
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %15, label %25

; <label>:13:                                     ; preds = %15
  %14 = icmp slt i32 %21, %11
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %13, %3
  %16 = phi i32 [ %21, %13 ], [ 0, %3 ]
  %17 = sext i32 %16 to i64
  %18 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 7, i64 %17
  %19 = load i8, i8* %18, align 1, !range !2
  %20 = icmp eq i8 %19, 0
  %21 = add nuw i32 %16, 1
  br i1 %20, label %13, label %22

; <label>:22:                                     ; preds = %15
  %23 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %24 = load i8*, i8** %23, align 8
  store i8 1, i8* %24, align 1
  br label %36

; <label>:25:                                     ; preds = %13, %3
  call void @pgstat_init_function_usage(%struct.FunctionCallInfoData* %7, %struct.PgStat_FunctionCallUsage* nonnull %4) #9
  %26 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 4
  store i8 0, i8* %26, align 4
  %27 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %28 = bitcast i32* %27 to i64 (%struct.FunctionCallInfoData*)**
  %29 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %28, align 8
  %30 = call i64 %29(%struct.FunctionCallInfoData* %7) #9
  %31 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %32 = load i64*, i64** %31, align 8
  store i64 %30, i64* %32, align 8
  %33 = load i8, i8* %26, align 4, !range !2
  %34 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %35 = load i8*, i8** %34, align 8
  store i8 %33, i8* %35, align 1
  call void @pgstat_end_function_usage(%struct.PgStat_FunctionCallUsage* nonnull %4, i1 zeroext true) #9
  br label %36

; <label>:36:                                     ; preds = %25, %22
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %8) #9
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalParamExec(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 6
  %5 = load %struct.ParamExecData*, %struct.ParamExecData** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %7 = bitcast %union.anon.1* %6 to i32*
  %8 = load i32, i32* %7, align 8
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %5, i64 %9, i32 0
  %11 = load i8*, i8** %10, align 8
  %12 = icmp eq i8* %11, null
  br i1 %12, label %15, label %13, !prof !4

; <label>:13:                                     ; preds = %3
  %14 = bitcast i8* %11 to %struct.SubPlanState*
  tail call void @ExecSetParamPlan(%struct.SubPlanState* %14, %struct.ExprContext* nonnull %2) #9
  br label %15

; <label>:15:                                     ; preds = %13, %3
  %16 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %5, i64 %9, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %19 = load i64*, i64** %18, align 8
  store i64 %17, i64* %19, align 8
  %20 = getelementptr inbounds %struct.ParamExecData, %struct.ParamExecData* %5, i64 %9, i32 2
  %21 = load i8, i8* %20, align 8, !range !2
  %22 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %23 = load i8*, i8** %22, align 8
  store i8 %21, i8* %23, align 1
  ret void
}

declare dso_local void @ExecSetParamPlan(%struct.SubPlanState*, %struct.ExprContext*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalParamExtern(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readonly) local_unnamed_addr #0 {
  %4 = alloca %struct.ParamExternData, align 8
  %5 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 7
  %6 = load %struct.ParamListInfoData*, %struct.ParamListInfoData** %5, align 8
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %8 = bitcast %union.anon.1* %7 to %struct.anon.13*
  %9 = bitcast %union.anon.1* %7 to i32*
  %10 = load i32, i32* %9, align 8
  %11 = icmp ne %struct.ParamListInfoData* %6, null
  %12 = icmp sgt i32 %10, 0
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %56, !prof !4

; <label>:14:                                     ; preds = %3
  %15 = getelementptr inbounds %struct.ParamListInfoData, %struct.ParamListInfoData* %6, i64 0, i32 6
  %16 = load i32, i32* %15, align 8
  %17 = icmp sgt i32 %10, %16
  br i1 %17, label %56, label %18, !prof !3

; <label>:18:                                     ; preds = %14
  %19 = bitcast %struct.ParamExternData* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #9
  %20 = getelementptr inbounds %struct.ParamListInfoData, %struct.ParamListInfoData* %6, i64 0, i32 0
  %21 = load %struct.ParamExternData* (%struct.ParamListInfoData*, i32, i1, %struct.ParamExternData*)*, %struct.ParamExternData* (%struct.ParamListInfoData*, i32, i1, %struct.ParamExternData*)** %20, align 8
  %22 = icmp eq %struct.ParamExternData* (%struct.ParamListInfoData*, i32, i1, %struct.ParamExternData*)* %21, null
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %18
  %24 = call %struct.ParamExternData* %21(%struct.ParamListInfoData* nonnull %6, i32 %10, i1 zeroext false, %struct.ParamExternData* nonnull %4) #9
  br label %29

; <label>:25:                                     ; preds = %18
  %26 = add i32 %10, -1
  %27 = sext i32 %26 to i64
  %28 = getelementptr %struct.ParamListInfoData, %struct.ParamListInfoData* %6, i64 0, i32 7, i64 %27
  br label %29

; <label>:29:                                     ; preds = %25, %23
  %30 = phi %struct.ParamExternData* [ %24, %23 ], [ %28, %25 ]
  %31 = getelementptr inbounds %struct.ParamExternData, %struct.ParamExternData* %30, i64 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %55, label %34, !prof !3

; <label>:34:                                     ; preds = %29
  %35 = getelementptr inbounds %struct.anon.13, %struct.anon.13* %8, i64 0, i32 1
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %32, %36
  br i1 %37, label %46, label %38, !prof !4

; <label>:38:                                     ; preds = %34
  %39 = call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2307, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalParamExtern, i64 0, i64 0), i8* null) #9
  %40 = call i32 @errcode(i32 67141764) #9
  %41 = load i32, i32* %31, align 4
  %42 = call i8* @format_type_be(i32 %41) #9
  %43 = load i32, i32* %35, align 4
  %44 = call i8* @format_type_be(i32 %43) #9
  %45 = call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([75 x i8], [75 x i8]* @.str.2, i64 0, i64 0), i32 %10, i8* %42, i8* %44) #9
  call void (i32, ...) @errfinish(i32 %40, i32 %45) #9
  unreachable

; <label>:46:                                     ; preds = %34
  %47 = getelementptr inbounds %struct.ParamExternData, %struct.ParamExternData* %30, i64 0, i32 0
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %50 = load i64*, i64** %49, align 8
  store i64 %48, i64* %50, align 8
  %51 = getelementptr inbounds %struct.ParamExternData, %struct.ParamExternData* %30, i64 0, i32 1
  %52 = load i8, i8* %51, align 8, !range !2
  %53 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %54 = load i8*, i8** %53, align 8
  store i8 %52, i8* %54, align 1
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #9
  ret void

; <label>:55:                                     ; preds = %29
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #9
  br label %56

; <label>:56:                                     ; preds = %55, %14, %3
  %57 = call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2316, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalParamExtern, i64 0, i64 0), i8* null) #9
  %58 = call i32 @errcode(i32 67137668) #9
  %59 = call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.3, i64 0, i64 0), i32 %10) #9
  call void (i32, ...) @errfinish(i32 %58, i32 %59) #9
  unreachable
}

declare dso_local zeroext i1 @errstart(i32, i8*, i32, i8*, i8*) local_unnamed_addr #5

declare dso_local void @errfinish(i32, ...) local_unnamed_addr #5

declare dso_local i32 @errcode(i32) local_unnamed_addr #5

declare dso_local i32 @errmsg(i8*, ...) local_unnamed_addr #5

declare dso_local i8* @format_type_be(i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalSQLValueFunction(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca %struct.FunctionCallInfoData, align 8
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %5 = bitcast %union.anon.1* %4 to %struct.SQLValueFunction**
  %6 = load %struct.SQLValueFunction*, %struct.SQLValueFunction** %5, align 8
  %7 = bitcast %struct.FunctionCallInfoData* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 936, i8* nonnull %7) #9
  %8 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %9 = load i8*, i8** %8, align 8
  store i8 0, i8* %9, align 1
  %10 = getelementptr inbounds %struct.SQLValueFunction, %struct.SQLValueFunction* %6, i64 0, i32 1
  %11 = load i32, i32* %10, align 4
  switch i32 %11, label %78 [
    i32 0, label %12
    i32 1, label %17
    i32 2, label %17
    i32 3, label %24
    i32 4, label %24
    i32 5, label %30
    i32 6, label %30
    i32 7, label %36
    i32 8, label %36
    i32 9, label %42
    i32 10, label %42
    i32 11, label %42
    i32 12, label %51
    i32 13, label %60
    i32 14, label %69
  ]

; <label>:12:                                     ; preds = %2
  %13 = tail call i32 @GetSQLCurrentDate() #9
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %16 = load i64*, i64** %15, align 8
  store i64 %14, i64* %16, align 8
  br label %78

; <label>:17:                                     ; preds = %2, %2
  %18 = getelementptr inbounds %struct.SQLValueFunction, %struct.SQLValueFunction* %6, i64 0, i32 3
  %19 = load i32, i32* %18, align 4
  %20 = tail call %struct.TimeTzADT* @GetSQLCurrentTime(i32 %19) #9
  %21 = ptrtoint %struct.TimeTzADT* %20 to i64
  %22 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %23 = load i64*, i64** %22, align 8
  store i64 %21, i64* %23, align 8
  br label %78

; <label>:24:                                     ; preds = %2, %2
  %25 = getelementptr inbounds %struct.SQLValueFunction, %struct.SQLValueFunction* %6, i64 0, i32 3
  %26 = load i32, i32* %25, align 4
  %27 = tail call i64 @GetSQLCurrentTimestamp(i32 %26) #9
  %28 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %29 = load i64*, i64** %28, align 8
  store i64 %27, i64* %29, align 8
  br label %78

; <label>:30:                                     ; preds = %2, %2
  %31 = getelementptr inbounds %struct.SQLValueFunction, %struct.SQLValueFunction* %6, i64 0, i32 3
  %32 = load i32, i32* %31, align 4
  %33 = tail call i64 @GetSQLLocalTime(i32 %32) #9
  %34 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %35 = load i64*, i64** %34, align 8
  store i64 %33, i64* %35, align 8
  br label %78

; <label>:36:                                     ; preds = %2, %2
  %37 = getelementptr inbounds %struct.SQLValueFunction, %struct.SQLValueFunction* %6, i64 0, i32 3
  %38 = load i32, i32* %37, align 4
  %39 = tail call i64 @GetSQLLocalTimestamp(i32 %38) #9
  %40 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %41 = load i64*, i64** %40, align 8
  store i64 %39, i64* %41, align 8
  br label %78

; <label>:42:                                     ; preds = %2, %2, %2
  %43 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 4
  %44 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 5
  store i16 0, i16* %44, align 2
  %45 = bitcast %struct.FunctionCallInfoData* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %45, i8 0, i64 29, i1 false)
  %46 = call i64 @current_user(%struct.FunctionCallInfoData* nonnull %3) #9
  %47 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %48 = load i64*, i64** %47, align 8
  store i64 %46, i64* %48, align 8
  %49 = load i8, i8* %43, align 4, !range !2
  %50 = load i8*, i8** %8, align 8
  store i8 %49, i8* %50, align 1
  br label %78

; <label>:51:                                     ; preds = %2
  %52 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 4
  %53 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 5
  store i16 0, i16* %53, align 2
  %54 = bitcast %struct.FunctionCallInfoData* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %54, i8 0, i64 29, i1 false)
  %55 = call i64 @session_user(%struct.FunctionCallInfoData* nonnull %3) #9
  %56 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %57 = load i64*, i64** %56, align 8
  store i64 %55, i64* %57, align 8
  %58 = load i8, i8* %52, align 4, !range !2
  %59 = load i8*, i8** %8, align 8
  store i8 %58, i8* %59, align 1
  br label %78

; <label>:60:                                     ; preds = %2
  %61 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 4
  %62 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 5
  store i16 0, i16* %62, align 2
  %63 = bitcast %struct.FunctionCallInfoData* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %63, i8 0, i64 29, i1 false)
  %64 = call i64 @current_database(%struct.FunctionCallInfoData* nonnull %3) #9
  %65 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %66 = load i64*, i64** %65, align 8
  store i64 %64, i64* %66, align 8
  %67 = load i8, i8* %61, align 4, !range !2
  %68 = load i8*, i8** %8, align 8
  store i8 %67, i8* %68, align 1
  br label %78

; <label>:69:                                     ; preds = %2
  %70 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 4
  %71 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %3, i64 0, i32 5
  store i16 0, i16* %71, align 2
  %72 = bitcast %struct.FunctionCallInfoData* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %72, i8 0, i64 29, i1 false)
  %73 = call i64 @current_schema(%struct.FunctionCallInfoData* nonnull %3) #9
  %74 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %75 = load i64*, i64** %74, align 8
  store i64 %73, i64* %75, align 8
  %76 = load i8, i8* %70, align 4, !range !2
  %77 = load i8*, i8** %8, align 8
  store i8 %76, i8* %77, align 1
  br label %78

; <label>:78:                                     ; preds = %69, %60, %51, %42, %36, %30, %24, %17, %12, %2
  call void @llvm.lifetime.end.p0i8(i64 936, i8* nonnull %7) #9
  ret void
}

declare dso_local i32 @GetSQLCurrentDate() local_unnamed_addr #5

declare dso_local %struct.TimeTzADT* @GetSQLCurrentTime(i32) local_unnamed_addr #5

declare dso_local i64 @GetSQLCurrentTimestamp(i32) local_unnamed_addr #5

declare dso_local i64 @GetSQLLocalTime(i32) local_unnamed_addr #5

declare dso_local i64 @GetSQLLocalTimestamp(i32) local_unnamed_addr #5

declare dso_local i64 @current_user(%struct.FunctionCallInfoData*) local_unnamed_addr #5

declare dso_local i64 @session_user(%struct.FunctionCallInfoData*) local_unnamed_addr #5

declare dso_local i64 @current_database(%struct.FunctionCallInfoData*) local_unnamed_addr #5

declare dso_local i64 @current_schema(%struct.FunctionCallInfoData*) local_unnamed_addr #5

; Function Attrs: noreturn nounwind uwtable
define dso_local void @ExecEvalCurrentOfExpr(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readnone) local_unnamed_addr #6 {
  %3 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2394, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @__func__.ExecEvalCurrentOfExpr, i64 0, i64 0), i8* null) #9
  %4 = tail call i32 @errcode(i32 1088) #9
  %5 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.4, i64 0, i64 0)) #9
  tail call void (i32, ...) @errfinish(i32 %4, i32 %5) #9
  unreachable
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalNextValueExpr(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.anon.19*
  %5 = bitcast %union.anon.1* %3 to i32*
  %6 = load i32, i32* %5, align 8
  %7 = tail call i64 @nextval_internal(i32 %6, i1 zeroext false) #9
  %8 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %4, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  switch i32 %9, label %23 [
    i32 21, label %10
    i32 23, label %15
    i32 20, label %20
  ]

; <label>:10:                                     ; preds = %2
  %11 = shl i64 %7, 48
  %12 = ashr exact i64 %11, 48
  %13 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %14 = load i64*, i64** %13, align 8
  store i64 %12, i64* %14, align 8
  br label %25

; <label>:15:                                     ; preds = %2
  %16 = shl i64 %7, 32
  %17 = ashr exact i64 %16, 32
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %19 = load i64*, i64** %18, align 8
  store i64 %17, i64* %19, align 8
  br label %25

; <label>:20:                                     ; preds = %2
  %21 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %22 = load i64*, i64** %21, align 8
  store i64 %7, i64* %22, align 8
  br label %25

; <label>:23:                                     ; preds = %2
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2418, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @__func__.ExecEvalNextValueExpr, i64 0, i64 0)) #9
  %24 = load i32, i32* %8, align 4
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i64 0, i64 0), i32 %24) #9
  unreachable

; <label>:25:                                     ; preds = %20, %15, %10
  %26 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %27 = load i8*, i8** %26, align 8
  store i8 0, i8* %27, align 1
  ret void
}

declare dso_local i64 @nextval_internal(i32, i1 zeroext) local_unnamed_addr #5

declare dso_local void @elog_start(i8*, i32, i8*) local_unnamed_addr #5

declare dso_local void @elog_finish(i32, i8*, ...) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalRowNull(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep*, %struct.ExprContext*) local_unnamed_addr #0 {
  tail call fastcc void @ExecEvalRowNullInt(%struct.ExprEvalStep* %1, %struct.ExprContext* %2, i1 zeroext true)
  ret void
}

; Function Attrs: nounwind uwtable
define internal fastcc void @ExecEvalRowNullInt(%struct.ExprEvalStep*, %struct.ExprContext*, i1 zeroext) unnamed_addr #0 {
  %4 = alloca %struct.HeapTupleData, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %0, i64 0, i32 1
  %6 = bitcast i64** %5 to %struct.varlena***
  %7 = load %struct.varlena**, %struct.varlena*** %6, align 8
  %8 = load %struct.varlena*, %struct.varlena** %7, align 8
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %0, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8
  %11 = load i8, i8* %10, align 1, !range !2
  %12 = icmp eq i8 %11, 0
  %13 = bitcast %struct.HeapTupleData* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %13) #9
  store i8 0, i8* %10, align 1
  br i1 %12, label %17, label %14

; <label>:14:                                     ; preds = %3
  %15 = zext i1 %2 to i64
  %16 = load i64*, i64** %5, align 8
  store i64 %15, i64* %16, align 8
  br label %81

; <label>:17:                                     ; preds = %3
  %18 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %8) #9
  %19 = getelementptr inbounds %struct.varlena, %struct.varlena* %18, i64 2
  %20 = bitcast %struct.varlena* %19 to i32*
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.varlena, %struct.varlena* %18, i64 1
  %23 = bitcast %struct.varlena* %22 to i32*
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %0, i64 0, i32 3
  %26 = bitcast %union.anon.1* %25 to %struct.tupleDesc**
  %27 = load %struct.tupleDesc*, %struct.tupleDesc** %26, align 8
  %28 = icmp eq %struct.tupleDesc* %27, null
  br i1 %28, label %37, label %29

; <label>:29:                                     ; preds = %17
  %30 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %27, i64 0, i32 1
  %31 = load i32, i32* %30, align 4
  %32 = icmp eq i32 %31, %21
  br i1 %32, label %33, label %37

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %27, i64 0, i32 2
  %35 = load i32, i32* %34, align 8
  %36 = icmp eq i32 %35, %24
  br i1 %36, label %49, label %37

; <label>:37:                                     ; preds = %33, %29, %17
  %38 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc(i32 %21, i32 %24) #9
  %39 = load %struct.tupleDesc*, %struct.tupleDesc** %26, align 8
  %40 = icmp eq %struct.tupleDesc* %39, null
  br i1 %40, label %46, label %41

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %39, i64 0, i32 4
  %43 = load i32, i32* %42, align 8
  %44 = icmp sgt i32 %43, -1
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %41
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %39) #9
  br label %48

; <label>:46:                                     ; preds = %37
  %47 = ptrtoint %union.anon.1* %25 to i64
  tail call void @RegisterExprContextCallback(%struct.ExprContext* %1, void (i64)* nonnull @ShutdownTupleDescRef, i64 %47) #9
  br label %48

; <label>:48:                                     ; preds = %46, %45, %41
  store %struct.tupleDesc* %38, %struct.tupleDesc** %26, align 8
  br label %49

; <label>:49:                                     ; preds = %48, %33
  %50 = phi %struct.tupleDesc* [ %38, %48 ], [ %27, %33 ]
  %51 = bitcast %struct.varlena* %18 to i32*
  %52 = load i32, i32* %51, align 4
  %53 = lshr i32 %52, 2
  %54 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 0
  store i32 %53, i32* %54, align 8
  %55 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 3
  %56 = bitcast %struct.HeapTupleHeaderData** %55 to %struct.varlena**
  store %struct.varlena* %18, %struct.varlena** %56, align 8
  %57 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %50, i64 0, i32 0
  %58 = load i32, i32* %57, align 8
  %59 = icmp slt i32 %58, 1
  br i1 %59, label %79, label %60

; <label>:60:                                     ; preds = %75, %49
  %61 = phi i32 [ %76, %75 ], [ 1, %49 ]
  %62 = add i32 %61, -1
  %63 = sext i32 %62 to i64
  %64 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %50, i64 0, i32 6, i64 %63, i32 16
  %65 = load i8, i8* %64, align 1, !range !2
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %67, label %75

; <label>:67:                                     ; preds = %60
  %68 = call zeroext i1 @heap_attisnull(%struct.HeapTupleData* nonnull %4, i32 %61, %struct.tupleDesc* nonnull %50) #9
  br i1 %68, label %69, label %72

; <label>:69:                                     ; preds = %67
  br i1 %2, label %75, label %70

; <label>:70:                                     ; preds = %69
  %71 = load i64*, i64** %5, align 8
  store i64 0, i64* %71, align 8
  br label %81

; <label>:72:                                     ; preds = %67
  br i1 %2, label %73, label %75

; <label>:73:                                     ; preds = %72
  %74 = load i64*, i64** %5, align 8
  store i64 0, i64* %74, align 8
  br label %81

; <label>:75:                                     ; preds = %72, %69, %60
  %76 = add i32 %61, 1
  %77 = load i32, i32* %57, align 8
  %78 = icmp sgt i32 %76, %77
  br i1 %78, label %79, label %60

; <label>:79:                                     ; preds = %75, %49
  %80 = load i64*, i64** %5, align 8
  store i64 1, i64* %80, align 8
  br label %81

; <label>:81:                                     ; preds = %79, %73, %70, %14
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %13) #9
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalRowNotNull(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep*, %struct.ExprContext*) local_unnamed_addr #0 {
  tail call fastcc void @ExecEvalRowNullInt(%struct.ExprEvalStep* %1, %struct.ExprContext* %2, i1 zeroext false)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalArrayExpr(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca [6 x i32], align 16
  %4 = alloca [6 x i32], align 16
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %6 = bitcast %union.anon.1* %5 to %struct.anon.20*
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 3
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %10 = load i32, i32* %9, align 8
  %11 = bitcast [6 x i32]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %11) #9
  %12 = bitcast [6 x i32]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %12) #9
  %13 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %14 = load i8*, i8** %13, align 8
  store i8 0, i8* %14, align 1
  %15 = getelementptr inbounds %struct.anon.20, %struct.anon.20* %6, i64 0, i32 7
  %16 = load i8, i8* %15, align 4, !range !2
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %18, label %35

; <label>:18:                                     ; preds = %2
  %19 = getelementptr inbounds %union.anon.1, %union.anon.1* %5, i64 0, i32 0, i32 0
  %20 = load i64*, i64** %19, align 8
  %21 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr inbounds [6 x i32], [6 x i32]* %3, i64 0, i64 0
  store i32 %10, i32* %23, align 16
  %24 = getelementptr inbounds [6 x i32], [6 x i32]* %4, i64 0, i64 0
  store i32 1, i32* %24, align 16
  %25 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %26 = bitcast %struct.FmgrInfo** %25 to i16*
  %27 = load i16, i16* %26, align 8
  %28 = sext i16 %27 to i32
  %29 = getelementptr inbounds %struct.anon.20, %struct.anon.20* %6, i64 0, i32 5
  %30 = load i8, i8* %29, align 2, !range !2
  %31 = icmp ne i8 %30, 0
  %32 = getelementptr inbounds %struct.anon.20, %struct.anon.20* %6, i64 0, i32 6
  %33 = load i8, i8* %32, align 1
  %34 = call %struct.ArrayType* @construct_md_array(i64* %20, i8* %22, i32 1, i32* nonnull %23, i32* nonnull %24, i32 %8, i32 %28, i1 zeroext %31, i8 signext %33) #9
  br label %332

; <label>:35:                                     ; preds = %2
  %36 = sext i32 %10 to i64
  %37 = shl nsw i64 %36, 3
  %38 = tail call i8* @palloc(i64 %37) #9
  %39 = bitcast i8* %38 to i8**
  %40 = tail call i8* @palloc(i64 %37) #9
  %41 = bitcast i8* %40 to i8**
  %42 = shl nsw i64 %36, 2
  %43 = tail call i8* @palloc(i64 %42) #9
  %44 = bitcast i8* %43 to i32*
  %45 = tail call i8* @palloc(i64 %42) #9
  %46 = bitcast i8* %45 to i32*
  %47 = icmp sgt i32 %10, 0
  br i1 %47, label %51, label %48

; <label>:48:                                     ; preds = %35
  %49 = getelementptr inbounds [6 x i32], [6 x i32]* %3, i64 0, i64 0
  store i32 0, i32* %49, align 16
  %50 = getelementptr inbounds [6 x i32], [6 x i32]* %4, i64 0, i64 0
  store i32 1, i32* %50, align 16
  br label %247

; <label>:51:                                     ; preds = %35
  %52 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %53 = getelementptr inbounds %union.anon.1, %union.anon.1* %5, i64 0, i32 0, i32 0
  br label %54

; <label>:54:                                     ; preds = %196, %51
  %55 = phi i64 [ 0, %51 ], [ %209, %196 ]
  %56 = phi i32 [ 0, %51 ], [ %208, %196 ]
  %57 = phi i32 [ 0, %51 ], [ %207, %196 ]
  %58 = phi i32 [ 0, %51 ], [ %206, %196 ]
  %59 = phi i32 [ 0, %51 ], [ %205, %196 ]
  %60 = phi i32 [ 0, %51 ], [ %204, %196 ]
  %61 = phi i32* [ null, %51 ], [ %203, %196 ]
  %62 = phi i8* [ null, %51 ], [ %202, %196 ]
  %63 = phi i32* [ null, %51 ], [ %201, %196 ]
  %64 = phi i8* [ null, %51 ], [ %200, %196 ]
  %65 = phi i8 [ 0, %51 ], [ %199, %196 ]
  %66 = phi i8 [ 0, %51 ], [ %198, %196 ]
  %67 = phi i8 [ 1, %51 ], [ %197, %196 ]
  %68 = load i8*, i8** %52, align 8
  %69 = getelementptr i8, i8* %68, i64 %55
  %70 = load i8, i8* %69, align 1, !range !2
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %72, label %196

; <label>:72:                                     ; preds = %54
  %73 = load i64*, i64** %53, align 8
  %74 = getelementptr i64, i64* %73, i64 %55
  %75 = bitcast i64* %74 to %struct.varlena**
  %76 = load %struct.varlena*, %struct.varlena** %75, align 8
  %77 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %76) #9
  %78 = getelementptr inbounds %struct.varlena, %struct.varlena* %77, i64 3
  %79 = bitcast %struct.varlena* %78 to i32*
  %80 = load i32, i32* %79, align 4
  %81 = icmp eq i32 %8, %80
  br i1 %81, label %91, label %82

; <label>:82:                                     ; preds = %72
  %83 = bitcast %struct.varlena* %78 to i32*
  %84 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2615, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__func__.ExecEvalArrayExpr, i64 0, i64 0), i8* null) #9
  %85 = tail call i32 @errcode(i32 67141764) #9
  %86 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.6, i64 0, i64 0)) #9
  %87 = load i32, i32* %83, align 4
  %88 = tail call i8* @format_type_be(i32 %87) #9
  %89 = tail call i8* @format_type_be(i32 %8) #9
  %90 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.7, i64 0, i64 0), i8* %88, i8* %89) #9
  tail call void (i32, ...) @errfinish(i32 %85, i32 %86, i32 %90) #9
  unreachable

; <label>:91:                                     ; preds = %72
  %92 = getelementptr inbounds %struct.varlena, %struct.varlena* %77, i64 1
  %93 = bitcast %struct.varlena* %92 to i32*
  %94 = load i32, i32* %93, align 4
  %95 = icmp slt i32 %94, 1
  br i1 %95, label %196, label %96

; <label>:96:                                     ; preds = %91
  %97 = and i8 %67, 1
  %98 = icmp eq i8 %97, 0
  br i1 %98, label %118, label %99

; <label>:99:                                     ; preds = %96
  %100 = add i32 %94, 1
  %101 = icmp ugt i32 %94, 5
  br i1 %101, label %102, label %106

; <label>:102:                                    ; preds = %99
  %103 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2634, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__func__.ExecEvalArrayExpr, i64 0, i64 0), i8* null) #9
  %104 = tail call i32 @errcode(i32 261) #9
  %105 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.8, i64 0, i64 0), i32 %100, i32 6) #9
  tail call void (i32, ...) @errfinish(i32 %104, i32 %105) #9
  unreachable

; <label>:106:                                    ; preds = %99
  %107 = sext i32 %94 to i64
  %108 = shl nsw i64 %107, 2
  %109 = tail call i8* @palloc(i64 %108) #9
  %110 = bitcast i8* %109 to i32*
  %111 = getelementptr %struct.varlena, %struct.varlena* %77, i64 0, i32 0, i64 16
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %109, i8* align 4 %111, i64 %108, i1 false)
  %112 = tail call i8* @palloc(i64 %108) #9
  %113 = bitcast i8* %112 to i32*
  %114 = load i32, i32* %93, align 4
  %115 = sext i32 %114 to i64
  %116 = shl nsw i64 %115, 2
  %117 = getelementptr i8, i8* %111, i64 %116
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %112, i8* align 4 %117, i64 %108, i1 false)
  br label %134

; <label>:118:                                    ; preds = %96
  %119 = icmp eq i32 %60, %94
  br i1 %119, label %120, label %130

; <label>:120:                                    ; preds = %118
  %121 = getelementptr %struct.varlena, %struct.varlena* %77, i64 0, i32 0, i64 16
  %122 = sext i32 %60 to i64
  %123 = shl nsw i64 %122, 2
  %124 = tail call i32 @memcmp(i8* %62, i8* %121, i64 %123) #10
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %120
  %127 = getelementptr i8, i8* %121, i64 %123
  %128 = tail call i32 @memcmp(i8* %64, i8* %127, i64 %123) #10
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %134, label %130

; <label>:130:                                    ; preds = %126, %120, %118
  %131 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2654, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__func__.ExecEvalArrayExpr, i64 0, i64 0), i8* null) #9
  %132 = tail call i32 @errcode(i32 352845954) #9
  %133 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.9, i64 0, i64 0)) #9
  tail call void (i32, ...) @errfinish(i32 %132, i32 %133) #9
  unreachable

; <label>:134:                                    ; preds = %126, %106
  %135 = phi i8 [ 0, %106 ], [ %67, %126 ]
  %136 = phi i8* [ %112, %106 ], [ %64, %126 ]
  %137 = phi i32* [ %113, %106 ], [ %63, %126 ]
  %138 = phi i8* [ %109, %106 ], [ %62, %126 ]
  %139 = phi i32* [ %110, %106 ], [ %61, %126 ]
  %140 = phi i32 [ %94, %106 ], [ %60, %126 ]
  %141 = phi i32 [ %100, %106 ], [ %56, %126 ]
  %142 = getelementptr inbounds %struct.varlena, %struct.varlena* %77, i64 2
  %143 = bitcast %struct.varlena* %142 to i32*
  %144 = load i32, i32* %143, align 4
  %145 = icmp eq i32 %144, 0
  br i1 %145, label %148, label %146

; <label>:146:                                    ; preds = %134
  %147 = sext i32 %144 to i64
  br label %154

; <label>:148:                                    ; preds = %134
  %149 = load i32, i32* %93, align 4
  %150 = sext i32 %149 to i64
  %151 = shl nsw i64 %150, 3
  %152 = add nsw i64 %151, 23
  %153 = and i64 %152, -8
  br label %154

; <label>:154:                                    ; preds = %148, %146
  %155 = phi i64 [ %147, %146 ], [ %153, %148 ]
  %156 = getelementptr %struct.varlena, %struct.varlena* %77, i64 0, i32 0, i64 %155
  %157 = sext i32 %59 to i64
  %158 = getelementptr i8*, i8** %39, i64 %157
  store i8* %156, i8** %158, align 8
  %159 = load i32, i32* %143, align 4
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %167, label %161

; <label>:161:                                    ; preds = %154
  %162 = getelementptr %struct.varlena, %struct.varlena* %77, i64 0, i32 0, i64 16
  %163 = load i32, i32* %93, align 4
  %164 = sext i32 %163 to i64
  %165 = shl nsw i64 %164, 3
  %166 = getelementptr i8, i8* %162, i64 %165
  br label %167

; <label>:167:                                    ; preds = %161, %154
  %168 = phi i8* [ %166, %161 ], [ null, %154 ]
  %169 = getelementptr i8*, i8** %41, i64 %157
  store i8* %168, i8** %169, align 8
  %170 = bitcast %struct.varlena* %77 to i32*
  %171 = load i32, i32* %170, align 4
  %172 = lshr i32 %171, 2
  %173 = load i32, i32* %143, align 4
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %180

; <label>:175:                                    ; preds = %167
  %176 = load i32, i32* %93, align 4
  %177 = shl i32 %176, 3
  %178 = add i32 %177, 23
  %179 = and i32 %178, -8
  br label %180

; <label>:180:                                    ; preds = %175, %167
  %181 = phi i32 [ %179, %175 ], [ %173, %167 ]
  %182 = sub i32 %172, %181
  %183 = getelementptr i32, i32* %44, i64 %157
  store i32 %182, i32* %183, align 4
  %184 = add i32 %182, %57
  %185 = getelementptr %struct.varlena, %struct.varlena* %77, i64 0, i32 0, i64 16
  %186 = bitcast i8* %185 to i32*
  %187 = tail call i32 @ArrayGetNItems(i32 %94, i32* %186) #9
  %188 = getelementptr i32, i32* %46, i64 %157
  store i32 %187, i32* %188, align 4
  %189 = add i32 %187, %58
  %190 = load i32, i32* %143, align 4
  %191 = icmp ne i32 %190, 0
  %192 = zext i1 %191 to i8
  %193 = and i8 %66, 1
  %194 = or i8 %193, %192
  %195 = add i32 %59, 1
  br label %196

; <label>:196:                                    ; preds = %180, %91, %54
  %197 = phi i8 [ %135, %180 ], [ %67, %54 ], [ %67, %91 ]
  %198 = phi i8 [ %194, %180 ], [ %66, %54 ], [ %66, %91 ]
  %199 = phi i8 [ %65, %180 ], [ 1, %54 ], [ 1, %91 ]
  %200 = phi i8* [ %136, %180 ], [ %64, %54 ], [ %64, %91 ]
  %201 = phi i32* [ %137, %180 ], [ %63, %54 ], [ %63, %91 ]
  %202 = phi i8* [ %138, %180 ], [ %62, %54 ], [ %62, %91 ]
  %203 = phi i32* [ %139, %180 ], [ %61, %54 ], [ %61, %91 ]
  %204 = phi i32 [ %140, %180 ], [ %60, %54 ], [ %60, %91 ]
  %205 = phi i32 [ %195, %180 ], [ %59, %54 ], [ %59, %91 ]
  %206 = phi i32 [ %189, %180 ], [ %58, %54 ], [ %58, %91 ]
  %207 = phi i32 [ %184, %180 ], [ %57, %54 ], [ %57, %91 ]
  %208 = phi i32 [ %141, %180 ], [ %56, %54 ], [ %56, %91 ]
  %209 = add nuw nsw i64 %55, 1
  %210 = icmp slt i64 %209, %36
  br i1 %210, label %54, label %211

; <label>:211:                                    ; preds = %196
  %212 = and i8 %199, 1
  %213 = icmp eq i8 %212, 0
  br i1 %213, label %220, label %214

; <label>:214:                                    ; preds = %211
  %215 = icmp eq i32 %208, 0
  br i1 %215, label %327, label %216

; <label>:216:                                    ; preds = %214
  %217 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2684, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__func__.ExecEvalArrayExpr, i64 0, i64 0), i8* null) #9
  %218 = tail call i32 @errcode(i32 352845954) #9
  %219 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.9, i64 0, i64 0)) #9
  tail call void (i32, ...) @errfinish(i32 %218, i32 %219) #9
  unreachable

; <label>:220:                                    ; preds = %211
  %221 = getelementptr inbounds [6 x i32], [6 x i32]* %3, i64 0, i64 0
  store i32 %205, i32* %221, align 16
  %222 = getelementptr inbounds [6 x i32], [6 x i32]* %4, i64 0, i64 0
  store i32 1, i32* %222, align 16
  %223 = icmp sgt i32 %208, 1
  br i1 %223, label %224, label %237

; <label>:224:                                    ; preds = %220
  %225 = zext i32 %208 to i64
  br label %226

; <label>:226:                                    ; preds = %226, %224
  %227 = phi i64 [ 1, %224 ], [ %235, %226 ]
  %228 = add nsw i64 %227, -1
  %229 = getelementptr i32, i32* %203, i64 %228
  %230 = load i32, i32* %229, align 4
  %231 = getelementptr [6 x i32], [6 x i32]* %3, i64 0, i64 %227
  store i32 %230, i32* %231, align 4
  %232 = getelementptr i32, i32* %201, i64 %228
  %233 = load i32, i32* %232, align 4
  %234 = getelementptr [6 x i32], [6 x i32]* %4, i64 0, i64 %227
  store i32 %233, i32* %234, align 4
  %235 = add nuw nsw i64 %227, 1
  %236 = icmp eq i64 %235, %225
  br i1 %236, label %237, label %226

; <label>:237:                                    ; preds = %226, %220
  %238 = and i8 %198, 1
  %239 = icmp eq i8 %238, 0
  %240 = shl i32 %208, 3
  br i1 %239, label %247, label %241

; <label>:241:                                    ; preds = %237
  %242 = add i32 %206, 7
  %243 = sdiv i32 %242, 8
  %244 = add nsw i32 %243, 23
  %245 = add i32 %244, %240
  %246 = and i32 %245, -8
  br label %254

; <label>:247:                                    ; preds = %237, %48
  %248 = phi i32 [ 0, %48 ], [ %240, %237 ]
  %249 = phi i32 [ 0, %48 ], [ %208, %237 ]
  %250 = phi i32 [ 0, %48 ], [ %207, %237 ]
  %251 = phi i32 [ 0, %48 ], [ %205, %237 ]
  %252 = add i32 %248, 23
  %253 = and i32 %252, -8
  br label %254

; <label>:254:                                    ; preds = %247, %241
  %255 = phi i1 [ true, %241 ], [ false, %247 ]
  %256 = phi i32 [ %208, %241 ], [ %249, %247 ]
  %257 = phi i32 [ %207, %241 ], [ %250, %247 ]
  %258 = phi i32 [ %205, %241 ], [ %251, %247 ]
  %259 = phi i32 [ %246, %241 ], [ 0, %247 ]
  %260 = phi i32 [ %246, %241 ], [ %253, %247 ]
  %261 = add i32 %260, %257
  %262 = sext i32 %261 to i64
  %263 = tail call i8* @palloc(i64 %262) #9
  %264 = bitcast i8* %263 to %struct.ArrayType*
  %265 = shl i32 %261, 2
  %266 = bitcast i8* %263 to i32*
  store i32 %265, i32* %266, align 4
  %267 = getelementptr inbounds i8, i8* %263, i64 4
  %268 = bitcast i8* %267 to i32*
  store i32 %256, i32* %268, align 4
  %269 = getelementptr inbounds i8, i8* %263, i64 8
  %270 = bitcast i8* %269 to i32*
  store i32 %259, i32* %270, align 4
  %271 = getelementptr inbounds i8, i8* %263, i64 12
  %272 = bitcast i8* %271 to i32*
  store i32 %8, i32* %272, align 4
  %273 = getelementptr i8, i8* %263, i64 16
  %274 = sext i32 %256 to i64
  %275 = shl nsw i64 %274, 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %273, i8* nonnull align 16 %11, i64 %275, i1 false)
  %276 = getelementptr i8, i8* %273, i64 %275
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %276, i8* nonnull align 16 %12, i64 %275, i1 false)
  %277 = load i32, i32* %270, align 4
  %278 = icmp eq i32 %277, 0
  br i1 %278, label %281, label %279

; <label>:279:                                    ; preds = %254
  %280 = sext i32 %277 to i64
  br label %287

; <label>:281:                                    ; preds = %254
  %282 = load i32, i32* %268, align 4
  %283 = sext i32 %282 to i64
  %284 = shl nsw i64 %283, 3
  %285 = add nsw i64 %284, 23
  %286 = and i64 %285, -8
  br label %287

; <label>:287:                                    ; preds = %281, %279
  %288 = phi i64 [ %280, %279 ], [ %286, %281 ]
  %289 = icmp sgt i32 %258, 0
  br i1 %289, label %290, label %332

; <label>:290:                                    ; preds = %287
  %291 = getelementptr i8, i8* %263, i64 %288
  %292 = zext i32 %258 to i64
  br label %293

; <label>:293:                                    ; preds = %321, %290
  %294 = phi i64 [ 0, %290 ], [ %325, %321 ]
  %295 = phi i32 [ 0, %290 ], [ %324, %321 ]
  %296 = phi i8* [ %291, %290 ], [ %304, %321 ]
  %297 = getelementptr i8*, i8** %39, i64 %294
  %298 = load i8*, i8** %297, align 8
  %299 = getelementptr i32, i32* %44, i64 %294
  %300 = load i32, i32* %299, align 4
  %301 = sext i32 %300 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %296, i8* align 1 %298, i64 %301, i1 false)
  %302 = load i32, i32* %299, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr i8, i8* %296, i64 %303
  br i1 %255, label %307, label %305

; <label>:305:                                    ; preds = %293
  %306 = getelementptr i32, i32* %46, i64 %294
  br label %321

; <label>:307:                                    ; preds = %293
  %308 = load i32, i32* %270, align 4
  %309 = icmp eq i32 %308, 0
  br i1 %309, label %315, label %310

; <label>:310:                                    ; preds = %307
  %311 = load i32, i32* %268, align 4
  %312 = sext i32 %311 to i64
  %313 = shl nsw i64 %312, 3
  %314 = getelementptr i8, i8* %273, i64 %313
  br label %315

; <label>:315:                                    ; preds = %310, %307
  %316 = phi i8* [ %314, %310 ], [ null, %307 ]
  %317 = getelementptr i8*, i8** %41, i64 %294
  %318 = load i8*, i8** %317, align 8
  %319 = getelementptr i32, i32* %46, i64 %294
  %320 = load i32, i32* %319, align 4
  tail call void @array_bitmap_copy(i8* %316, i32 %295, i8* %318, i32 0, i32 %320) #9
  br label %321

; <label>:321:                                    ; preds = %315, %305
  %322 = phi i32* [ %306, %305 ], [ %319, %315 ]
  %323 = load i32, i32* %322, align 4
  %324 = add i32 %323, %295
  %325 = add nuw nsw i64 %294, 1
  %326 = icmp eq i64 %325, %292
  br i1 %326, label %332, label %293

; <label>:327:                                    ; preds = %214
  %328 = tail call %struct.ArrayType* @construct_empty_array(i32 %8) #9
  %329 = ptrtoint %struct.ArrayType* %328 to i64
  %330 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %331 = load i64*, i64** %330, align 8
  store i64 %329, i64* %331, align 8
  br label %337

; <label>:332:                                    ; preds = %321, %287, %18
  %333 = phi %struct.ArrayType* [ %34, %18 ], [ %264, %287 ], [ %264, %321 ]
  %334 = ptrtoint %struct.ArrayType* %333 to i64
  %335 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %336 = load i64*, i64** %335, align 8
  store i64 %334, i64* %336, align 8
  br label %337

; <label>:337:                                    ; preds = %332, %327
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #9
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %11) #9
  ret void
}

declare dso_local %struct.ArrayType* @construct_md_array(i64*, i8*, i32, i32*, i32*, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #5

declare dso_local i8* @palloc(i64) local_unnamed_addr #5

declare dso_local %struct.varlena* @pg_detoast_datum(%struct.varlena*) local_unnamed_addr #5

declare dso_local i32 @errdetail(i8*, ...) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #2

; Function Attrs: nounwind readonly
declare dso_local i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #7

declare dso_local i32 @ArrayGetNItems(i32, i32*) local_unnamed_addr #5

declare dso_local %struct.ArrayType* @construct_empty_array(i32) local_unnamed_addr #5

declare dso_local void @array_bitmap_copy(i8*, i32, i8*, i32, i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalArrayCoerce(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %5 = load i8*, i8** %4, align 8
  %6 = load i8, i8* %5, align 1, !range !2
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %35

; <label>:8:                                      ; preds = %3
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %13 = bitcast %union.anon.1* %12 to %struct.ExprState**
  %14 = load %struct.ExprState*, %struct.ExprState** %13, align 8
  %15 = icmp eq %struct.ExprState* %14, null
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %8
  %17 = inttoptr i64 %11 to %struct.varlena*
  %18 = tail call %struct.varlena* @pg_detoast_datum_copy(%struct.varlena* %17) #9
  %19 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %20 = bitcast i8** %19 to i32*
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %struct.varlena, %struct.varlena* %18, i64 3
  %23 = bitcast %struct.varlena* %22 to i32*
  store i32 %21, i32* %23, align 4
  %24 = ptrtoint %struct.varlena* %18 to i64
  %25 = load i64*, i64** %9, align 8
  store i64 %24, i64* %25, align 8
  br label %35

; <label>:26:                                     ; preds = %8
  %27 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %28 = bitcast i8** %27 to i32*
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %31 = bitcast i32* %30 to %struct.ArrayMapState**
  %32 = load %struct.ArrayMapState*, %struct.ArrayMapState** %31, align 8
  %33 = tail call i64 @array_map(i64 %11, %struct.ExprState* nonnull %14, %struct.ExprContext* %2, i32 %29, %struct.ArrayMapState* %32) #9
  %34 = load i64*, i64** %9, align 8
  store i64 %33, i64* %34, align 8
  br label %35

; <label>:35:                                     ; preds = %26, %16, %3
  ret void
}

declare dso_local %struct.varlena* @pg_detoast_datum_copy(%struct.varlena*) local_unnamed_addr #5

declare dso_local i64 @array_map(i64, %struct.ExprState*, %struct.ExprContext*, i32, %struct.ArrayMapState*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalRow(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.tupleDesc**
  %5 = load %struct.tupleDesc*, %struct.tupleDesc** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %7 = bitcast i8** %6 to i64**
  %8 = load i64*, i64** %7, align 8
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %10 = bitcast i32* %9 to i8**
  %11 = load i8*, i8** %10, align 8
  %12 = tail call %struct.HeapTupleData* @heap_form_tuple(%struct.tupleDesc* %5, i64* %8, i8* %11) #9
  %13 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %12, i64 0, i32 3
  %14 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %13, align 8
  %15 = tail call i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData* %14) #9
  %16 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %17 = load i64*, i64** %16, align 8
  store i64 %15, i64* %17, align 8
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  store i8 0, i8* %19, align 1
  ret void
}

declare dso_local %struct.HeapTupleData* @heap_form_tuple(%struct.tupleDesc*, i64*, i8*) local_unnamed_addr #5

declare dso_local i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalMinMax(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 0
  %4 = load i64*, i64** %3, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %6 = load i8*, i8** %5, align 8
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %8 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %7, align 8
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 3
  %10 = load i32, i32* %9, align 4
  %11 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %12 = load i8*, i8** %11, align 8
  store i8 1, i8* %12, align 1
  %13 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %14 = load i32, i32* %13, align 8
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %16, label %67

; <label>:16:                                     ; preds = %2
  %17 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %18 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %8, i64 0, i32 6, i64 0
  %19 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %8, i64 0, i32 6, i64 1
  %20 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %8, i64 0, i32 4
  %21 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %8, i64 0, i32 0
  %22 = icmp eq i32 %10, 1
  %23 = icmp eq i32 %10, 0
  br label %24

; <label>:24:                                     ; preds = %62, %16
  %25 = phi i64 [ 0, %16 ], [ %63, %62 ]
  %26 = getelementptr i8, i8* %6, i64 %25
  %27 = load i8, i8* %26, align 1, !range !2
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %62

; <label>:29:                                     ; preds = %24
  %30 = load i8*, i8** %11, align 8
  %31 = load i8, i8* %30, align 1, !range !2
  %32 = icmp eq i8 %31, 0
  br i1 %32, label %38, label %33

; <label>:33:                                     ; preds = %29
  %34 = getelementptr i64, i64* %4, i64 %25
  %35 = load i64, i64* %34, align 8
  %36 = load i64*, i64** %17, align 8
  store i64 %35, i64* %36, align 8
  %37 = load i8*, i8** %11, align 8
  store i8 0, i8* %37, align 1
  br label %62

; <label>:38:                                     ; preds = %29
  %39 = load i64*, i64** %17, align 8
  %40 = load i64, i64* %39, align 8
  store i64 %40, i64* %18, align 8
  %41 = getelementptr i64, i64* %4, i64 %25
  %42 = load i64, i64* %41, align 8
  store i64 %42, i64* %19, align 8
  store i8 0, i8* %20, align 4
  %43 = load %struct.FmgrInfo*, %struct.FmgrInfo** %21, align 8
  %44 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %43, i64 0, i32 0
  %45 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %44, align 8
  %46 = tail call i64 %45(%struct.FunctionCallInfoData* %8) #9
  %47 = trunc i64 %46 to i32
  %48 = load i8, i8* %20, align 4, !range !2
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %50, label %62

; <label>:50:                                     ; preds = %38
  %51 = icmp sgt i32 %47, 0
  %52 = and i1 %22, %51
  br i1 %52, label %53, label %56

; <label>:53:                                     ; preds = %50
  %54 = load i64, i64* %41, align 8
  %55 = load i64*, i64** %17, align 8
  store i64 %54, i64* %55, align 8
  br label %62

; <label>:56:                                     ; preds = %50
  %57 = icmp slt i32 %47, 0
  %58 = and i1 %23, %57
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %56
  %60 = load i64, i64* %41, align 8
  %61 = load i64*, i64** %17, align 8
  store i64 %60, i64* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %59, %56, %53, %38, %33, %24
  %63 = add nuw nsw i64 %25, 1
  %64 = load i32, i32* %13, align 8
  %65 = sext i32 %64 to i64
  %66 = icmp slt i64 %63, %65
  br i1 %66, label %24, label %67

; <label>:67:                                     ; preds = %62, %2
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalFieldSelect(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep*, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = alloca %struct.HeapTupleData, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %6 = bitcast %union.anon.1* %5 to %struct.anon.26*
  %7 = bitcast %union.anon.1* %5 to i16*
  %8 = load i16, i16* %7, align 8
  %9 = bitcast %struct.HeapTupleData* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %9) #9
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8
  %12 = load i8, i8* %11, align 1, !range !2
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %263

; <label>:14:                                     ; preds = %3
  %15 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %16 = load i64*, i64** %15, align 8
  %17 = load i64, i64* %16, align 8
  %18 = inttoptr i64 %17 to %struct.varattrib_1b*
  %19 = getelementptr inbounds %struct.varattrib_1b, %struct.varattrib_1b* %18, i64 0, i32 0
  %20 = load i8, i8* %19, align 1
  %21 = icmp eq i8 %20, 1
  br i1 %21, label %22, label %98

; <label>:22:                                     ; preds = %14
  %23 = inttoptr i64 %17 to %struct.varattrib_1b_e*
  %24 = getelementptr inbounds %struct.varattrib_1b_e, %struct.varattrib_1b_e* %23, i64 0, i32 1
  %25 = load i8, i8* %24, align 1
  %26 = and i8 %25, -2
  %27 = icmp eq i8 %26, 2
  br i1 %27, label %28, label %98

; <label>:28:                                     ; preds = %22
  %29 = tail call %struct.ExpandedObjectHeader* @DatumGetEOHP(i64 %17) #9
  %30 = bitcast %struct.ExpandedObjectHeader* %29 to %struct.ExpandedRecordHeader*
  %31 = getelementptr inbounds %struct.ExpandedObjectHeader, %struct.ExpandedObjectHeader* %29, i64 1, i32 3
  %32 = bitcast [10 x i8]* %31 to %struct.tupleDesc**
  %33 = load %struct.tupleDesc*, %struct.tupleDesc** %32, align 8
  %34 = icmp eq %struct.tupleDesc* %33, null
  br i1 %34, label %35, label %37, !prof !3

; <label>:35:                                     ; preds = %28
  %36 = tail call %struct.tupleDesc* @expanded_record_fetch_tupdesc(%struct.ExpandedRecordHeader* nonnull %30) #9
  br label %37

; <label>:37:                                     ; preds = %35, %28
  %38 = phi %struct.tupleDesc* [ %36, %35 ], [ %33, %28 ]
  %39 = sext i16 %8 to i32
  %40 = icmp slt i16 %8, 1
  br i1 %40, label %41, label %42

; <label>:41:                                     ; preds = %37
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2887, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0)) #9
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.10, i64 0, i64 0), i32 %39) #9
  unreachable

; <label>:42:                                     ; preds = %37
  %43 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %38, i64 0, i32 0
  %44 = load i32, i32* %43, align 8
  %45 = icmp slt i32 %44, %39
  br i1 %45, label %46, label %48

; <label>:46:                                     ; preds = %42
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2890, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0)) #9
  %47 = load i32, i32* %43, align 8
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i32 %39, i32 %47) #9
  unreachable

; <label>:48:                                     ; preds = %42
  %49 = add nsw i32 %39, -1
  %50 = sext i32 %49 to i64
  %51 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %38, i64 0, i32 6, i64 %50, i32 16
  %52 = load i8, i8* %51, align 1, !range !2
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %56, label %54

; <label>:54:                                     ; preds = %48
  %55 = load i8*, i8** %10, align 8
  store i8 1, i8* %55, align 1
  br label %263

; <label>:56:                                     ; preds = %48
  %57 = getelementptr inbounds %struct.anon.26, %struct.anon.26* %6, i64 0, i32 1
  %58 = load i32, i32* %57, align 4
  %59 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %38, i64 0, i32 6, i64 %50, i32 2
  %60 = load i32, i32* %59, align 4
  %61 = icmp eq i32 %58, %60
  br i1 %61, label %71, label %62

; <label>:62:                                     ; preds = %56
  %63 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2908, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0), i8* null) #9
  %64 = tail call i32 @errcode(i32 67141764) #9
  %65 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.12, i64 0, i64 0), i32 %39) #9
  %66 = load i32, i32* %59, align 4
  %67 = tail call i8* @format_type_be(i32 %66) #9
  %68 = load i32, i32* %57, align 4
  %69 = tail call i8* @format_type_be(i32 %68) #9
  %70 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.13, i64 0, i64 0), i8* %67, i8* %69) #9
  tail call void (i32, ...) @errfinish(i32 %64, i32 %65, i32 %70) #9
  unreachable

; <label>:71:                                     ; preds = %56
  %72 = load i8*, i8** %10, align 8
  %73 = getelementptr inbounds %struct.ExpandedRecordHeader, %struct.ExpandedRecordHeader* %30, i64 0, i32 2
  %74 = load i32, i32* %73, align 4
  %75 = and i32 %74, 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %93, label %77, !prof !5

; <label>:77:                                     ; preds = %71
  %78 = getelementptr inbounds %struct.ExpandedObjectHeader, %struct.ExpandedObjectHeader* %29, i64 2, i32 1
  %79 = bitcast %struct.ExpandedObjectMethods** %78 to i32*
  %80 = load i32, i32* %79, align 8
  %81 = icmp slt i32 %80, %39
  br i1 %81, label %93, label %82, !prof !3

; <label>:82:                                     ; preds = %77
  %83 = getelementptr inbounds %struct.ExpandedObjectHeader, %struct.ExpandedObjectHeader* %29, i64 2
  %84 = bitcast %struct.ExpandedObjectHeader* %83 to i8**
  %85 = load i8*, i8** %84, align 8
  %86 = getelementptr i8, i8* %85, i64 %50
  %87 = load i8, i8* %86, align 1, !range !2
  store i8 %87, i8* %72, align 1
  %88 = getelementptr inbounds %struct.ExpandedObjectHeader, %struct.ExpandedObjectHeader* %29, i64 1, i32 4, i64 6
  %89 = bitcast i8* %88 to i64**
  %90 = load i64*, i64** %89, align 8
  %91 = getelementptr i64, i64* %90, i64 %50
  %92 = load i64, i64* %91, align 8
  br label %95

; <label>:93:                                     ; preds = %77, %71
  %94 = tail call i64 @expanded_record_fetch_field(%struct.ExpandedRecordHeader* nonnull %30, i32 %39, i8* %72) #9
  br label %95

; <label>:95:                                     ; preds = %93, %82
  %96 = phi i64 [ %92, %82 ], [ %94, %93 ]
  %97 = load i64*, i64** %15, align 8
  store i64 %96, i64* %97, align 8
  br label %263

; <label>:98:                                     ; preds = %22, %14
  %99 = inttoptr i64 %17 to %struct.varlena*
  %100 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %99) #9
  %101 = getelementptr inbounds %struct.varlena, %struct.varlena* %100, i64 2
  %102 = bitcast %struct.varlena* %101 to i32*
  %103 = load i32, i32* %102, align 4
  %104 = getelementptr inbounds %struct.varlena, %struct.varlena* %100, i64 1
  %105 = bitcast %struct.varlena* %104 to i32*
  %106 = load i32, i32* %105, align 4
  %107 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %108 = bitcast i8** %107 to %struct.tupleDesc**
  %109 = load %struct.tupleDesc*, %struct.tupleDesc** %108, align 8
  %110 = icmp eq %struct.tupleDesc* %109, null
  br i1 %110, label %119, label %111

; <label>:111:                                    ; preds = %98
  %112 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %109, i64 0, i32 1
  %113 = load i32, i32* %112, align 4
  %114 = icmp eq i32 %113, %103
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %111
  %116 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %109, i64 0, i32 2
  %117 = load i32, i32* %116, align 8
  %118 = icmp eq i32 %117, %106
  br i1 %118, label %131, label %119

; <label>:119:                                    ; preds = %115, %111, %98
  %120 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc(i32 %103, i32 %106) #9
  %121 = load %struct.tupleDesc*, %struct.tupleDesc** %108, align 8
  %122 = icmp eq %struct.tupleDesc* %121, null
  br i1 %122, label %128, label %123

; <label>:123:                                    ; preds = %119
  %124 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %121, i64 0, i32 4
  %125 = load i32, i32* %124, align 8
  %126 = icmp sgt i32 %125, -1
  br i1 %126, label %127, label %130

; <label>:127:                                    ; preds = %123
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %121) #9
  br label %130

; <label>:128:                                    ; preds = %119
  %129 = ptrtoint i8** %107 to i64
  tail call void @RegisterExprContextCallback(%struct.ExprContext* %2, void (i64)* nonnull @ShutdownTupleDescRef, i64 %129) #9
  br label %130

; <label>:130:                                    ; preds = %128, %127, %123
  store %struct.tupleDesc* %120, %struct.tupleDesc** %108, align 8
  br label %131

; <label>:131:                                    ; preds = %130, %115
  %132 = phi %struct.tupleDesc* [ %120, %130 ], [ %109, %115 ]
  %133 = sext i16 %8 to i32
  %134 = icmp slt i16 %8, 1
  br i1 %134, label %135, label %136

; <label>:135:                                    ; preds = %131
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2934, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0)) #9
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.10, i64 0, i64 0), i32 %133) #9
  unreachable

; <label>:136:                                    ; preds = %131
  %137 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 0
  %138 = load i32, i32* %137, align 8
  %139 = icmp slt i32 %138, %133
  br i1 %139, label %140, label %142

; <label>:140:                                    ; preds = %136
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2937, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0)) #9
  %141 = load i32, i32* %137, align 8
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.11, i64 0, i64 0), i32 %133, i32 %141) #9
  unreachable

; <label>:142:                                    ; preds = %136
  %143 = add nsw i32 %133, -1
  %144 = sext i32 %143 to i64
  %145 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 6, i64 %144, i32 16
  %146 = load i8, i8* %145, align 1, !range !2
  %147 = icmp eq i8 %146, 0
  br i1 %147, label %150, label %148

; <label>:148:                                    ; preds = %142
  %149 = load i8*, i8** %10, align 8
  store i8 1, i8* %149, align 1
  br label %263

; <label>:150:                                    ; preds = %142
  %151 = getelementptr inbounds %struct.anon.26, %struct.anon.26* %6, i64 0, i32 1
  %152 = load i32, i32* %151, align 4
  %153 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 6, i64 %144, i32 2
  %154 = load i32, i32* %153, align 4
  %155 = icmp eq i32 %152, %154
  br i1 %155, label %165, label %156

; <label>:156:                                    ; preds = %150
  %157 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2955, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalFieldSelect, i64 0, i64 0), i8* null) #9
  %158 = tail call i32 @errcode(i32 67141764) #9
  %159 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.12, i64 0, i64 0), i32 %133) #9
  %160 = load i32, i32* %153, align 4
  %161 = tail call i8* @format_type_be(i32 %160) #9
  %162 = load i32, i32* %151, align 4
  %163 = tail call i8* @format_type_be(i32 %162) #9
  %164 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.13, i64 0, i64 0), i8* %161, i8* %163) #9
  tail call void (i32, ...) @errfinish(i32 %158, i32 %159, i32 %164) #9
  unreachable

; <label>:165:                                    ; preds = %150
  %166 = bitcast %struct.varlena* %100 to i32*
  %167 = load i32, i32* %166, align 4
  %168 = lshr i32 %167, 2
  %169 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 0
  store i32 %168, i32* %169, align 8
  %170 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 3
  %171 = bitcast %struct.HeapTupleHeaderData** %170 to %struct.varlena**
  store %struct.varlena* %100, %struct.varlena** %171, align 8
  %172 = getelementptr inbounds %struct.varlena, %struct.varlena* %100, i64 4, i32 0, i64 2
  %173 = bitcast i8* %172 to i16*
  %174 = load i16, i16* %173, align 2
  %175 = and i16 %174, 2047
  %176 = zext i16 %175 to i32
  %177 = icmp sgt i32 %133, %176
  %178 = load i8*, i8** %10, align 8
  br i1 %177, label %179, label %181

; <label>:179:                                    ; preds = %165
  %180 = tail call i64 @getmissingattr(%struct.tupleDesc* nonnull %132, i32 %133, i8* %178) #9
  br label %260

; <label>:181:                                    ; preds = %165
  store i8 0, i8* %178, align 1
  %182 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %170, align 8
  %183 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 3
  %184 = load i16, i16* %183, align 4
  %185 = and i16 %184, 1
  %186 = icmp eq i16 %185, 0
  br i1 %186, label %187, label %246

; <label>:187:                                    ; preds = %181
  %188 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 6, i64 %144, i32 7
  %189 = load i32, i32* %188, align 4
  %190 = icmp sgt i32 %189, -1
  br i1 %190, label %191, label %244

; <label>:191:                                    ; preds = %187
  %192 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 6, i64 %144, i32 9
  %193 = load i8, i8* %192, align 4, !range !2
  %194 = icmp eq i8 %193, 0
  br i1 %194, label %235, label %195

; <label>:195:                                    ; preds = %191
  %196 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %132, i64 0, i32 6, i64 %144, i32 4
  %197 = load i16, i16* %196, align 4
  switch i16 %197, label %219 [
    i16 8, label %198
    i16 4, label %208
  ]

; <label>:198:                                    ; preds = %195
  %199 = bitcast %struct.HeapTupleHeaderData* %182 to i8*
  %200 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 4
  %201 = load i8, i8* %200, align 2
  %202 = zext i8 %201 to i64
  %203 = getelementptr i8, i8* %199, i64 %202
  %204 = sext i32 %189 to i64
  %205 = getelementptr i8, i8* %203, i64 %204
  %206 = bitcast i8* %205 to i64*
  %207 = load i64, i64* %206, align 8
  br label %260

; <label>:208:                                    ; preds = %195
  %209 = bitcast %struct.HeapTupleHeaderData* %182 to i8*
  %210 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 4
  %211 = load i8, i8* %210, align 2
  %212 = zext i8 %211 to i64
  %213 = getelementptr i8, i8* %209, i64 %212
  %214 = sext i32 %189 to i64
  %215 = getelementptr i8, i8* %213, i64 %214
  %216 = bitcast i8* %215 to i32*
  %217 = load i32, i32* %216, align 4
  %218 = sext i32 %217 to i64
  br label %260

; <label>:219:                                    ; preds = %195
  %220 = icmp eq i16 %197, 2
  %221 = bitcast %struct.HeapTupleHeaderData* %182 to i8*
  %222 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 4
  %223 = load i8, i8* %222, align 2
  %224 = zext i8 %223 to i64
  %225 = getelementptr i8, i8* %221, i64 %224
  %226 = sext i32 %189 to i64
  %227 = getelementptr i8, i8* %225, i64 %226
  br i1 %220, label %228, label %232

; <label>:228:                                    ; preds = %219
  %229 = bitcast i8* %227 to i16*
  %230 = load i16, i16* %229, align 2
  %231 = sext i16 %230 to i64
  br label %260

; <label>:232:                                    ; preds = %219
  %233 = load i8, i8* %227, align 1
  %234 = sext i8 %233 to i64
  br label %260

; <label>:235:                                    ; preds = %191
  %236 = bitcast %struct.HeapTupleHeaderData* %182 to i8*
  %237 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 4
  %238 = load i8, i8* %237, align 2
  %239 = zext i8 %238 to i64
  %240 = getelementptr i8, i8* %236, i64 %239
  %241 = sext i32 %189 to i64
  %242 = getelementptr i8, i8* %240, i64 %241
  %243 = ptrtoint i8* %242 to i64
  br label %260

; <label>:244:                                    ; preds = %187
  %245 = call i64 @nocachegetattr(%struct.HeapTupleData* nonnull %4, i32 %133, %struct.tupleDesc* nonnull %132) #9
  br label %260

; <label>:246:                                    ; preds = %181
  %247 = ashr i32 %143, 3
  %248 = sext i32 %247 to i64
  %249 = getelementptr %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %182, i64 0, i32 5, i64 %248
  %250 = load i8, i8* %249, align 1
  %251 = zext i8 %250 to i32
  %252 = and i32 %143, 7
  %253 = shl i32 1, %252
  %254 = and i32 %253, %251
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %256, label %258

; <label>:256:                                    ; preds = %246
  %257 = load i8*, i8** %10, align 8
  store i8 1, i8* %257, align 1
  br label %260

; <label>:258:                                    ; preds = %246
  %259 = call i64 @nocachegetattr(%struct.HeapTupleData* nonnull %4, i32 %133, %struct.tupleDesc* nonnull %132) #9
  br label %260

; <label>:260:                                    ; preds = %258, %256, %244, %235, %232, %228, %208, %198, %179
  %261 = phi i64 [ %180, %179 ], [ %245, %244 ], [ %243, %235 ], [ %207, %198 ], [ %218, %208 ], [ %231, %228 ], [ %234, %232 ], [ 0, %256 ], [ %259, %258 ]
  %262 = load i64*, i64** %15, align 8
  store i64 %261, i64* %262, align 8
  br label %263

; <label>:263:                                    ; preds = %260, %148, %95, %54, %3
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #9
  ret void
}

declare dso_local %struct.ExpandedObjectHeader* @DatumGetEOHP(i64) local_unnamed_addr #5

declare dso_local i64 @getmissingattr(%struct.tupleDesc*, i32, i8*) local_unnamed_addr #5

declare dso_local i64 @nocachegetattr(%struct.HeapTupleData*, i32, %struct.tupleDesc*) local_unnamed_addr #5

declare dso_local i64 @heap_getsysattr(%struct.HeapTupleData*, i32, %struct.tupleDesc*, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalFieldStoreDeForm(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = alloca %struct.HeapTupleData, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %6 = bitcast %union.anon.1* %5 to %struct.FieldStore**
  %7 = load %struct.FieldStore*, %struct.FieldStore** %6, align 8
  %8 = getelementptr inbounds %struct.FieldStore, %struct.FieldStore* %7, i64 0, i32 4
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %11 = bitcast i8** %10 to %struct.tupleDesc***
  %12 = load %struct.tupleDesc**, %struct.tupleDesc*** %11, align 8
  %13 = load %struct.tupleDesc*, %struct.tupleDesc** %12, align 8
  %14 = icmp eq %struct.tupleDesc* %13, null
  br i1 %14, label %23, label %15

; <label>:15:                                     ; preds = %3
  %16 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %13, i64 0, i32 1
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, %9
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %15
  %20 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %13, i64 0, i32 2
  %21 = load i32, i32* %20, align 8
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %35, label %23

; <label>:23:                                     ; preds = %19, %15, %3
  %24 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc(i32 %9, i32 -1) #9
  %25 = load %struct.tupleDesc*, %struct.tupleDesc** %12, align 8
  %26 = icmp eq %struct.tupleDesc* %25, null
  br i1 %26, label %32, label %27

; <label>:27:                                     ; preds = %23
  %28 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %25, i64 0, i32 4
  %29 = load i32, i32* %28, align 8
  %30 = icmp sgt i32 %29, -1
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %27
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %25) #9
  br label %34

; <label>:32:                                     ; preds = %23
  %33 = ptrtoint %struct.tupleDesc** %12 to i64
  tail call void @RegisterExprContextCallback(%struct.ExprContext* %2, void (i64)* nonnull @ShutdownTupleDescRef, i64 %33) #9
  br label %34

; <label>:34:                                     ; preds = %32, %31, %27
  store %struct.tupleDesc* %24, %struct.tupleDesc** %12, align 8
  br label %35

; <label>:35:                                     ; preds = %34, %19
  %36 = phi %struct.tupleDesc* [ %24, %34 ], [ %13, %19 ]
  %37 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %36, i64 0, i32 0
  %38 = load i32, i32* %37, align 8
  %39 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %40 = bitcast %struct.FunctionCallInfoData** %39 to i32*
  %41 = load i32, i32* %40, align 8
  %42 = icmp sgt i32 %38, %41
  br i1 %42, label %43, label %47, !prof !3

; <label>:43:                                     ; preds = %35
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 2990, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__func__.ExecEvalFieldStoreDeForm, i64 0, i64 0)) #9
  %44 = load %struct.FieldStore*, %struct.FieldStore** %6, align 8
  %45 = getelementptr inbounds %struct.FieldStore, %struct.FieldStore* %44, i64 0, i32 4
  %46 = load i32, i32* %45, align 8
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.14, i64 0, i64 0), i32 %46) #9
  unreachable

; <label>:47:                                     ; preds = %35
  %48 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %49 = load i8*, i8** %48, align 8
  %50 = load i8, i8* %49, align 1, !range !2
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %57, label %52

; <label>:52:                                     ; preds = %47
  %53 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %54 = bitcast %struct.FmgrInfo** %53 to i8**
  %55 = load i8*, i8** %54, align 8
  %56 = sext i32 %41 to i64
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %55, i8 1, i64 %56, i1 false)
  br label %80

; <label>:57:                                     ; preds = %47
  %58 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %59 = bitcast i64** %58 to %struct.varlena***
  %60 = load %struct.varlena**, %struct.varlena*** %59, align 8
  %61 = load %struct.varlena*, %struct.varlena** %60, align 8
  %62 = bitcast %struct.HeapTupleData* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %62) #9
  %63 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %61) #9
  %64 = bitcast %struct.varlena* %63 to i32*
  %65 = load i32, i32* %64, align 4
  %66 = lshr i32 %65, 2
  %67 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 0
  store i32 %66, i32* %67, align 8
  %68 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 1, i32 0, i32 0
  store i16 -1, i16* %68, align 4
  %69 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 1, i32 0, i32 1
  store i16 -1, i16* %69, align 2
  %70 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 1, i32 1
  store i16 0, i16* %70, align 4
  %71 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 2
  store i32 0, i32* %71, align 4
  %72 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 3
  %73 = bitcast %struct.HeapTupleHeaderData** %72 to %struct.varlena**
  store %struct.varlena* %63, %struct.varlena** %73, align 8
  %74 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %75 = bitcast i32* %74 to i64**
  %76 = load i64*, i64** %75, align 8
  %77 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %78 = bitcast %struct.FmgrInfo** %77 to i8**
  %79 = load i8*, i8** %78, align 8
  call void @heap_deform_tuple(%struct.HeapTupleData* nonnull %4, %struct.tupleDesc* %36, i64* %76, i8* %79) #9
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %62) #9
  br label %80

; <label>:80:                                     ; preds = %57, %52
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #2

declare dso_local void @heap_deform_tuple(%struct.HeapTupleData*, %struct.tupleDesc*, i64*, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalFieldStoreForm(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readnone) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %5 = bitcast i8** %4 to %struct.tupleDesc***
  %6 = load %struct.tupleDesc**, %struct.tupleDesc*** %5, align 8
  %7 = load %struct.tupleDesc*, %struct.tupleDesc** %6, align 8
  %8 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %9 = bitcast i32* %8 to i64**
  %10 = load i64*, i64** %9, align 8
  %11 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %12 = bitcast %struct.FmgrInfo** %11 to i8**
  %13 = load i8*, i8** %12, align 8
  %14 = tail call %struct.HeapTupleData* @heap_form_tuple(%struct.tupleDesc* %7, i64* %10, i8* %13) #9
  %15 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %14, i64 0, i32 3
  %16 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %15, align 8
  %17 = tail call i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData* %16) #9
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %19 = load i64*, i64** %18, align 8
  store i64 %17, i64* %19, align 8
  %20 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %21 = load i8*, i8** %20, align 8
  store i8 0, i8* %21, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local zeroext i1 @ExecEvalArrayRefSubscript(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.ArrayRefState**
  %5 = load %struct.ArrayRefState*, %struct.ArrayRefState** %4, align 8
  %6 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 13
  %7 = load i8, i8* %6, align 8, !range !2
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %20, label %9

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 0
  %11 = load i8, i8* %10, align 8, !range !2
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %17, label %13

; <label>:13:                                     ; preds = %9
  %14 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3062, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.ExecEvalArrayRefSubscript, i64 0, i64 0), i8* null) #9
  %15 = tail call i32 @errcode(i32 67108994) #9
  %16 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.15, i64 0, i64 0)) #9
  tail call void (i32, ...) @errfinish(i32 %15, i32 %16) #9
  unreachable

; <label>:17:                                     ; preds = %9
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  store i8 1, i8* %19, align 1
  br label %36

; <label>:20:                                     ; preds = %2
  %21 = bitcast %union.anon.1* %3 to %struct.anon.28*
  %22 = getelementptr inbounds %struct.anon.28, %struct.anon.28* %21, i64 0, i32 2
  %23 = load i8, i8* %22, align 4, !range !2
  %24 = icmp eq i8 %23, 0
  %25 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 8, i64 0
  %26 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 11, i64 0
  %27 = select i1 %24, i32* %26, i32* %25
  %28 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %29 = bitcast i8** %28 to i32*
  %30 = load i32, i32* %29, align 8
  %31 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 12
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = sext i32 %30 to i64
  %35 = getelementptr i32, i32* %27, i64 %34
  store i32 %33, i32* %35, align 4
  br label %36

; <label>:36:                                     ; preds = %20, %17
  %37 = phi i1 [ false, %17 ], [ true, %20 ]
  ret i1 %37
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalArrayRefFetch(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.ArrayRefState**
  %5 = load %struct.ArrayRefState*, %struct.ArrayRefState** %4, align 8
  %6 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 9
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 6
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 8, i64 0
  br i1 %8, label %15, label %31

; <label>:15:                                     ; preds = %2
  %16 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 2
  %17 = load i16, i16* %16, align 8
  %18 = sext i16 %17 to i32
  %19 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %20 = load i16, i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %23 = load i8, i8* %22, align 4, !range !2
  %24 = icmp ne i8 %23, 0
  %25 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %26 = load i8, i8* %25, align 1
  %27 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %28 = load i8*, i8** %27, align 8
  %29 = tail call i64 @array_get_element(i64 %11, i32 %13, i32* nonnull %14, i32 %18, i32 %21, i1 zeroext %24, i8 signext %26, i8* %28) #9
  %30 = load i64*, i64** %9, align 8
  store i64 %29, i64* %30, align 8
  br label %48

; <label>:31:                                     ; preds = %2
  %32 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 11, i64 0
  %33 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 7, i64 0
  %34 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 10, i64 0
  %35 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 2
  %36 = load i16, i16* %35, align 8
  %37 = sext i16 %36 to i32
  %38 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %39 = load i16, i16* %38, align 2
  %40 = sext i16 %39 to i32
  %41 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %42 = load i8, i8* %41, align 4, !range !2
  %43 = icmp ne i8 %42, 0
  %44 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %45 = load i8, i8* %44, align 1
  %46 = tail call i64 @array_get_slice(i64 %11, i32 %13, i32* nonnull %14, i32* nonnull %32, i8* nonnull %33, i8* nonnull %34, i32 %37, i32 %40, i1 zeroext %43, i8 signext %45) #9
  %47 = load i64*, i64** %9, align 8
  store i64 %46, i64* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %31, %15
  ret void
}

declare dso_local i64 @array_get_element(i64, i32, i32*, i32, i32, i1 zeroext, i8 signext, i8*) local_unnamed_addr #5

declare dso_local i64 @array_get_slice(i64, i32, i32*, i32*, i8*, i8*, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalArrayRefOld(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.ArrayRefState**
  %5 = load %struct.ArrayRefState*, %struct.ArrayRefState** %4, align 8
  %6 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %7 = load i8*, i8** %6, align 8
  %8 = load i8, i8* %7, align 1, !range !2
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %13, label %10

; <label>:10:                                     ; preds = %2
  %11 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 16
  store i64 0, i64* %11, align 8
  %12 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 17
  store i8 1, i8* %12, align 8
  br label %56

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 9
  %15 = load i32, i32* %14, align 4
  %16 = icmp eq i32 %15, 0
  %17 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %18 = load i64*, i64** %17, align 8
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 6
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 8, i64 0
  br i1 %16, label %23, label %38

; <label>:23:                                     ; preds = %13
  %24 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 2
  %25 = load i16, i16* %24, align 8
  %26 = sext i16 %25 to i32
  %27 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %31 = load i8, i8* %30, align 4, !range !2
  %32 = icmp ne i8 %31, 0
  %33 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %34 = load i8, i8* %33, align 1
  %35 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 17
  %36 = tail call i64 @array_get_element(i64 %19, i32 %21, i32* nonnull %22, i32 %26, i32 %29, i1 zeroext %32, i8 signext %34, i8* nonnull %35) #9
  %37 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 16
  store i64 %36, i64* %37, align 8
  br label %56

; <label>:38:                                     ; preds = %13
  %39 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 11, i64 0
  %40 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 7, i64 0
  %41 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 10, i64 0
  %42 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 2
  %43 = load i16, i16* %42, align 8
  %44 = sext i16 %43 to i32
  %45 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %46 = load i16, i16* %45, align 2
  %47 = sext i16 %46 to i32
  %48 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %49 = load i8, i8* %48, align 4, !range !2
  %50 = icmp ne i8 %49, 0
  %51 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %52 = load i8, i8* %51, align 1
  %53 = tail call i64 @array_get_slice(i64 %19, i32 %21, i32* nonnull %22, i32* nonnull %39, i8* nonnull %40, i8* nonnull %41, i32 %44, i32 %47, i1 zeroext %50, i8 signext %52) #9
  %54 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 16
  store i64 %53, i64* %54, align 8
  %55 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 17
  store i8 0, i8* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %38, %23, %10
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalArrayRefAssign(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.ArrayRefState**
  %5 = load %struct.ArrayRefState*, %struct.ArrayRefState** %4, align 8
  %6 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 2
  %7 = load i16, i16* %6, align 8
  %8 = icmp sgt i16 %7, 0
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8
  %11 = load i8, i8* %10, align 1, !range !2
  %12 = icmp eq i8 %11, 0
  br i1 %8, label %13, label %18

; <label>:13:                                     ; preds = %2
  br i1 %12, label %14, label %78

; <label>:14:                                     ; preds = %13
  %15 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 15
  %16 = load i8, i8* %15, align 8, !range !2
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %19, label %78

; <label>:18:                                     ; preds = %2
  br i1 %12, label %19, label %21

; <label>:19:                                     ; preds = %18, %14
  %20 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  br label %29

; <label>:21:                                     ; preds = %18
  %22 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = tail call %struct.ArrayType* @construct_empty_array(i32 %23) #9
  %25 = ptrtoint %struct.ArrayType* %24 to i64
  %26 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %27 = load i64*, i64** %26, align 8
  store i64 %25, i64* %27, align 8
  %28 = load i8*, i8** %9, align 8
  store i8 0, i8* %28, align 1
  br label %29

; <label>:29:                                     ; preds = %21, %19
  %30 = phi i64** [ %20, %19 ], [ %26, %21 ]
  %31 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 9
  %32 = load i32, i32* %31, align 4
  %33 = icmp eq i32 %32, 0
  %34 = load i64*, i64** %30, align 8
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 6
  %37 = load i32, i32* %36, align 8
  %38 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 8, i64 0
  br i1 %33, label %39, label %57

; <label>:39:                                     ; preds = %29
  %40 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 14
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 15
  %43 = load i8, i8* %42, align 8, !range !2
  %44 = icmp ne i8 %43, 0
  %45 = load i16, i16* %6, align 8
  %46 = sext i16 %45 to i32
  %47 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %48 = load i16, i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %51 = load i8, i8* %50, align 4, !range !2
  %52 = icmp ne i8 %51, 0
  %53 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %54 = load i8, i8* %53, align 1
  %55 = tail call i64 @array_set_element(i64 %35, i32 %37, i32* nonnull %38, i64 %41, i1 zeroext %44, i32 %46, i32 %49, i1 zeroext %52, i8 signext %54) #9
  %56 = load i64*, i64** %30, align 8
  store i64 %55, i64* %56, align 8
  br label %78

; <label>:57:                                     ; preds = %29
  %58 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 11, i64 0
  %59 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 7, i64 0
  %60 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 10, i64 0
  %61 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 14
  %62 = load i64, i64* %61, align 8
  %63 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 15
  %64 = load i8, i8* %63, align 8, !range !2
  %65 = icmp ne i8 %64, 0
  %66 = load i16, i16* %6, align 8
  %67 = sext i16 %66 to i32
  %68 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 3
  %69 = load i16, i16* %68, align 2
  %70 = sext i16 %69 to i32
  %71 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 4
  %72 = load i8, i8* %71, align 4, !range !2
  %73 = icmp ne i8 %72, 0
  %74 = getelementptr inbounds %struct.ArrayRefState, %struct.ArrayRefState* %5, i64 0, i32 5
  %75 = load i8, i8* %74, align 1
  %76 = tail call i64 @array_set_slice(i64 %35, i32 %37, i32* nonnull %38, i32* nonnull %58, i8* nonnull %59, i8* nonnull %60, i64 %62, i1 zeroext %65, i32 %67, i32 %70, i1 zeroext %73, i8 signext %75) #9
  %77 = load i64*, i64** %30, align 8
  store i64 %76, i64* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %57, %39, %14, %13
  ret void
}

declare dso_local i64 @array_set_element(i64, i32, i32*, i64, i1 zeroext, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #5

declare dso_local i64 @array_set_slice(i64, i32, i32*, i32*, i8*, i8*, i64, i1 zeroext, i32, i32, i1 zeroext, i8 signext) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalConvertRowtype(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep*, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = alloca %struct.HeapTupleData, align 8
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %6 = bitcast %union.anon.1* %5 to %struct.ConvertRowtypeExpr**
  %7 = load %struct.ConvertRowtypeExpr*, %struct.ConvertRowtypeExpr** %6, align 8
  %8 = bitcast %struct.HeapTupleData* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #9
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %10 = load i8*, i8** %9, align 8
  %11 = load i8, i8* %10, align 1, !range !2
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %13, label %113

; <label>:13:                                     ; preds = %3
  %14 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %15 = bitcast i64** %14 to %struct.varlena***
  %16 = load %struct.varlena**, %struct.varlena*** %15, align 8
  %17 = load %struct.varlena*, %struct.varlena** %16, align 8
  %18 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %17) #9
  %19 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %20 = bitcast i8** %19 to %struct.tupleDesc**
  %21 = load %struct.tupleDesc*, %struct.tupleDesc** %20, align 8
  %22 = icmp eq %struct.tupleDesc* %21, null
  br i1 %22, label %23, label %53

; <label>:23:                                     ; preds = %13
  %24 = getelementptr inbounds %struct.ConvertRowtypeExpr, %struct.ConvertRowtypeExpr* %7, i64 0, i32 1
  %25 = bitcast %struct.Expr** %24 to %struct.Node**
  %26 = load %struct.Node*, %struct.Node** %25, align 8
  %27 = tail call i32 @exprType(%struct.Node* %26) #9
  %28 = load %struct.tupleDesc*, %struct.tupleDesc** %20, align 8
  %29 = icmp eq %struct.tupleDesc* %28, null
  br i1 %29, label %38, label %30

; <label>:30:                                     ; preds = %23
  %31 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %28, i64 0, i32 1
  %32 = load i32, i32* %31, align 4
  %33 = icmp eq i32 %32, %27
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %30
  %35 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %28, i64 0, i32 2
  %36 = load i32, i32* %35, align 8
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %50, label %38

; <label>:38:                                     ; preds = %34, %30, %23
  %39 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc(i32 %27, i32 -1) #9
  %40 = load %struct.tupleDesc*, %struct.tupleDesc** %20, align 8
  %41 = icmp eq %struct.tupleDesc* %40, null
  br i1 %41, label %47, label %42

; <label>:42:                                     ; preds = %38
  %43 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %40, i64 0, i32 4
  %44 = load i32, i32* %43, align 8
  %45 = icmp sgt i32 %44, -1
  br i1 %45, label %46, label %49

; <label>:46:                                     ; preds = %42
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %40) #9
  br label %49

; <label>:47:                                     ; preds = %38
  %48 = ptrtoint i8** %19 to i64
  tail call void @RegisterExprContextCallback(%struct.ExprContext* %2, void (i64)* nonnull @ShutdownTupleDescRef, i64 %48) #9
  br label %49

; <label>:49:                                     ; preds = %47, %46, %42
  store %struct.tupleDesc* %39, %struct.tupleDesc** %20, align 8
  br label %50

; <label>:50:                                     ; preds = %49, %34
  %51 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %52 = bitcast %struct.FunctionCallInfoData** %51 to i8*
  store i8 0, i8* %52, align 8
  br label %53

; <label>:53:                                     ; preds = %50, %13
  %54 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %55 = bitcast i32* %54 to %struct.tupleDesc**
  %56 = load %struct.tupleDesc*, %struct.tupleDesc** %55, align 8
  %57 = icmp eq %struct.tupleDesc* %56, null
  br i1 %57, label %58, label %74

; <label>:58:                                     ; preds = %53
  %59 = getelementptr inbounds %struct.ConvertRowtypeExpr, %struct.ConvertRowtypeExpr* %7, i64 0, i32 2
  %60 = load i32, i32* %59, align 8
  %61 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc(i32 %60, i32 -1) #9
  %62 = load %struct.tupleDesc*, %struct.tupleDesc** %55, align 8
  %63 = icmp eq %struct.tupleDesc* %62, null
  br i1 %63, label %69, label %64

; <label>:64:                                     ; preds = %58
  %65 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %62, i64 0, i32 4
  %66 = load i32, i32* %65, align 8
  %67 = icmp sgt i32 %66, -1
  br i1 %67, label %68, label %71

; <label>:68:                                     ; preds = %64
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %62) #9
  br label %71

; <label>:69:                                     ; preds = %58
  %70 = ptrtoint i32* %54 to i64
  tail call void @RegisterExprContextCallback(%struct.ExprContext* %2, void (i64)* nonnull @ShutdownTupleDescRef, i64 %70) #9
  br label %71

; <label>:71:                                     ; preds = %69, %68, %64
  store %struct.tupleDesc* %61, %struct.tupleDesc** %55, align 8
  %72 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %73 = bitcast %struct.FunctionCallInfoData** %72 to i8*
  store i8 0, i8* %73, align 8
  br label %83

; <label>:74:                                     ; preds = %53
  %75 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %76 = bitcast %struct.FunctionCallInfoData** %75 to i8*
  %77 = load i8, i8* %76, align 8, !range !2
  %78 = icmp eq i8 %77, 0
  br i1 %78, label %83, label %79

; <label>:79:                                     ; preds = %74
  %80 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %81 = bitcast %struct.FmgrInfo** %80 to %struct.TupleConversionMap**
  %82 = load %struct.TupleConversionMap*, %struct.TupleConversionMap** %81, align 8
  br label %94

; <label>:83:                                     ; preds = %74, %71
  %84 = phi %struct.tupleDesc* [ %61, %71 ], [ %56, %74 ]
  %85 = phi i8* [ %73, %71 ], [ %76, %74 ]
  %86 = load %struct.tupleDesc*, %struct.tupleDesc** %20, align 8
  %87 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 4
  %88 = bitcast %struct.MemoryContextData** %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %89, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %91 = tail call %struct.TupleConversionMap* @convert_tuples_by_name(%struct.tupleDesc* %86, %struct.tupleDesc* %84, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.16, i64 0, i64 0)) #9
  %92 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %93 = bitcast %struct.FmgrInfo** %92 to %struct.TupleConversionMap**
  store %struct.TupleConversionMap* %91, %struct.TupleConversionMap** %93, align 8
  store i8 1, i8* %85, align 8
  store i64 %90, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  br label %94

; <label>:94:                                     ; preds = %83, %79
  %95 = phi %struct.tupleDesc* [ %56, %79 ], [ %84, %83 ]
  %96 = phi %struct.TupleConversionMap* [ %82, %79 ], [ %91, %83 ]
  %97 = bitcast %struct.varlena* %18 to i32*
  %98 = load i32, i32* %97, align 4
  %99 = lshr i32 %98, 2
  %100 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 0
  store i32 %99, i32* %100, align 8
  %101 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %4, i64 0, i32 3
  %102 = bitcast %struct.HeapTupleHeaderData** %101 to %struct.varlena**
  store %struct.varlena* %18, %struct.varlena** %102, align 8
  %103 = icmp eq %struct.TupleConversionMap* %96, null
  br i1 %103, label %110, label %104

; <label>:104:                                    ; preds = %94
  %105 = call %struct.HeapTupleData* @do_convert_tuple(%struct.HeapTupleData* nonnull %4, %struct.TupleConversionMap* nonnull %96) #9
  %106 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %105, i64 0, i32 3
  %107 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %106, align 8
  %108 = call i64 @HeapTupleHeaderGetDatum(%struct.HeapTupleHeaderData* %107) #9
  %109 = load i64*, i64** %14, align 8
  store i64 %108, i64* %109, align 8
  br label %113

; <label>:110:                                    ; preds = %94
  %111 = call i64 @heap_copy_tuple_as_datum(%struct.HeapTupleData* nonnull %4, %struct.tupleDesc* %95) #9
  %112 = load i64*, i64** %14, align 8
  store i64 %111, i64* %112, align 8
  br label %113

; <label>:113:                                    ; preds = %110, %104, %3
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #9
  ret void
}

declare dso_local i32 @exprType(%struct.Node*) local_unnamed_addr #5

declare dso_local %struct.TupleConversionMap* @convert_tuples_by_name(%struct.tupleDesc*, %struct.tupleDesc*, i8*) local_unnamed_addr #5

declare dso_local %struct.HeapTupleData* @do_convert_tuple(%struct.HeapTupleData*, %struct.TupleConversionMap*) local_unnamed_addr #5

declare dso_local i64 @heap_copy_tuple_as_datum(%struct.HeapTupleData*, %struct.tupleDesc*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalScalarArrayOp(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep*) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.anon.32*
  %5 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %6 = bitcast %struct.FmgrInfo** %5 to %struct.FunctionCallInfoData**
  %7 = load %struct.FunctionCallInfoData*, %struct.FunctionCallInfoData** %6, align 8
  %8 = getelementptr inbounds %struct.anon.32, %struct.anon.32* %4, i64 0, i32 1
  %9 = load i8, i8* %8, align 4, !range !2
  %10 = icmp ne i8 %9, 0
  %11 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %12 = bitcast i32* %11 to %struct.FmgrInfo**
  %13 = load %struct.FmgrInfo*, %struct.FmgrInfo** %12, align 8
  %14 = getelementptr inbounds %struct.FmgrInfo, %struct.FmgrInfo* %13, i64 0, i32 3
  %15 = load i8, i8* %14, align 2, !range !2
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = load i8, i8* %18, align 1, !range !2
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %21, label %218

; <label>:21:                                     ; preds = %2
  %22 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %23 = bitcast i64** %22 to %struct.varlena***
  %24 = load %struct.varlena**, %struct.varlena*** %23, align 8
  %25 = load %struct.varlena*, %struct.varlena** %24, align 8
  %26 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %25) #9
  %27 = getelementptr inbounds %struct.varlena, %struct.varlena* %26, i64 1
  %28 = bitcast %struct.varlena* %27 to i32*
  %29 = load i32, i32* %28, align 4
  %30 = getelementptr %struct.varlena, %struct.varlena* %26, i64 0, i32 0, i64 16
  %31 = bitcast i8* %30 to i32*
  %32 = tail call i32 @ArrayGetNItems(i32 %29, i32* %31) #9
  %33 = icmp slt i32 %32, 1
  br i1 %33, label %34, label %39

; <label>:34:                                     ; preds = %21
  %35 = xor i1 %10, true
  %36 = zext i1 %35 to i64
  %37 = load i64*, i64** %22, align 8
  store i64 %36, i64* %37, align 8
  %38 = load i8*, i8** %17, align 8
  store i8 0, i8* %38, align 1
  br label %218

; <label>:39:                                     ; preds = %21
  %40 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 7, i64 0
  %41 = load i8, i8* %40, align 8, !range !2
  %42 = icmp eq i8 %41, 0
  %43 = or i1 %16, %42
  br i1 %43, label %46, label %44

; <label>:44:                                     ; preds = %39
  %45 = load i8*, i8** %17, align 8
  store i8 1, i8* %45, align 1
  br label %218

; <label>:46:                                     ; preds = %39
  %47 = bitcast %union.anon.1* %3 to i32*
  %48 = load i32, i32* %47, align 8
  %49 = getelementptr inbounds %struct.varlena, %struct.varlena* %26, i64 3
  %50 = bitcast %struct.varlena* %49 to i32*
  %51 = load i32, i32* %50, align 4
  %52 = icmp eq i32 %48, %51
  %53 = getelementptr inbounds %struct.anon.32, %struct.anon.32* %4, i64 0, i32 2
  %54 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %55 = bitcast i8** %54 to i8*
  %56 = getelementptr inbounds %struct.anon.32, %struct.anon.32* %4, i64 0, i32 4
  br i1 %52, label %59, label %57

; <label>:57:                                     ; preds = %46
  tail call void @get_typlenbyvalalign(i32 %51, i16* nonnull %53, i8* nonnull %55, i8* nonnull %56) #9
  %58 = load i32, i32* %50, align 4
  store i32 %58, i32* %47, align 8
  br label %59

; <label>:59:                                     ; preds = %57, %46
  %60 = load i16, i16* %53, align 2
  %61 = load i8, i8* %55, align 8, !range !2
  %62 = icmp eq i8 %61, 0
  %63 = load i8, i8* %56, align 1
  %64 = xor i1 %10, true
  %65 = zext i1 %64 to i64
  %66 = getelementptr inbounds %struct.varlena, %struct.varlena* %26, i64 2
  %67 = bitcast %struct.varlena* %66 to i32*
  %68 = load i32, i32* %67, align 4
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %76

; <label>:70:                                     ; preds = %59
  %71 = load i32, i32* %28, align 4
  %72 = sext i32 %71 to i64
  %73 = shl nsw i64 %72, 3
  %74 = add nsw i64 %73, 23
  %75 = and i64 %74, -8
  br label %82

; <label>:76:                                     ; preds = %59
  %77 = sext i32 %68 to i64
  %78 = load i32, i32* %28, align 4
  %79 = sext i32 %78 to i64
  %80 = shl nsw i64 %79, 3
  %81 = getelementptr i8, i8* %30, i64 %80
  br label %82

; <label>:82:                                     ; preds = %76, %70
  %83 = phi i64 [ %77, %76 ], [ %75, %70 ]
  %84 = phi i8* [ %81, %76 ], [ null, %70 ]
  %85 = getelementptr %struct.varlena, %struct.varlena* %26, i64 0, i32 0, i64 %83
  %86 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 7, i64 1
  %87 = getelementptr inbounds %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 4
  %88 = getelementptr %struct.FunctionCallInfoData, %struct.FunctionCallInfoData* %7, i64 0, i32 6, i64 1
  %89 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %90 = bitcast %struct.FunctionCallInfoData** %89 to i64 (%struct.FunctionCallInfoData*)**
  %91 = icmp sgt i16 %60, 0
  %92 = sext i16 %60 to i64
  %93 = icmp eq i16 %60, -1
  %94 = icmp eq i8 %63, 100
  br label %95

; <label>:95:                                     ; preds = %205, %82
  %96 = phi i32 [ 1, %82 ], [ %209, %205 ]
  %97 = phi i8* [ %84, %82 ], [ %208, %205 ]
  %98 = phi i8* [ %85, %82 ], [ %207, %205 ]
  %99 = phi i8 [ 0, %82 ], [ %206, %205 ]
  %100 = phi i32 [ 0, %82 ], [ %210, %205 ]
  %101 = icmp ne i8* %97, null
  br i1 %101, label %102, label %107

; <label>:102:                                    ; preds = %95
  %103 = load i8, i8* %97, align 1
  %104 = zext i8 %103 to i32
  %105 = and i32 %96, %104
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %183, label %107

; <label>:107:                                    ; preds = %102, %95
  br i1 %62, label %123, label %108

; <label>:108:                                    ; preds = %107
  switch i16 %60, label %120 [
    i16 8, label %109
    i16 4, label %112
    i16 2, label %116
  ]

; <label>:109:                                    ; preds = %108
  %110 = bitcast i8* %98 to i64*
  %111 = load i64, i64* %110, align 8
  br label %127

; <label>:112:                                    ; preds = %108
  %113 = bitcast i8* %98 to i32*
  %114 = load i32, i32* %113, align 4
  %115 = sext i32 %114 to i64
  br label %127

; <label>:116:                                    ; preds = %108
  %117 = bitcast i8* %98 to i16*
  %118 = load i16, i16* %117, align 2
  %119 = sext i16 %118 to i64
  br label %127

; <label>:120:                                    ; preds = %108
  %121 = load i8, i8* %98, align 1
  %122 = sext i8 %121 to i64
  br label %125

; <label>:123:                                    ; preds = %107
  %124 = ptrtoint i8* %98 to i64
  br label %125

; <label>:125:                                    ; preds = %123, %120
  %126 = phi i64 [ %124, %123 ], [ %122, %120 ]
  br i1 %91, label %127, label %130

; <label>:127:                                    ; preds = %125, %116, %112, %109
  %128 = phi i64 [ %126, %125 ], [ %119, %116 ], [ %115, %112 ], [ %111, %109 ]
  %129 = getelementptr i8, i8* %98, i64 %92
  br label %164

; <label>:130:                                    ; preds = %125
  br i1 %93, label %131, label %160

; <label>:131:                                    ; preds = %130
  %132 = load i8, i8* %98, align 1
  %133 = zext i8 %132 to i32
  %134 = icmp eq i8 %132, 1
  br i1 %134, label %135, label %145

; <label>:135:                                    ; preds = %131
  %136 = getelementptr inbounds i8, i8* %98, i64 1
  %137 = load i8, i8* %136, align 1
  %138 = icmp eq i8 %137, 1
  %139 = and i8 %137, -2
  %140 = icmp eq i8 %139, 2
  %141 = or i1 %138, %140
  %142 = icmp eq i8 %137, 18
  %143 = select i1 %142, i64 18, i64 3
  %144 = select i1 %141, i64 10, i64 %143
  br label %157

; <label>:145:                                    ; preds = %131
  %146 = and i32 %133, 1
  %147 = icmp eq i32 %146, 0
  br i1 %147, label %150, label %148

; <label>:148:                                    ; preds = %145
  %149 = lshr i32 %133, 1
  br label %154

; <label>:150:                                    ; preds = %145
  %151 = bitcast i8* %98 to i32*
  %152 = load i32, i32* %151, align 4
  %153 = lshr i32 %152, 2
  br label %154

; <label>:154:                                    ; preds = %150, %148
  %155 = phi i32 [ %149, %148 ], [ %153, %150 ]
  %156 = zext i32 %155 to i64
  br label %157

; <label>:157:                                    ; preds = %154, %135
  %158 = phi i64 [ %144, %135 ], [ %156, %154 ]
  %159 = getelementptr i8, i8* %98, i64 %158
  br label %164

; <label>:160:                                    ; preds = %130
  %161 = tail call i64 @strlen(i8* %98) #10
  %162 = add i64 %161, 1
  %163 = getelementptr i8, i8* %98, i64 %162
  br label %164

; <label>:164:                                    ; preds = %160, %157, %127
  %165 = phi i64 [ %128, %127 ], [ %126, %157 ], [ %126, %160 ]
  %166 = phi i8* [ %129, %127 ], [ %159, %157 ], [ %163, %160 ]
  switch i8 %63, label %173 [
    i8 105, label %167
    i8 99, label %171
  ]

; <label>:167:                                    ; preds = %164
  %168 = ptrtoint i8* %166 to i64
  %169 = add i64 %168, 3
  %170 = and i64 %169, -4
  br label %180

; <label>:171:                                    ; preds = %164
  %172 = ptrtoint i8* %166 to i64
  br label %180

; <label>:173:                                    ; preds = %164
  %174 = ptrtoint i8* %166 to i64
  %175 = add i64 %174, 7
  %176 = and i64 %175, -8
  %177 = add i64 %174, 1
  %178 = and i64 %177, -2
  %179 = select i1 %94, i64 %176, i64 %178
  br label %180

; <label>:180:                                    ; preds = %173, %171, %167
  %181 = phi i64 [ %170, %167 ], [ %172, %171 ], [ %179, %173 ]
  %182 = inttoptr i64 %181 to i8*
  store i64 %165, i64* %88, align 8
  store i8 0, i8* %86, align 1
  br label %185

; <label>:183:                                    ; preds = %102
  store i64 0, i64* %88, align 8
  store i8 1, i8* %86, align 1
  br i1 %16, label %185, label %184

; <label>:184:                                    ; preds = %183
  store i8 1, i8* %87, align 4
  br label %197

; <label>:185:                                    ; preds = %183, %180
  %186 = phi i8* [ %182, %180 ], [ %98, %183 ]
  store i8 0, i8* %87, align 4
  %187 = load i64 (%struct.FunctionCallInfoData*)*, i64 (%struct.FunctionCallInfoData*)** %90, align 8
  %188 = tail call i64 %187(%struct.FunctionCallInfoData* nonnull %7) #9
  %189 = load i8, i8* %87, align 4
  %190 = icmp eq i8 %189, 0
  br i1 %190, label %191, label %195

; <label>:191:                                    ; preds = %185
  %192 = icmp ne i64 %188, 0
  br i1 %10, label %193, label %194

; <label>:193:                                    ; preds = %191
  br i1 %192, label %212, label %195

; <label>:194:                                    ; preds = %191
  br i1 %192, label %195, label %212

; <label>:195:                                    ; preds = %194, %193, %185
  %196 = phi i8 [ %99, %193 ], [ %99, %194 ], [ 1, %185 ]
  br i1 %101, label %197, label %205

; <label>:197:                                    ; preds = %195, %184
  %198 = phi i8 [ 1, %184 ], [ %196, %195 ]
  %199 = phi i8* [ %98, %184 ], [ %186, %195 ]
  %200 = shl i32 %96, 1
  %201 = icmp eq i32 %200, 256
  %202 = getelementptr i8, i8* %97, i64 1
  %203 = select i1 %201, i8* %202, i8* %97
  %204 = select i1 %201, i32 1, i32 %200
  br label %205

; <label>:205:                                    ; preds = %197, %195
  %206 = phi i8 [ %198, %197 ], [ %196, %195 ]
  %207 = phi i8* [ %199, %197 ], [ %186, %195 ]
  %208 = phi i8* [ %203, %197 ], [ null, %195 ]
  %209 = phi i32 [ %204, %197 ], [ %96, %195 ]
  %210 = add nuw nsw i32 %100, 1
  %211 = icmp slt i32 %210, %32
  br i1 %211, label %95, label %212

; <label>:212:                                    ; preds = %205, %194, %193
  %213 = phi i8 [ %206, %205 ], [ 0, %194 ], [ 0, %193 ]
  %214 = phi i64 [ %65, %205 ], [ 0, %194 ], [ 1, %193 ]
  %215 = load i64*, i64** %22, align 8
  store i64 %214, i64* %215, align 8
  %216 = and i8 %213, 1
  %217 = load i8*, i8** %17, align 8
  store i8 %216, i8* %217, align 1
  br label %218

; <label>:218:                                    ; preds = %212, %44, %34, %2
  ret void
}

declare dso_local void @get_typlenbyvalalign(i32, i16*, i8*, i8*) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind readonly
declare dso_local i64 @strlen(i8* nocapture) local_unnamed_addr #8

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalConstraintNotNull(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %4 = load i8*, i8** %3, align 8
  %5 = load i8, i8* %4, align 1, !range !2
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %17, label %7

; <label>:7:                                      ; preds = %2
  %8 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3497, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__func__.ExecEvalConstraintNotNull, i64 0, i64 0), i8* null) #9
  %9 = tail call i32 @errcode(i32 33575106) #9
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %11 = bitcast %struct.FmgrInfo** %10 to i32*
  %12 = load i32, i32* %11, align 8
  %13 = tail call i8* @format_type_be(i32 %12) #9
  %14 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.17, i64 0, i64 0), i8* %13) #9
  %15 = load i32, i32* %11, align 8
  %16 = tail call i32 @errdatatype(i32 %15) #9
  tail call void (i32, ...) @errfinish(i32 %9, i32 %14, i32 %16) #9
  unreachable

; <label>:17:                                     ; preds = %2
  ret void
}

declare dso_local i32 @errdatatype(i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalConstraintCheck(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %5 = bitcast i32* %4 to i8**
  %6 = load i8*, i8** %5, align 8
  %7 = load i8, i8* %6, align 1, !range !2
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %28

; <label>:9:                                      ; preds = %2
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %11 = bitcast i8** %10 to i64**
  %12 = load i64*, i64** %11, align 8
  %13 = load i64, i64* %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %9
  %16 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3514, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__func__.ExecEvalConstraintCheck, i64 0, i64 0), i8* null) #9
  %17 = tail call i32 @errcode(i32 67391682) #9
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %19 = bitcast %struct.FmgrInfo** %18 to i32*
  %20 = load i32, i32* %19, align 8
  %21 = tail call i8* @format_type_be(i32 %20) #9
  %22 = bitcast %union.anon.1* %3 to i8**
  %23 = load i8*, i8** %22, align 8
  %24 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.18, i64 0, i64 0), i8* %21, i8* %23) #9
  %25 = load i32, i32* %19, align 8
  %26 = load i8*, i8** %22, align 8
  %27 = tail call i32 @errdomainconstraint(i32 %25, i8* %26) #9
  tail call void (i32, ...) @errfinish(i32 %17, i32 %24, i32 %27) #9
  unreachable

; <label>:28:                                     ; preds = %9, %2
  ret void
}

declare dso_local i32 @errdomainconstraint(i32, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalXmlExpr(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* readonly) local_unnamed_addr #0 {
  %3 = alloca %struct.StringInfoData, align 8
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %5 = bitcast %union.anon.1* %4 to %struct.XmlExpr**
  %6 = load %struct.XmlExpr*, %struct.XmlExpr** %5, align 8
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8
  store i8 1, i8* %8, align 1
  %9 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %10 = load i64*, i64** %9, align 8
  store i64 0, i64* %10, align 8
  %11 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 1
  %12 = load i32, i32* %11, align 4
  switch i32 %12, label %256 [
    i32 0, label %13
    i32 2, label %52
    i32 1, label %124
    i32 3, label %141
    i32 4, label %167
    i32 5, label %192
    i32 6, label %222
    i32 7, label %240
  ]

; <label>:13:                                     ; preds = %2
  %14 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %15 = bitcast %struct.FmgrInfo** %14 to i64**
  %16 = load i64*, i64** %15, align 8
  %17 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %18 = bitcast %struct.FunctionCallInfoData** %17 to i8**
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 5
  br label %21

; <label>:21:                                     ; preds = %42, %13
  %22 = phi i64 [ %44, %42 ], [ 0, %13 ]
  %23 = phi %struct.List* [ %43, %42 ], [ null, %13 ]
  %24 = load %struct.List*, %struct.List** %20, align 8
  %25 = icmp eq %struct.List* %24, null
  br i1 %25, label %29, label %26

; <label>:26:                                     ; preds = %21
  %27 = getelementptr inbounds %struct.List, %struct.List* %24, i64 0, i32 1
  %28 = load i32, i32* %27, align 4
  br label %29

; <label>:29:                                     ; preds = %26, %21
  %30 = phi i32 [ %28, %26 ], [ 0, %21 ]
  %31 = sext i32 %30 to i64
  %32 = icmp slt i64 %22, %31
  br i1 %32, label %33, label %45

; <label>:33:                                     ; preds = %29
  %34 = getelementptr i8, i8* %19, i64 %22
  %35 = load i8, i8* %34, align 1, !range !2
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %37, label %42

; <label>:37:                                     ; preds = %33
  %38 = getelementptr i64, i64* %16, i64 %22
  %39 = bitcast i64* %38 to i8**
  %40 = load i8*, i8** %39, align 8
  %41 = tail call %struct.List* @lappend(%struct.List* %23, i8* %40) #9
  br label %42

; <label>:42:                                     ; preds = %37, %33
  %43 = phi %struct.List* [ %23, %33 ], [ %41, %37 ]
  %44 = add nuw nsw i64 %22, 1
  br label %21

; <label>:45:                                     ; preds = %29
  %46 = icmp eq %struct.List* %23, null
  br i1 %46, label %257, label %47

; <label>:47:                                     ; preds = %45
  %48 = tail call %struct.varlena* @xmlconcat(%struct.List* nonnull %23) #9
  %49 = ptrtoint %struct.varlena* %48 to i64
  %50 = load i64*, i64** %9, align 8
  store i64 %49, i64* %50, align 8
  %51 = load i8*, i8** %7, align 8
  store i8 0, i8* %51, align 1
  br label %257

; <label>:52:                                     ; preds = %2
  %53 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %54 = bitcast i8** %53 to i64**
  %55 = load i64*, i64** %54, align 8
  %56 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %57 = bitcast i32* %56 to i8**
  %58 = load i8*, i8** %57, align 8
  %59 = bitcast %struct.StringInfoData* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %59) #9
  call void @initStringInfo(%struct.StringInfoData* nonnull %3) #9
  %60 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 3
  %61 = load %struct.List*, %struct.List** %60, align 8
  %62 = icmp eq %struct.List* %61, null
  br i1 %62, label %67, label %63

; <label>:63:                                     ; preds = %52
  %64 = getelementptr inbounds %struct.List, %struct.List* %61, i64 0, i32 2
  %65 = load %struct.ListCell*, %struct.ListCell** %64, align 8
  %66 = bitcast %struct.ListCell* %65 to %struct.Node**
  br label %67

; <label>:67:                                     ; preds = %63, %52
  %68 = phi %struct.Node** [ %66, %63 ], [ null, %52 ]
  %69 = phi %struct.ListCell* [ %65, %63 ], [ null, %52 ]
  %70 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 4
  %71 = load %struct.List*, %struct.List** %70, align 8
  %72 = icmp eq %struct.List* %71, null
  br i1 %72, label %110, label %73

; <label>:73:                                     ; preds = %67
  %74 = getelementptr inbounds %struct.List, %struct.List* %71, i64 0, i32 2
  %75 = load %struct.ListCell*, %struct.ListCell** %74, align 8
  %76 = icmp ne %struct.ListCell* %69, null
  %77 = icmp ne %struct.ListCell* %75, null
  %78 = and i1 %77, %76
  br i1 %78, label %79, label %110

; <label>:79:                                     ; preds = %100, %73
  %80 = phi i32 [ %101, %100 ], [ 0, %73 ]
  %81 = phi %struct.ListCell* [ %103, %100 ], [ %69, %73 ]
  %82 = phi %struct.Node** [ %104, %100 ], [ %68, %73 ]
  %83 = phi %struct.ListCell* [ %106, %100 ], [ %75, %73 ]
  %84 = phi %struct.ListCell* [ %106, %100 ], [ %75, %73 ]
  %85 = bitcast %struct.ListCell* %84 to %struct.Value**
  %86 = load %struct.Value*, %struct.Value** %85, align 8
  %87 = getelementptr inbounds %struct.Value, %struct.Value* %86, i64 0, i32 1, i32 0
  %88 = load i8*, i8** %87, align 8
  %89 = sext i32 %80 to i64
  %90 = getelementptr i8, i8* %58, i64 %89
  %91 = load i8, i8* %90, align 1, !range !2
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %93, label %100

; <label>:93:                                     ; preds = %79
  %94 = load %struct.Node*, %struct.Node** %82, align 8
  %95 = getelementptr i64, i64* %55, i64 %89
  %96 = load i64, i64* %95, align 8
  %97 = call i32 @exprType(%struct.Node* %94) #9
  %98 = call i8* @map_sql_value_to_xml_value(i64 %96, i32 %97, i1 zeroext true) #9
  call void (%struct.StringInfoData*, i8*, ...) @appendStringInfo(%struct.StringInfoData* nonnull %3, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.19, i64 0, i64 0), i8* %88, i8* %98, i8* %88) #9
  %99 = load i8*, i8** %7, align 8
  store i8 0, i8* %99, align 1
  br label %100

; <label>:100:                                    ; preds = %93, %79
  %101 = add i32 %80, 1
  %102 = getelementptr inbounds %struct.ListCell, %struct.ListCell* %81, i64 0, i32 1
  %103 = load %struct.ListCell*, %struct.ListCell** %102, align 8
  %104 = bitcast %struct.ListCell* %103 to %struct.Node**
  %105 = getelementptr inbounds %struct.ListCell, %struct.ListCell* %83, i64 0, i32 1
  %106 = load %struct.ListCell*, %struct.ListCell** %105, align 8
  %107 = icmp ne %struct.ListCell* %103, null
  %108 = icmp ne %struct.ListCell* %106, null
  %109 = and i1 %108, %107
  br i1 %109, label %79, label %110

; <label>:110:                                    ; preds = %100, %73, %67
  %111 = load i8*, i8** %7, align 8
  %112 = load i8, i8* %111, align 1, !range !2
  %113 = icmp eq i8 %112, 0
  %114 = getelementptr inbounds %struct.StringInfoData, %struct.StringInfoData* %3, i64 0, i32 0
  br i1 %113, label %115, label %122

; <label>:115:                                    ; preds = %110
  %116 = load i8*, i8** %114, align 8
  %117 = getelementptr inbounds %struct.StringInfoData, %struct.StringInfoData* %3, i64 0, i32 1
  %118 = load i32, i32* %117, align 8
  %119 = call %struct.varlena* @cstring_to_text_with_len(i8* %116, i32 %118) #9
  %120 = ptrtoint %struct.varlena* %119 to i64
  %121 = load i64*, i64** %9, align 8
  store i64 %120, i64* %121, align 8
  br label %122

; <label>:122:                                    ; preds = %115, %110
  %123 = load i8*, i8** %114, align 8
  call void @pfree(i8* %123) #9
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %59) #9
  br label %257

; <label>:124:                                    ; preds = %2
  %125 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %126 = bitcast i8** %125 to i64**
  %127 = load i64*, i64** %126, align 8
  %128 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %129 = bitcast i32* %128 to i8**
  %130 = load i8*, i8** %129, align 8
  %131 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %132 = bitcast %struct.FmgrInfo** %131 to i64**
  %133 = load i64*, i64** %132, align 8
  %134 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %135 = bitcast %struct.FunctionCallInfoData** %134 to i8**
  %136 = load i8*, i8** %135, align 8
  %137 = tail call %struct.varlena* @xmlelement(%struct.XmlExpr* %6, i64* %127, i8* %130, i64* %133, i8* %136) #9
  %138 = ptrtoint %struct.varlena* %137 to i64
  %139 = load i64*, i64** %9, align 8
  store i64 %138, i64* %139, align 8
  %140 = load i8*, i8** %7, align 8
  store i8 0, i8* %140, align 1
  br label %257

; <label>:141:                                    ; preds = %2
  %142 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %143 = bitcast %struct.FmgrInfo** %142 to i64**
  %144 = load i64*, i64** %143, align 8
  %145 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %146 = bitcast %struct.FunctionCallInfoData** %145 to i8**
  %147 = load i8*, i8** %146, align 8
  %148 = load i8, i8* %147, align 1, !range !2
  %149 = icmp eq i8 %148, 0
  br i1 %149, label %150, label %257

; <label>:150:                                    ; preds = %141
  %151 = bitcast i64* %144 to %struct.varlena**
  %152 = load %struct.varlena*, %struct.varlena** %151, align 8
  %153 = tail call %struct.varlena* @pg_detoast_datum_packed(%struct.varlena* %152) #9
  %154 = getelementptr i8, i8* %147, i64 1
  %155 = load i8, i8* %154, align 1, !range !2
  %156 = icmp eq i8 %155, 0
  br i1 %156, label %157, label %257

; <label>:157:                                    ; preds = %150
  %158 = getelementptr i64, i64* %144, i64 1
  %159 = load i64, i64* %158, align 8
  %160 = icmp ne i64 %159, 0
  %161 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 6
  %162 = load i32, i32* %161, align 8
  %163 = tail call %struct.varlena* @xmlparse(%struct.varlena* %153, i32 %162, i1 zeroext %160) #9
  %164 = ptrtoint %struct.varlena* %163 to i64
  %165 = load i64*, i64** %9, align 8
  store i64 %164, i64* %165, align 8
  %166 = load i8*, i8** %7, align 8
  store i8 0, i8* %166, align 1
  br label %257

; <label>:167:                                    ; preds = %2
  %168 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 5
  %169 = load %struct.List*, %struct.List** %168, align 8
  %170 = icmp eq %struct.List* %169, null
  br i1 %170, label %183, label %171

; <label>:171:                                    ; preds = %167
  %172 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %173 = bitcast %struct.FunctionCallInfoData** %172 to i8**
  %174 = load i8*, i8** %173, align 8
  %175 = load i8, i8* %174, align 1, !range !2
  %176 = icmp eq i8 %175, 0
  br i1 %176, label %177, label %183

; <label>:177:                                    ; preds = %171
  %178 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %179 = bitcast %struct.FmgrInfo** %178 to %struct.varlena***
  %180 = load %struct.varlena**, %struct.varlena*** %179, align 8
  %181 = load %struct.varlena*, %struct.varlena** %180, align 8
  %182 = tail call %struct.varlena* @pg_detoast_datum_packed(%struct.varlena* %181) #9
  br label %183

; <label>:183:                                    ; preds = %177, %171, %167
  %184 = phi i1 [ false, %177 ], [ true, %171 ], [ false, %167 ]
  %185 = phi %struct.varlena* [ %182, %177 ], [ null, %171 ], [ null, %167 ]
  %186 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 2
  %187 = load i8*, i8** %186, align 8
  %188 = load i8*, i8** %7, align 8
  %189 = tail call %struct.varlena* @xmlpi(i8* %187, %struct.varlena* %185, i1 zeroext %184, i8* %188) #9
  %190 = ptrtoint %struct.varlena* %189 to i64
  %191 = load i64*, i64** %9, align 8
  store i64 %190, i64* %191, align 8
  br label %257

; <label>:192:                                    ; preds = %2
  %193 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %194 = bitcast %struct.FmgrInfo** %193 to i64**
  %195 = load i64*, i64** %194, align 8
  %196 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %197 = bitcast %struct.FunctionCallInfoData** %196 to i8**
  %198 = load i8*, i8** %197, align 8
  %199 = load i8, i8* %198, align 1, !range !2
  %200 = icmp eq i8 %199, 0
  br i1 %200, label %201, label %257

; <label>:201:                                    ; preds = %192
  %202 = bitcast i64* %195 to %struct.varlena**
  %203 = load %struct.varlena*, %struct.varlena** %202, align 8
  %204 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %203) #9
  %205 = getelementptr i8, i8* %198, i64 1
  %206 = load i8, i8* %205, align 1, !range !2
  %207 = icmp eq i8 %206, 0
  br i1 %207, label %208, label %213

; <label>:208:                                    ; preds = %201
  %209 = getelementptr i64, i64* %195, i64 1
  %210 = bitcast i64* %209 to %struct.varlena**
  %211 = load %struct.varlena*, %struct.varlena** %210, align 8
  %212 = tail call %struct.varlena* @pg_detoast_datum_packed(%struct.varlena* %211) #9
  br label %213

; <label>:213:                                    ; preds = %208, %201
  %214 = phi %struct.varlena* [ %212, %208 ], [ null, %201 ]
  %215 = getelementptr i64, i64* %195, i64 2
  %216 = load i64, i64* %215, align 8
  %217 = trunc i64 %216 to i32
  %218 = tail call %struct.varlena* @xmlroot(%struct.varlena* %204, %struct.varlena* %214, i32 %217) #9
  %219 = ptrtoint %struct.varlena* %218 to i64
  %220 = load i64*, i64** %9, align 8
  store i64 %219, i64* %220, align 8
  %221 = load i8*, i8** %7, align 8
  store i8 0, i8* %221, align 1
  br label %257

; <label>:222:                                    ; preds = %2
  %223 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %224 = bitcast %struct.FunctionCallInfoData** %223 to i8**
  %225 = load i8*, i8** %224, align 8
  %226 = load i8, i8* %225, align 1, !range !2
  %227 = icmp eq i8 %226, 0
  br i1 %227, label %228, label %257

; <label>:228:                                    ; preds = %222
  %229 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %230 = bitcast %struct.FmgrInfo** %229 to %struct.varlena***
  %231 = load %struct.varlena**, %struct.varlena*** %230, align 8
  %232 = load %struct.varlena*, %struct.varlena** %231, align 8
  %233 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %232) #9
  %234 = getelementptr inbounds %struct.XmlExpr, %struct.XmlExpr* %6, i64 0, i32 6
  %235 = load i32, i32* %234, align 8
  %236 = tail call %struct.varlena* @xmltotext_with_xmloption(%struct.varlena* %233, i32 %235) #9
  %237 = ptrtoint %struct.varlena* %236 to i64
  %238 = load i64*, i64** %9, align 8
  store i64 %237, i64* %238, align 8
  %239 = load i8*, i8** %7, align 8
  store i8 0, i8* %239, align 1
  br label %257

; <label>:240:                                    ; preds = %2
  %241 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 5
  %242 = bitcast %struct.FunctionCallInfoData** %241 to i8**
  %243 = load i8*, i8** %242, align 8
  %244 = load i8, i8* %243, align 1, !range !2
  %245 = icmp eq i8 %244, 0
  br i1 %245, label %246, label %257

; <label>:246:                                    ; preds = %240
  %247 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %248 = bitcast %struct.FmgrInfo** %247 to %struct.varlena***
  %249 = load %struct.varlena**, %struct.varlena*** %248, align 8
  %250 = load %struct.varlena*, %struct.varlena** %249, align 8
  %251 = tail call %struct.varlena* @pg_detoast_datum(%struct.varlena* %250) #9
  %252 = tail call zeroext i1 @xml_is_document(%struct.varlena* %251) #9
  %253 = zext i1 %252 to i64
  %254 = load i64*, i64** %9, align 8
  store i64 %253, i64* %254, align 8
  %255 = load i8*, i8** %7, align 8
  store i8 0, i8* %255, align 1
  br label %257

; <label>:256:                                    ; preds = %2
  tail call void @elog_start(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3729, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__func__.ExecEvalXmlExpr, i64 0, i64 0)) #9
  tail call void (i32, i8*, ...) @elog_finish(i32 20, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.20, i64 0, i64 0)) #9
  unreachable

; <label>:257:                                    ; preds = %246, %240, %228, %222, %213, %192, %183, %157, %150, %141, %124, %122, %47, %45
  ret void
}

declare dso_local %struct.List* @lappend(%struct.List*, i8*) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmlconcat(%struct.List*) local_unnamed_addr #5

declare dso_local void @initStringInfo(%struct.StringInfoData*) local_unnamed_addr #5

declare dso_local void @appendStringInfo(%struct.StringInfoData*, i8*, ...) local_unnamed_addr #5

declare dso_local i8* @map_sql_value_to_xml_value(i64, i32, i1 zeroext) local_unnamed_addr #5

declare dso_local %struct.varlena* @cstring_to_text_with_len(i8*, i32) local_unnamed_addr #5

declare dso_local void @pfree(i8*) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmlelement(%struct.XmlExpr*, i64*, i8*, i64*, i8*) local_unnamed_addr #5

declare dso_local %struct.varlena* @pg_detoast_datum_packed(%struct.varlena*) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmlparse(%struct.varlena*, i32, i1 zeroext) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmlpi(i8*, %struct.varlena*, i1 zeroext, i8*) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmlroot(%struct.varlena*, %struct.varlena*, i32) local_unnamed_addr #5

declare dso_local %struct.varlena* @xmltotext_with_xmloption(%struct.varlena*, i32) local_unnamed_addr #5

declare dso_local zeroext i1 @xml_is_document(%struct.varlena*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalGroupingFunc(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %4 = bitcast %union.anon.1* %3 to %struct.AggState**
  %5 = load %struct.AggState*, %struct.AggState** %4, align 8
  %6 = getelementptr inbounds %struct.AggState, %struct.AggState* %5, i64 0, i32 21
  %7 = load %struct.Bitmapset*, %struct.Bitmapset** %6, align 8
  %8 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %9 = bitcast i8** %8 to %struct.List**
  %10 = load %struct.List*, %struct.List** %9, align 8
  %11 = icmp eq %struct.List* %10, null
  br i1 %11, label %32, label %12

; <label>:12:                                     ; preds = %2
  %13 = getelementptr inbounds %struct.List, %struct.List* %10, i64 0, i32 2
  %14 = load %struct.ListCell*, %struct.ListCell** %13, align 8
  %15 = icmp eq %struct.ListCell* %14, null
  br i1 %15, label %32, label %16

; <label>:16:                                     ; preds = %16, %12
  %17 = phi i32 [ %26, %16 ], [ 0, %12 ]
  %18 = phi %struct.ListCell* [ %28, %16 ], [ %14, %12 ]
  %19 = phi %struct.ListCell* [ %28, %16 ], [ %14, %12 ]
  %20 = bitcast %struct.ListCell* %19 to i32*
  %21 = load i32, i32* %20, align 8
  %22 = shl i32 %17, 1
  %23 = tail call zeroext i1 @bms_is_member(i32 %21, %struct.Bitmapset* %7) #9
  %24 = xor i1 %23, true
  %25 = zext i1 %24 to i32
  %26 = or i32 %22, %25
  %27 = getelementptr inbounds %struct.ListCell, %struct.ListCell* %18, i64 0, i32 1
  %28 = load %struct.ListCell*, %struct.ListCell** %27, align 8
  %29 = icmp eq %struct.ListCell* %28, null
  br i1 %29, label %30, label %16

; <label>:30:                                     ; preds = %16
  %31 = sext i32 %26 to i64
  br label %32

; <label>:32:                                     ; preds = %30, %12, %2
  %33 = phi i64 [ 0, %12 ], [ %31, %30 ], [ 0, %2 ]
  %34 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %35 = load i64*, i64** %34, align 8
  store i64 %33, i64* %35, align 8
  %36 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %37 = load i8*, i8** %36, align 8
  store i8 0, i8* %37, align 1
  ret void
}

declare dso_local zeroext i1 @bms_is_member(i32, %struct.Bitmapset*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalSubPlan(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %5 = bitcast %union.anon.1* %4 to %struct.SubPlanState**
  %6 = load %struct.SubPlanState*, %struct.SubPlanState** %5, align 8
  tail call void @check_stack_depth() #9
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8
  %9 = tail call i64 @ExecSubPlan(%struct.SubPlanState* %6, %struct.ExprContext* %2, i8* %8) #9
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %11 = load i64*, i64** %10, align 8
  store i64 %9, i64* %11, align 8
  ret void
}

declare dso_local void @check_stack_depth() local_unnamed_addr #5

declare dso_local i64 @ExecSubPlan(%struct.SubPlanState*, %struct.ExprContext*, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalAlternativeSubPlan(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext*) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %5 = bitcast %union.anon.1* %4 to %struct.AlternativeSubPlanState**
  %6 = load %struct.AlternativeSubPlanState*, %struct.AlternativeSubPlanState** %5, align 8
  tail call void @check_stack_depth() #9
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8
  %9 = tail call i64 @ExecAlternativeSubPlan(%struct.AlternativeSubPlanState* %6, %struct.ExprContext* %2, i8* %8) #9
  %10 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %11 = load i64*, i64** %10, align 8
  store i64 %9, i64* %11, align 8
  ret void
}

declare dso_local i64 @ExecAlternativeSubPlan(%struct.AlternativeSubPlanState*, %struct.ExprContext*, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalWholeRowVar(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture, %struct.ExprContext* nocapture readonly) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3
  %5 = bitcast %union.anon.1* %4 to %struct.anon.3*
  %6 = bitcast %union.anon.1* %4 to %struct.Var**
  %7 = load %struct.Var*, %struct.Var** %6, align 8
  %8 = getelementptr inbounds %struct.Var, %struct.Var* %7, i64 0, i32 1
  %9 = load i32, i32* %8, align 4
  switch i32 %9, label %14 [
    i32 65000, label %10
    i32 65001, label %12
  ]

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 2
  br label %16

; <label>:12:                                     ; preds = %3
  %13 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 3
  br label %16

; <label>:14:                                     ; preds = %3
  %15 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 1
  br label %16

; <label>:16:                                     ; preds = %14, %12, %10
  %17 = phi %struct.TupleTableSlot** [ %15, %14 ], [ %13, %12 ], [ %11, %10 ]
  %18 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %17, align 8
  %19 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %20 = bitcast %struct.FmgrInfo** %19 to %struct.JunkFilter**
  %21 = load %struct.JunkFilter*, %struct.JunkFilter** %20, align 8
  %22 = icmp eq %struct.JunkFilter* %21, null
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %16
  %24 = tail call %struct.TupleTableSlot* @ExecFilterJunk(%struct.JunkFilter* nonnull %21, %struct.TupleTableSlot* %18) #9
  br label %25

; <label>:25:                                     ; preds = %23, %16
  %26 = phi %struct.TupleTableSlot* [ %24, %23 ], [ %18, %16 ]
  %27 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %28 = bitcast i8** %27 to i8*
  %29 = load i8, i8* %28, align 8, !range !2
  %30 = icmp eq i8 %29, 0
  %31 = getelementptr inbounds %struct.anon.3, %struct.anon.3* %5, i64 0, i32 2
  br i1 %30, label %145, label %32

; <label>:32:                                     ; preds = %25
  store i8 0, i8* %31, align 1
  %33 = getelementptr inbounds %struct.Var, %struct.Var* %7, i64 0, i32 3
  %34 = load i32, i32* %33, align 4
  %35 = icmp eq i32 %34, 2249
  br i1 %35, label %107, label %36

; <label>:36:                                     ; preds = %32
  %37 = tail call %struct.tupleDesc* @lookup_rowtype_tupdesc_domain(i32 %34, i32 -1, i1 zeroext false) #9
  %38 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 6
  %39 = load %struct.tupleDesc*, %struct.tupleDesc** %38, align 8
  %40 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 0
  %41 = load i32, i32* %40, align 8
  %42 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %39, i64 0, i32 0
  %43 = load i32, i32* %42, align 8
  %44 = icmp eq i32 %41, %43
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %36
  %46 = icmp sgt i32 %41, 0
  br i1 %46, label %55, label %97

; <label>:47:                                     ; preds = %36
  %48 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3886, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalWholeRowVar, i64 0, i64 0), i8* null) #9
  %49 = tail call i32 @errcode(i32 67141764) #9
  %50 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.21, i64 0, i64 0)) #9
  %51 = load i32, i32* %42, align 8
  %52 = sext i32 %51 to i64
  %53 = load i32, i32* %40, align 8
  %54 = tail call i32 (i8*, i8*, i64, ...) @errdetail_plural(i8* getelementptr inbounds ([55 x i8], [55 x i8]* @.str.22, i64 0, i64 0), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.23, i64 0, i64 0), i64 %52, i32 %51, i32 %53) #9
  tail call void (i32, ...) @errfinish(i32 %49, i32 %50, i32 %54) #9
  unreachable

; <label>:55:                                     ; preds = %92, %45
  %56 = phi i32 [ %93, %92 ], [ %41, %45 ]
  %57 = phi i64 [ %94, %92 ], [ 0, %45 ]
  %58 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 6, i64 %57, i32 2
  %59 = load i32, i32* %58, align 4
  %60 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %39, i64 0, i32 6, i64 %57, i32 2
  %61 = load i32, i32* %60, align 4
  %62 = icmp eq i32 %59, %61
  br i1 %62, label %92, label %63

; <label>:63:                                     ; preds = %55
  %64 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 6, i64 %57, i32 16
  %65 = load i8, i8* %64, align 1, !range !2
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %67, label %78

; <label>:67:                                     ; preds = %63
  %68 = trunc i64 %57 to i32
  %69 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 3902, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalWholeRowVar, i64 0, i64 0), i8* null) #9
  %70 = tail call i32 @errcode(i32 67141764) #9
  %71 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.21, i64 0, i64 0)) #9
  %72 = load i32, i32* %60, align 4
  %73 = tail call i8* @format_type_be(i32 %72) #9
  %74 = add i32 %68, 1
  %75 = load i32, i32* %58, align 4
  %76 = tail call i8* @format_type_be(i32 %75) #9
  %77 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.24, i64 0, i64 0), i8* %73, i32 %74, i8* %76) #9
  tail call void (i32, ...) @errfinish(i32 %70, i32 %71, i32 %77) #9
  unreachable

; <label>:78:                                     ; preds = %63
  %79 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 6, i64 %57, i32 4
  %80 = load i16, i16* %79, align 4
  %81 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %39, i64 0, i32 6, i64 %57, i32 4
  %82 = load i16, i16* %81, align 4
  %83 = icmp eq i16 %80, %82
  br i1 %83, label %84, label %90

; <label>:84:                                     ; preds = %78
  %85 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 6, i64 %57, i32 11
  %86 = load i8, i8* %85, align 2
  %87 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %39, i64 0, i32 6, i64 %57, i32 11
  %88 = load i8, i8* %87, align 2
  %89 = icmp eq i8 %86, %88
  br i1 %89, label %92, label %90

; <label>:90:                                     ; preds = %84, %78
  store i8 1, i8* %31, align 1
  %91 = load i32, i32* %40, align 8
  br label %92

; <label>:92:                                     ; preds = %90, %84, %55
  %93 = phi i32 [ %91, %90 ], [ %56, %84 ], [ %56, %55 ]
  %94 = add nuw nsw i64 %57, 1
  %95 = sext i32 %93 to i64
  %96 = icmp slt i64 %94, %95
  br i1 %96, label %55, label %97

; <label>:97:                                     ; preds = %92, %45
  %98 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 4
  %99 = bitcast %struct.MemoryContextData** %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %100, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %102 = tail call %struct.tupleDesc* @CreateTupleDescCopy(%struct.tupleDesc* nonnull %37) #9
  store i64 %101, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %103 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %37, i64 0, i32 4
  %104 = load i32, i32* %103, align 8
  %105 = icmp sgt i32 %104, -1
  br i1 %105, label %106, label %115

; <label>:106:                                    ; preds = %97
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %37) #9
  br label %115

; <label>:107:                                    ; preds = %32
  %108 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 4
  %109 = bitcast %struct.MemoryContextData** %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %110, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %112 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 6
  %113 = load %struct.tupleDesc*, %struct.tupleDesc** %112, align 8
  %114 = tail call %struct.tupleDesc* @CreateTupleDescCopy(%struct.tupleDesc* %113) #9
  store i64 %111, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  br label %115

; <label>:115:                                    ; preds = %107, %106, %97
  %116 = phi %struct.tupleDesc* [ %114, %107 ], [ %102, %106 ], [ %102, %97 ]
  %117 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %2, i64 0, i32 14
  %118 = load %struct.EState*, %struct.EState** %117, align 8
  %119 = icmp eq %struct.EState* %118, null
  br i1 %119, label %141, label %120

; <label>:120:                                    ; preds = %115
  %121 = load i32, i32* %8, align 4
  %122 = getelementptr inbounds %struct.EState, %struct.EState* %118, i64 0, i32 4
  %123 = load %struct.List*, %struct.List** %122, align 8
  %124 = icmp eq %struct.List* %123, null
  br i1 %124, label %128, label %125

; <label>:125:                                    ; preds = %120
  %126 = getelementptr inbounds %struct.List, %struct.List* %123, i64 0, i32 1
  %127 = load i32, i32* %126, align 4
  br label %128

; <label>:128:                                    ; preds = %125, %120
  %129 = phi i32 [ %127, %125 ], [ 0, %120 ]
  %130 = icmp ugt i32 %121, %129
  br i1 %130, label %141, label %131

; <label>:131:                                    ; preds = %128
  %132 = add i32 %121, -1
  %133 = tail call i8* @list_nth(%struct.List* %123, i32 %132) #9
  %134 = getelementptr inbounds i8, i8* %133, i64 144
  %135 = bitcast i8* %134 to %struct.Alias**
  %136 = load %struct.Alias*, %struct.Alias** %135, align 8
  %137 = icmp eq %struct.Alias* %136, null
  br i1 %137, label %141, label %138

; <label>:138:                                    ; preds = %131
  %139 = getelementptr inbounds %struct.Alias, %struct.Alias* %136, i64 0, i32 2
  %140 = load %struct.List*, %struct.List** %139, align 8
  tail call void @ExecTypeSetColNames(%struct.tupleDesc* %116, %struct.List* %140) #9
  br label %141

; <label>:141:                                    ; preds = %138, %131, %128, %115
  %142 = tail call %struct.tupleDesc* @BlessTupleDesc(%struct.tupleDesc* %116) #9
  %143 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %144 = bitcast i32* %143 to %struct.tupleDesc**
  store %struct.tupleDesc* %142, %struct.tupleDesc** %144, align 8
  store i8 0, i8* %28, align 8
  br label %145

; <label>:145:                                    ; preds = %141, %25
  tail call void @slot_getallattrs(%struct.TupleTableSlot* %26) #9
  %146 = load i8, i8* %31, align 1, !range !2
  %147 = icmp eq i8 %146, 0
  %148 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 6
  %149 = load %struct.tupleDesc*, %struct.tupleDesc** %148, align 8
  %150 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 2
  %151 = bitcast i32* %150 to %struct.tupleDesc**
  br i1 %147, label %192, label %152

; <label>:152:                                    ; preds = %145
  %153 = load %struct.tupleDesc*, %struct.tupleDesc** %151, align 8
  %154 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %153, i64 0, i32 0
  %155 = load i32, i32* %154, align 8
  %156 = icmp sgt i32 %155, 0
  br i1 %156, label %157, label %192

; <label>:157:                                    ; preds = %152
  %158 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 11
  %159 = sext i32 %155 to i64
  br label %160

; <label>:160:                                    ; preds = %189, %157
  %161 = phi i64 [ 0, %157 ], [ %190, %189 ]
  %162 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %153, i64 0, i32 6, i64 %161, i32 16
  %163 = load i8, i8* %162, align 1, !range !2
  %164 = icmp eq i8 %163, 0
  br i1 %164, label %189, label %165

; <label>:165:                                    ; preds = %160
  %166 = load i8*, i8** %158, align 8
  %167 = getelementptr i8, i8* %166, i64 %161
  %168 = load i8, i8* %167, align 1, !range !2
  %169 = icmp eq i8 %168, 0
  br i1 %169, label %170, label %189

; <label>:170:                                    ; preds = %165
  %171 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %153, i64 0, i32 6, i64 %161, i32 4
  %172 = load i16, i16* %171, align 4
  %173 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %149, i64 0, i32 6, i64 %161, i32 4
  %174 = load i16, i16* %173, align 4
  %175 = icmp eq i16 %172, %174
  br i1 %175, label %176, label %182

; <label>:176:                                    ; preds = %170
  %177 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %153, i64 0, i32 6, i64 %161, i32 11
  %178 = load i8, i8* %177, align 2
  %179 = getelementptr %struct.tupleDesc, %struct.tupleDesc* %149, i64 0, i32 6, i64 %161, i32 11
  %180 = load i8, i8* %179, align 2
  %181 = icmp eq i8 %178, %180
  br i1 %181, label %189, label %182

; <label>:182:                                    ; preds = %176, %170
  %183 = trunc i64 %161 to i32
  %184 = tail call zeroext i1 @errstart(i32 20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i32 4002, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__func__.ExecEvalWholeRowVar, i64 0, i64 0), i8* null) #9
  %185 = tail call i32 @errcode(i32 67141764) #9
  %186 = tail call i32 (i8*, ...) @errmsg(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.21, i64 0, i64 0)) #9
  %187 = add i32 %183, 1
  %188 = tail call i32 (i8*, ...) @errdetail(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.25, i64 0, i64 0), i32 %187) #9
  tail call void (i32, ...) @errfinish(i32 %185, i32 %186, i32 %188) #9
  unreachable

; <label>:189:                                    ; preds = %176, %165, %160
  %190 = add nuw nsw i64 %161, 1
  %191 = icmp slt i64 %190, %159
  br i1 %191, label %160, label %192

; <label>:192:                                    ; preds = %189, %152, %145
  %193 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 10
  %194 = load i64*, i64** %193, align 8
  %195 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %26, i64 0, i32 11
  %196 = load i8*, i8** %195, align 8
  %197 = tail call %struct.HeapTupleData* @toast_build_flattened_tuple(%struct.tupleDesc* %149, i64* %194, i8* %196) #9
  %198 = getelementptr inbounds %struct.HeapTupleData, %struct.HeapTupleData* %197, i64 0, i32 3
  %199 = load %struct.HeapTupleHeaderData*, %struct.HeapTupleHeaderData** %198, align 8
  %200 = load %struct.tupleDesc*, %struct.tupleDesc** %151, align 8
  %201 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %200, i64 0, i32 1
  %202 = load i32, i32* %201, align 4
  %203 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %199, i64 0, i32 0, i32 0, i32 2, i32 0
  store i32 %202, i32* %203, align 4
  %204 = load %struct.tupleDesc*, %struct.tupleDesc** %151, align 8
  %205 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %204, i64 0, i32 2
  %206 = load i32, i32* %205, align 8
  %207 = getelementptr inbounds %struct.HeapTupleHeaderData, %struct.HeapTupleHeaderData* %199, i64 0, i32 0, i32 0, i32 1
  store i32 %206, i32* %207, align 4
  %208 = ptrtoint %struct.HeapTupleHeaderData* %199 to i64
  %209 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %210 = load i64*, i64** %209, align 8
  store i64 %208, i64* %210, align 8
  %211 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %212 = load i8*, i8** %211, align 8
  store i8 0, i8* %212, align 1
  ret void
}

declare dso_local %struct.TupleTableSlot* @ExecFilterJunk(%struct.JunkFilter*, %struct.TupleTableSlot*) local_unnamed_addr #5

declare dso_local %struct.tupleDesc* @lookup_rowtype_tupdesc_domain(i32, i32, i1 zeroext) local_unnamed_addr #5

declare dso_local i32 @errdetail_plural(i8*, i8*, i64, ...) local_unnamed_addr #5

declare dso_local %struct.tupleDesc* @CreateTupleDescCopy(%struct.tupleDesc*) local_unnamed_addr #5

declare dso_local void @DecrTupleDescRefCount(%struct.tupleDesc*) local_unnamed_addr #5

declare dso_local i8* @list_nth(%struct.List*, i32) local_unnamed_addr #5

declare dso_local void @ExecTypeSetColNames(%struct.tupleDesc*, %struct.List*) local_unnamed_addr #5

declare dso_local %struct.tupleDesc* @BlessTupleDesc(%struct.tupleDesc*) local_unnamed_addr #5

declare dso_local void @slot_getallattrs(%struct.TupleTableSlot*) local_unnamed_addr #5

declare dso_local %struct.HeapTupleData* @toast_build_flattened_tuple(%struct.tupleDesc*, i64*, i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecAggInitGroup(%struct.AggState* nocapture readonly, %struct.AggStatePerTransData* nocapture readonly, %struct.AggStatePerGroupData* nocapture) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.AggState, %struct.AggState* %0, i64 0, i32 14
  %5 = load %struct.ExprContext*, %struct.ExprContext** %4, align 8
  %6 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %5, i64 0, i32 5
  %7 = bitcast %struct.MemoryContextData** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = load i64, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  store i64 %8, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %10 = getelementptr %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 30, i32 6, i64 1
  %11 = load i64, i64* %10, align 8
  %12 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 25
  %13 = load i8, i8* %12, align 1, !range !2
  %14 = icmp ne i8 %13, 0
  %15 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 23
  %16 = load i16, i16* %15, align 4
  %17 = sext i16 %16 to i32
  %18 = tail call i64 @datumCopy(i64 %11, i1 zeroext %14, i32 %17) #9
  %19 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %2, i64 0, i32 0
  store i64 %18, i64* %19, align 8
  %20 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %2, i64 0, i32 1
  store i8 0, i8* %20, align 8
  %21 = getelementptr inbounds %struct.AggStatePerGroupData, %struct.AggStatePerGroupData* %2, i64 0, i32 2
  store i8 0, i8* %21, align 1
  store i64 %9, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  ret void
}

declare dso_local i64 @datumCopy(i64, i1 zeroext, i32) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local i64 @ExecAggTransReparent(%struct.AggState* nocapture readonly, %struct.AggStatePerTransData* nocapture readonly, i64, i1 zeroext, i64, i1 zeroext) local_unnamed_addr #0 {
  br i1 %3, label %42, label %7

; <label>:7:                                      ; preds = %6
  %8 = getelementptr inbounds %struct.AggState, %struct.AggState* %0, i64 0, i32 14
  %9 = load %struct.ExprContext*, %struct.ExprContext** %8, align 8
  %10 = getelementptr inbounds %struct.ExprContext, %struct.ExprContext* %9, i64 0, i32 5
  %11 = bitcast %struct.MemoryContextData** %10 to i64*
  %12 = load i64, i64* %11, align 8
  store i64 %12, i64* bitcast (%struct.MemoryContextData** @CurrentMemoryContext to i64*), align 8
  %13 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 23
  %14 = load i16, i16* %13, align 4
  %15 = icmp eq i16 %14, -1
  br i1 %15, label %16, label %35

; <label>:16:                                     ; preds = %7
  %17 = inttoptr i64 %2 to %struct.varattrib_1b*
  %18 = getelementptr inbounds %struct.varattrib_1b, %struct.varattrib_1b* %17, i64 0, i32 0
  %19 = load i8, i8* %18, align 1
  %20 = icmp eq i8 %19, 1
  br i1 %20, label %21, label %35

; <label>:21:                                     ; preds = %16
  %22 = inttoptr i64 %2 to %struct.varattrib_1b_e*
  %23 = getelementptr inbounds %struct.varattrib_1b_e, %struct.varattrib_1b_e* %22, i64 0, i32 1
  %24 = load i8, i8* %23, align 1
  %25 = icmp eq i8 %24, 3
  br i1 %25, label %26, label %35

; <label>:26:                                     ; preds = %21
  %27 = tail call %struct.ExpandedObjectHeader* @DatumGetEOHP(i64 %2) #9
  %28 = getelementptr inbounds %struct.ExpandedObjectHeader, %struct.ExpandedObjectHeader* %27, i64 0, i32 2
  %29 = load %struct.MemoryContextData*, %struct.MemoryContextData** %28, align 8
  %30 = tail call %struct.MemoryContextData* @MemoryContextGetParent(%struct.MemoryContextData* %29) #9
  %31 = load %struct.MemoryContextData*, %struct.MemoryContextData** @CurrentMemoryContext, align 8
  %32 = icmp eq %struct.MemoryContextData* %30, %31
  br i1 %32, label %42, label %33

; <label>:33:                                     ; preds = %26
  %34 = load i16, i16* %13, align 4
  br label %35

; <label>:35:                                     ; preds = %33, %21, %16, %7
  %36 = phi i16 [ %34, %33 ], [ %14, %7 ], [ -1, %21 ], [ -1, %16 ]
  %37 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 25
  %38 = load i8, i8* %37, align 1, !range !2
  %39 = icmp ne i8 %38, 0
  %40 = sext i16 %36 to i32
  %41 = tail call i64 @datumCopy(i64 %2, i1 zeroext %39, i32 %40) #9
  br label %42

; <label>:42:                                     ; preds = %35, %26, %6
  %43 = phi i64 [ %2, %6 ], [ %41, %35 ], [ %2, %26 ]
  br i1 %5, label %61, label %44

; <label>:44:                                     ; preds = %42
  %45 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %1, i64 0, i32 23
  %46 = load i16, i16* %45, align 4
  %47 = icmp eq i16 %46, -1
  br i1 %47, label %48, label %59

; <label>:48:                                     ; preds = %44
  %49 = inttoptr i64 %4 to %struct.varattrib_1b*
  %50 = getelementptr inbounds %struct.varattrib_1b, %struct.varattrib_1b* %49, i64 0, i32 0
  %51 = load i8, i8* %50, align 1
  %52 = icmp eq i8 %51, 1
  br i1 %52, label %53, label %59

; <label>:53:                                     ; preds = %48
  %54 = inttoptr i64 %4 to %struct.varattrib_1b_e*
  %55 = getelementptr inbounds %struct.varattrib_1b_e, %struct.varattrib_1b_e* %54, i64 0, i32 1
  %56 = load i8, i8* %55, align 1
  %57 = icmp eq i8 %56, 3
  br i1 %57, label %58, label %59

; <label>:58:                                     ; preds = %53
  tail call void @DeleteExpandedObject(i64 %4) #9
  br label %61

; <label>:59:                                     ; preds = %53, %48, %44
  %60 = inttoptr i64 %4 to i8*
  tail call void @pfree(i8* %60) #9
  br label %61

; <label>:61:                                     ; preds = %59, %58, %42
  ret i64 %43
}

declare dso_local %struct.MemoryContextData* @MemoryContextGetParent(%struct.MemoryContextData*) local_unnamed_addr #5

declare dso_local void @DeleteExpandedObject(i64) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalAggOrderedTransDatum(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readnone) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %5 = bitcast i8** %4 to %struct.AggStatePerTransData**
  %6 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %5, align 8
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %8 = bitcast %struct.FmgrInfo** %7 to i32*
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %6, i64 0, i32 29
  %11 = load %struct.Tuplesortstate**, %struct.Tuplesortstate*** %10, align 8
  %12 = sext i32 %9 to i64
  %13 = getelementptr %struct.Tuplesortstate*, %struct.Tuplesortstate** %11, i64 %12
  %14 = load %struct.Tuplesortstate*, %struct.Tuplesortstate** %13, align 8
  %15 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 1
  %16 = load i64*, i64** %15, align 8
  %17 = load i64, i64* %16, align 8
  %18 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = load i8, i8* %19, align 1, !range !2
  %21 = icmp ne i8 %20, 0
  tail call void @tuplesort_putdatum(%struct.Tuplesortstate* %14, i64 %17, i1 zeroext %21) #9
  ret void
}

declare dso_local void @tuplesort_putdatum(%struct.Tuplesortstate*, i64, i1 zeroext) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define dso_local void @ExecEvalAggOrderedTransTuple(%struct.ExprState* nocapture readnone, %struct.ExprEvalStep* nocapture readonly, %struct.ExprContext* nocapture readnone) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 1
  %5 = bitcast i8** %4 to %struct.AggStatePerTransData**
  %6 = load %struct.AggStatePerTransData*, %struct.AggStatePerTransData** %5, align 8
  %7 = getelementptr inbounds %struct.ExprEvalStep, %struct.ExprEvalStep* %1, i64 0, i32 3, i32 0, i32 4
  %8 = bitcast %struct.FmgrInfo** %7 to i32*
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %6, i64 0, i32 26
  %11 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %12 = tail call %struct.TupleTableSlot* @ExecClearTuple(%struct.TupleTableSlot* %11) #9
  %13 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %6, i64 0, i32 2
  %14 = load i32, i32* %13, align 4
  %15 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %16 = getelementptr inbounds %struct.TupleTableSlot, %struct.TupleTableSlot* %15, i64 0, i32 9
  store i32 %14, i32* %16, align 4
  %17 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  %18 = tail call %struct.TupleTableSlot* @ExecStoreVirtualTuple(%struct.TupleTableSlot* %17) #9
  %19 = getelementptr inbounds %struct.AggStatePerTransData, %struct.AggStatePerTransData* %6, i64 0, i32 29
  %20 = load %struct.Tuplesortstate**, %struct.Tuplesortstate*** %19, align 8
  %21 = sext i32 %9 to i64
  %22 = getelementptr %struct.Tuplesortstate*, %struct.Tuplesortstate** %20, i64 %21
  %23 = load %struct.Tuplesortstate*, %struct.Tuplesortstate** %22, align 8
  %24 = load %struct.TupleTableSlot*, %struct.TupleTableSlot** %10, align 8
  tail call void @tuplesort_puttupleslot(%struct.Tuplesortstate* %23, %struct.TupleTableSlot* %24) #9
  ret void
}

declare dso_local %struct.TupleTableSlot* @ExecClearTuple(%struct.TupleTableSlot*) local_unnamed_addr #5

declare dso_local %struct.TupleTableSlot* @ExecStoreVirtualTuple(%struct.TupleTableSlot*) local_unnamed_addr #5

declare dso_local void @tuplesort_puttupleslot(%struct.Tuplesortstate*, %struct.TupleTableSlot*) local_unnamed_addr #5

declare dso_local void @slot_getsomeattrs(%struct.TupleTableSlot*, i32) local_unnamed_addr #5

declare dso_local i64 @MakeExpandedObjectReadOnlyInternal(i64) local_unnamed_addr #5

declare dso_local i64 @slot_getattr(%struct.TupleTableSlot*, i32, i8*) local_unnamed_addr #5

declare dso_local void @pg_qsort(i8*, i64, i64, i32 (i8*, i8*)*) local_unnamed_addr #5

declare dso_local zeroext i1 @heap_attisnull(%struct.HeapTupleData*, i32, %struct.tupleDesc*) local_unnamed_addr #5

declare dso_local %struct.tupleDesc* @expanded_record_fetch_tupdesc(%struct.ExpandedRecordHeader*) local_unnamed_addr #5

declare dso_local i64 @expanded_record_fetch_field(%struct.ExpandedRecordHeader*, i32, i8*) local_unnamed_addr #5

declare dso_local %struct.tupleDesc* @lookup_rowtype_tupdesc(i32, i32) local_unnamed_addr #5

declare dso_local void @RegisterExprContextCallback(%struct.ExprContext*, void (i64)*, i64) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define internal void @ShutdownTupleDescRef(i64) #0 {
  %2 = inttoptr i64 %0 to %struct.tupleDesc**
  %3 = load %struct.tupleDesc*, %struct.tupleDesc** %2, align 8
  %4 = icmp eq %struct.tupleDesc* %3, null
  br i1 %4, label %10, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.tupleDesc, %struct.tupleDesc* %3, i64 0, i32 4
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, -1
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %5
  tail call void @DecrTupleDescRefCount(%struct.tupleDesc* nonnull %3) #9
  br label %10

; <label>:10:                                     ; preds = %9, %5, %1
  store %struct.tupleDesc* null, %struct.tupleDesc** %2, align 8
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0-3~ubuntu0.18.04.1 (tags/RELEASE_700/final)"}
!2 = !{i8 0, i8 2}
!3 = !{!"branch_weights", i32 1, i32 2000}
!4 = !{!"branch_weights", i32 2000, i32 1}
!5 = !{!"branch_weights", i32 2002, i32 2000}

^0 = module: (path: "execExprInterp.bc", hash: (1860763191, 3269719262, 588985258, 3683531268, 1498031801))
^1 = gv: (name: "check_stack_depth") ; guid = 29912294329705213
^2 = gv: (name: "do_convert_tuple") ; guid = 150266388441032078
^3 = gv: (name: "toast_build_flattened_tuple") ; guid = 185963020900173797
^4 = gv: (name: "expanded_record_fetch_field") ; guid = 188670732216824690
^5 = gv: (name: "array_set_slice") ; guid = 236773791456366301
^6 = gv: (name: "HeapTupleHeaderGetDatum") ; guid = 566294211885768153
^7 = gv: (name: "slot_getattr") ; guid = 593999938617049057
^8 = gv: (name: "ExecEvalStepOp", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 31, funcFlags: (readNone: 0, readOnly: 1, noRecurse: 0, returnDoesNotAlias: 0), refs: (^67)))) ; guid = 595199589574287022
^9 = gv: (name: "llvm.memcpy.p0i8.p0i8.i64") ; guid = 614884070845456474
^10 = gv: (name: "lookup_rowtype_tupdesc_domain") ; guid = 673499410651669001
^11 = gv: (name: "ExecEvalArrayRefSubscript", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 39, calls: ((callee: ^140), (callee: ^155), (callee: ^75), (callee: ^33)), refs: (^47, ^100, ^17)))) ; guid = 781550137825550908
^12 = gv: (name: "heap_deform_tuple") ; guid = 789720372024330232
^13 = gv: (name: "ExecJustInnerVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 10, calls: ((callee: ^7))))) ; guid = 818694912912100865
^14 = gv: (name: "tuplesort_puttupleslot") ; guid = 914565977469595766
^15 = gv: (name: "ExecEvalRowNotNull", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 2, calls: ((callee: ^58))))) ; guid = 925925686671699389
^16 = gv: (name: "__func__.ExecEvalXmlExpr", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 980406372663558745
^17 = gv: (name: ".str.15", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 1036678978549818945
^18 = gv: (name: "xmlconcat") ; guid = 1069024684583240163
^19 = gv: (name: "GetSQLCurrentTime") ; guid = 1158219480144093518
^20 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 1227077851344225470
^21 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 1321038522349822001
^22 = gv: (name: "pg_qsort") ; guid = 1426839403695159976
^23 = gv: (name: "CheckExprStillValid", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 78, calls: ((callee: ^169)), refs: (^67)))) ; guid = 1557165814283314227
^24 = gv: (name: ".str.13", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 1569112009852070456
^25 = gv: (name: "ExecEvalConstraintNotNull", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 17, calls: ((callee: ^140), (callee: ^155), (callee: ^134), (callee: ^75), (callee: ^26), (callee: ^33)), refs: (^160, ^100, ^104)))) ; guid = 1578771039241964753
^26 = gv: (name: "errdatatype") ; guid = 1687213951654642573
^27 = gv: (name: "ExecInterpExprStillValid", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 8, calls: ((callee: ^23))))) ; guid = 1697126531471267348
^28 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 1798030815045230593
^29 = gv: (name: "ExecJustAssignScanVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 23, calls: ((callee: ^7))))) ; guid = 2025573232165026266
^30 = gv: (name: "xmlelement") ; guid = 2211413107576478097
^31 = gv: (name: "__func__.ExecEvalNextValueExpr", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 2225126823590460326
^32 = gv: (name: "ExecEvalNextValueExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 32, calls: ((callee: ^128), (callee: ^103), (callee: ^172)), refs: (^31, ^100, ^21)))) ; guid = 2360524071665760492
^33 = gv: (name: "errfinish") ; guid = 2543638149319448355
^34 = gv: (name: "ExecEvalArrayRefFetch", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 49, calls: ((callee: ^115), (callee: ^46))))) ; guid = 2626106890672995210
^35 = gv: (name: "__func__.CheckVarSlotCompatibility", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 2769726782445602526
^36 = gv: (name: "pg_detoast_datum") ; guid = 2885201110306278781
^37 = gv: (name: "strlen") ; guid = 2965136410638013299
^38 = gv: (name: ".str.6", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 2975371797445235142
^39 = gv: (name: "ExecStoreVirtualTuple") ; guid = 2976789860233226424
^40 = gv: (name: "errdetail") ; guid = 3068978997486191397
^41 = gv: (name: "ExecEvalAggOrderedTransTuple", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 24, calls: ((callee: ^185), (callee: ^39), (callee: ^14))))) ; guid = 3092802800269781482
^42 = gv: (name: "DecrTupleDescRefCount") ; guid = 3213886057075662789
^43 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 3217931689832723694
^44 = gv: (name: "ExecEvalScalarArrayOp", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 230, calls: ((callee: ^36), (callee: ^97), (callee: ^87), (callee: ^37))))) ; guid = 3313012721076226204
^45 = gv: (name: "ExecEvalParamExec", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 24, calls: ((callee: ^117))))) ; guid = 3351022297704273529
^46 = gv: (name: "array_get_slice") ; guid = 3380466000040823392
^47 = gv: (name: "__func__.ExecEvalArrayRefSubscript", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 3618525362836737228
^48 = gv: (name: "heap_getsysattr") ; guid = 3652365203888373684
^49 = gv: (name: "llvm.lifetime.start.p0i8") ; guid = 3657761528566682672
^50 = gv: (name: ".str.9", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 4200413710633402941
^51 = gv: (name: "slot_getsomeattrs") ; guid = 4202170705464720918
^52 = gv: (name: ".str.29", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 4220057404683011011
^53 = gv: (name: "convert_tuples_by_name") ; guid = 4281973245701357084
^54 = gv: (name: "__func__.ExecEvalParamExtern", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 4327034734506021280
^55 = gv: (name: "ExecAggInitGroup", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 24, calls: ((callee: ^193)), refs: (^86)))) ; guid = 4337319590771597149
^56 = gv: (name: "DatumGetEOHP") ; guid = 4362744012275613994
^57 = gv: (name: "exprType") ; guid = 4374181178512967040
^58 = gv: (name: "ExecEvalRowNullInt", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 91, calls: ((callee: ^36), (callee: ^153), (callee: ^42), (callee: ^82), (callee: ^107)), refs: (^131)))) ; guid = 4687637819753451964
^59 = gv: (name: "construct_md_array") ; guid = 4726676914597163300
^60 = gv: (name: "ExecEvalGroupingFunc", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 38, calls: ((callee: ^73))))) ; guid = 4755845295892879815
^61 = gv: (name: "BlessTupleDesc") ; guid = 4996633755577957147
^62 = gv: (name: "dispatch_compare_ptr", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 9, funcFlags: (readNone: 0, readOnly: 1, noRecurse: 1, returnDoesNotAlias: 0)))) ; guid = 5077946782003085067
^63 = gv: (name: "ExecEvalParamExtern", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 64, calls: ((callee: ^140), (callee: ^155), (callee: ^134), (callee: ^75), (callee: ^33)), refs: (^54, ^100, ^43, ^28)))) ; guid = 5269725147700770340
^64 = gv: (name: "CreateTupleDescCopy") ; guid = 5280794239244732133
^65 = gv: (name: ".str.24", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 5343445234740587497
^66 = gv: (name: "ExecEvalSQLValueFunction", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 101, calls: ((callee: ^102), (callee: ^19), (callee: ^111), (callee: ^166), (callee: ^106), (callee: ^69), (callee: ^180), (callee: ^183), (callee: ^78))))) ; guid = 5459892658059884566
^67 = gv: (name: "reverse_dispatch_table", summaries: (variable: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 5584174275029017107
^68 = gv: (name: "__func__.ExecEvalFieldSelect", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 5641271080152667197
^69 = gv: (name: "current_user") ; guid = 5692627622406286936
^70 = gv: (name: "errdomainconstraint") ; guid = 5795493697459165425
^71 = gv: (name: "array_set_element") ; guid = 5803267293736637856
^72 = gv: (name: ".str.23", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 5863520016573306631
^73 = gv: (name: "bms_is_member") ; guid = 6031833604945639907
^74 = gv: (name: "ExecFilterJunk") ; guid = 6109744724201452732
^75 = gv: (name: "errmsg") ; guid = 6142204976369064389
^76 = gv: (name: "xmlpi") ; guid = 6154772222476155679
^77 = gv: (name: "tuplesort_putdatum") ; guid = 6178902939041076465
^78 = gv: (name: "current_schema") ; guid = 6327902226046471939
^79 = gv: (name: "pfree") ; guid = 6344243379698494360
^80 = gv: (name: "llvm.memset.p0i8.i64") ; guid = 6575870351372456124
^81 = gv: (name: ".str.19", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 6692731183534640884
^82 = gv: (name: "RegisterExprContextCallback") ; guid = 6772903126572812649
^83 = gv: (name: ".str.11", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 6982315152735583192
^84 = gv: (name: "ExecEvalMinMax", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 74))) ; guid = 6986312928672103420
^85 = gv: (name: "ExecEvalFuncExprFusage", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 23, calls: ((callee: ^130), (callee: ^138))))) ; guid = 7086813311496425073
^86 = gv: (name: "CurrentMemoryContext") ; guid = 7102954744119000041
^87 = gv: (name: "get_typlenbyvalalign") ; guid = 7131064331766835846
^88 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 7186390800476731332
^89 = gv: (name: "dispatch_table", summaries: (variable: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 7197921760252619429
^90 = gv: (name: "ExecAlternativeSubPlan") ; guid = 7353372437863193899
^91 = gv: (name: "printf") ; guid = 7383291119112528047
^92 = gv: (name: ".str.28", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 7597105624944403752
^93 = gv: (name: "lappend") ; guid = 7771724104416745065
^94 = gv: (name: "ExecEvalConstraintCheck", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 28, calls: ((callee: ^140), (callee: ^155), (callee: ^134), (callee: ^75), (callee: ^70), (callee: ^33)), refs: (^142, ^100, ^163)))) ; guid = 7910029195406104948
^95 = gv: (name: "ExecJustApplyFuncToCase", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 43))) ; guid = 8083413964951761025
^96 = gv: (name: ".str.21", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 8126711387736607620
^97 = gv: (name: "ArrayGetNItems") ; guid = 8167089308961975938
^98 = gv: (name: "getmissingattr") ; guid = 8288809209370468024
^99 = gv: (name: "heap_copy_tuple_as_datum") ; guid = 8537258279318731123
^100 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 8645494544189145468
^101 = gv: (name: "ExecSubPlan") ; guid = 8652808135029417692
^102 = gv: (name: "GetSQLCurrentDate") ; guid = 8895844999363516389
^103 = gv: (name: "elog_start") ; guid = 8968449630819730101
^104 = gv: (name: ".str.17", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 9066028276191390913
^105 = gv: (name: "ExecInterpExpr", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 1830, calls: ((callee: ^51), (callee: ^48), (callee: ^186), (callee: ^132), (callee: ^91), (callee: ^130), (callee: ^138), (callee: ^58), (callee: ^117), (callee: ^63), (callee: ^66), (callee: ^125), (callee: ^128), (callee: ^103), (callee: ^172), (callee: ^177), (callee: ^147), (callee: ^127), (callee: ^129), (callee: ^6), (callee: ^178), (callee: ^133), (callee: ^140), (callee: ^155), (callee: ^75), (callee: ^33), (callee: ^122), (callee: ^164), (callee: ^115), (callee: ^46), (callee: ^114), (callee: ^44), (callee: ^25), (callee: ^94), (callee: ^195), (callee: ^73), (callee: ^1), (callee: ^101), (callee: ^90), (callee: ^193), (callee: ^119), (callee: ^77), (callee: ^185), (callee: ^39), (callee: ^14)), refs: (^136, ^31, ^100, ^21, ^47, ^17, ^86, ^191)))) ; guid = 9239727147609398328
^106 = gv: (name: "GetSQLLocalTimestamp") ; guid = 9242238947075664831
^107 = gv: (name: "heap_attisnull") ; guid = 9320585636985449541
^108 = gv: (name: "ExecEvalAlternativeSubPlan", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 11, calls: ((callee: ^1), (callee: ^90))))) ; guid = 9332328293744212516
^109 = gv: (name: ".str.12", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 9539108489911698846
^110 = gv: (name: "slot_getallattrs") ; guid = 9735251564138909932
^111 = gv: (name: "GetSQLCurrentTimestamp") ; guid = 9784447391990489739
^112 = gv: (name: ".str.20", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 9897988686780299441
^113 = gv: (name: "list_nth") ; guid = 10013200366183418560
^114 = gv: (name: "ExecEvalConvertRowtype", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 129, calls: ((callee: ^36), (callee: ^57), (callee: ^153), (callee: ^42), (callee: ^82), (callee: ^53), (callee: ^2), (callee: ^6), (callee: ^99)), refs: (^131, ^86, ^151)))) ; guid = 10256920179470818231
^115 = gv: (name: "array_get_element") ; guid = 10342544009780007499
^116 = gv: (name: "ExecEvalArrayCoerce", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 36, calls: ((callee: ^147), (callee: ^127))))) ; guid = 10383718866076821300
^117 = gv: (name: "ExecSetParamPlan") ; guid = 10811727224146926650
^118 = gv: (name: "nocachegetattr") ; guid = 10915718248921147200
^119 = gv: (name: "ExecAggTransReparent", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 59, calls: ((callee: ^56), (callee: ^157), (callee: ^193), (callee: ^190), (callee: ^79)), refs: (^86)))) ; guid = 10971945775046784604
^120 = gv: (name: "__func__.ExecEvalFieldStoreDeForm", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11015469332154058358
^121 = gv: (name: "__func__.ExecEvalCurrentOfExpr", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11039449903829075601
^122 = gv: (name: "ExecEvalArrayRefOld", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 60, calls: ((callee: ^115), (callee: ^46))))) ; guid = 11039944699626536340
^123 = gv: (name: "ExecEvalSubPlan", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 11, calls: ((callee: ^1), (callee: ^101))))) ; guid = 11106370218607637427
^124 = gv: (name: ".str.7", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11133050581234529334
^125 = gv: (name: "ExecEvalCurrentOfExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 5, calls: ((callee: ^140), (callee: ^155), (callee: ^75), (callee: ^33)), refs: (^121, ^100, ^88)))) ; guid = 11138569114739303931
^126 = gv: (name: ".str.8", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11502859882294360172
^127 = gv: (name: "array_map") ; guid = 11665246262983221129
^128 = gv: (name: "nextval_internal") ; guid = 11702447313762837519
^129 = gv: (name: "heap_form_tuple") ; guid = 11781292151845480408
^130 = gv: (name: "pgstat_init_function_usage") ; guid = 11791237802749967648
^131 = gv: (name: "ShutdownTupleDescRef", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 12, calls: ((callee: ^42))))) ; guid = 11842588976524664702
^132 = gv: (name: "MakeExpandedObjectReadOnlyInternal") ; guid = 11922486409292019551
^133 = gv: (name: "ExecEvalFieldStoreDeForm", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 93, calls: ((callee: ^153), (callee: ^42), (callee: ^82), (callee: ^103), (callee: ^172), (callee: ^36), (callee: ^12)), refs: (^131, ^120, ^100, ^135)))) ; guid = 11938814657973506909
^134 = gv: (name: "format_type_be") ; guid = 11953541652801609372
^135 = gv: (name: ".str.14", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11953654296657955958
^136 = gv: (name: ".str.26", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 11963736501740290433
^137 = gv: (name: ".str.25", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 12006773930790532207
^138 = gv: (name: "pgstat_end_function_usage") ; guid = 12048840948596743106
^139 = gv: (name: ".str.22", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 12080023119382339457
^140 = gv: (name: "errstart") ; guid = 12151106341968234787
^141 = gv: (name: "expanded_record_fetch_tupdesc") ; guid = 12425523095400696802
^142 = gv: (name: "__func__.ExecEvalConstraintCheck", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 12714683099540890676
^143 = gv: (name: "ExecJustOuterVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 10, calls: ((callee: ^7))))) ; guid = 12829462242923547303
^144 = gv: (name: ".str.27", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 13063220814458830119
^145 = gv: (name: "xmltotext_with_xmloption") ; guid = 13162858200471066958
^146 = gv: (name: "appendStringInfo") ; guid = 13395144706899872666
^147 = gv: (name: "pg_detoast_datum_copy") ; guid = 13441211319954487466
^148 = gv: (name: "pg_detoast_datum_packed") ; guid = 13485118539437183112
^149 = gv: (name: "__func__.ExecEvalArrayExpr", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 13594671224232492235
^150 = gv: (name: "errdetail_plural") ; guid = 13651742592754919254
^151 = gv: (name: ".str.16", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 13706206440368827307
^152 = gv: (name: "memcmp") ; guid = 13767193220660627266
^153 = gv: (name: "lookup_rowtype_tupdesc") ; guid = 14176593223150880713
^154 = gv: (name: "palloc") ; guid = 14199378375966128477
^155 = gv: (name: "errcode") ; guid = 14229004438775178572
^156 = gv: (name: "llvm.lifetime.end.p0i8") ; guid = 14311549039910520616
^157 = gv: (name: "MemoryContextGetParent") ; guid = 14413329432175361993
^158 = gv: (name: "ExecEvalFuncExprStrictFusage", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 42, calls: ((callee: ^130), (callee: ^138))))) ; guid = 14415657135343433965
^159 = gv: (name: "construct_empty_array") ; guid = 14504446210948912261
^160 = gv: (name: "__func__.ExecEvalConstraintNotNull", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 14814172825297723667
^161 = gv: (name: "initStringInfo") ; guid = 14983778222472594859
^162 = gv: (name: "__func__.ExecEvalWholeRowVar", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 15093454617146831553
^163 = gv: (name: ".str.18", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 15267630917644233041
^164 = gv: (name: "ExecEvalArrayRefAssign", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 81, calls: ((callee: ^159), (callee: ^71), (callee: ^5))))) ; guid = 15317419320292053253
^165 = gv: (name: "ExecJustScanVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 10, calls: ((callee: ^7))))) ; guid = 15368927410522933862
^166 = gv: (name: "GetSQLLocalTime") ; guid = 15436606732690374315
^167 = gv: (name: "ExecJustConst", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 12, calls: ((callee: ^91)), refs: (^52)))) ; guid = 15544649149410768762
^168 = gv: (name: "cstring_to_text_with_len") ; guid = 15592040949448016574
^169 = gv: (name: "CheckVarSlotCompatibility", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 43, calls: ((callee: ^103), (callee: ^172), (callee: ^140), (callee: ^155), (callee: ^134), (callee: ^75), (callee: ^33), (callee: ^40)), refs: (^35, ^100, ^83, ^144, ^92, ^24)))) ; guid = 15877896937649804606
^170 = gv: (name: "map_sql_value_to_xml_value") ; guid = 15917124824027726553
^171 = gv: (name: "ExecEvalFieldStoreForm", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 21, calls: ((callee: ^129), (callee: ^6))))) ; guid = 15946043458278749326
^172 = gv: (name: "elog_finish") ; guid = 16038081384192031046
^173 = gv: (name: "xml_is_document") ; guid = 16038451382979168748
^174 = gv: (name: "ExecEvalAggOrderedTransDatum", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 20, calls: ((callee: ^77))))) ; guid = 16074869087671057952
^175 = gv: (name: ".str.10", summaries: (variable: (module: ^0, flags: (linkage: private, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 16207396517400090518
^176 = gv: (name: "ExecJustAssignOuterVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 23, calls: ((callee: ^7))))) ; guid = 16356190242532101001
^177 = gv: (name: "ExecEvalArrayExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 369, calls: ((callee: ^59), (callee: ^154), (callee: ^36), (callee: ^140), (callee: ^155), (callee: ^75), (callee: ^134), (callee: ^40), (callee: ^33), (callee: ^152), (callee: ^97), (callee: ^181), (callee: ^159)), refs: (^149, ^100, ^38, ^124, ^126, ^50)))) ; guid = 16433404050088066143
^178 = gv: (name: "ExecEvalFieldSelect", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 285, calls: ((callee: ^56), (callee: ^141), (callee: ^103), (callee: ^172), (callee: ^140), (callee: ^155), (callee: ^75), (callee: ^134), (callee: ^40), (callee: ^33), (callee: ^4), (callee: ^36), (callee: ^153), (callee: ^42), (callee: ^82), (callee: ^98), (callee: ^118)), refs: (^68, ^100, ^175, ^83, ^109, ^24, ^131)))) ; guid = 16507769735795646785
^179 = gv: (name: "ExecEvalRowNull", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 2, calls: ((callee: ^58))))) ; guid = 16543491718594235363
^180 = gv: (name: "session_user") ; guid = 16572940205904732635
^181 = gv: (name: "array_bitmap_copy") ; guid = 16617144831888360542
^182 = gv: (name: "ExecTypeSetColNames") ; guid = 16689718625957618182
^183 = gv: (name: "current_database") ; guid = 17063619980978414964
^184 = gv: (name: "ExecReadyInterpretedExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 127, calls: ((callee: ^91), (callee: ^22)), refs: (^20, ^89, ^191, ^67, ^62, ^27, ^13, ^143, ^165, ^188, ^176, ^29, ^95, ^167, ^105)))) ; guid = 17064100570552172132
^185 = gv: (name: "ExecClearTuple") ; guid = 17302080574258109244
^186 = gv: (name: "ExecEvalWholeRowVar", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 228, calls: ((callee: ^74), (callee: ^10), (callee: ^140), (callee: ^155), (callee: ^75), (callee: ^150), (callee: ^33), (callee: ^134), (callee: ^40), (callee: ^64), (callee: ^42), (callee: ^113), (callee: ^182), (callee: ^61), (callee: ^110), (callee: ^3)), refs: (^162, ^100, ^96, ^72, ^139, ^65, ^86, ^137)))) ; guid = 17317027667203440596
^187 = gv: (name: "ExecEvalLambdaExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 19, refs: (^86)))) ; guid = 17421985630479737944
^188 = gv: (name: "ExecJustAssignInnerVar", summaries: (function: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 23, calls: ((callee: ^7))))) ; guid = 17620192265613458888
^189 = gv: (name: "xmlparse") ; guid = 17817262558267310926
^190 = gv: (name: "DeleteExpandedObject") ; guid = 17818861783089332820
^191 = gv: (name: "ExecInterpExpr.dispatch_table", summaries: (variable: (module: ^0, flags: (linkage: internal, notEligibleToImport: 0, live: 0, dsoLocal: 1)))) ; guid = 17830761297951254787
^192 = gv: (name: "ExecEvalRow", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 20, calls: ((callee: ^129), (callee: ^6))))) ; guid = 17942597966490975459
^193 = gv: (name: "datumCopy") ; guid = 18031639136226898852
^194 = gv: (name: "xmlroot") ; guid = 18222958778565786569
^195 = gv: (name: "ExecEvalXmlExpr", summaries: (function: (module: ^0, flags: (linkage: external, notEligibleToImport: 0, live: 0, dsoLocal: 1), insts: 280, calls: ((callee: ^93), (callee: ^18), (callee: ^161), (callee: ^57), (callee: ^170), (callee: ^146), (callee: ^168), (callee: ^79), (callee: ^30), (callee: ^148), (callee: ^189), (callee: ^76), (callee: ^36), (callee: ^194), (callee: ^145), (callee: ^173), (callee: ^103), (callee: ^172)), refs: (^81, ^16, ^100, ^112)))) ; guid = 18360458986174696282
