/*-------------------------------------------------------------------------
 *
 * llvmjit_lambda.cpp
 *	  Cross module inlining suitable for postgres' JIT
 *
 * The inliner iterates over external functions referenced from the passed
 * module and attempts to inline those.  It does so by utilizing pre-built
 * indexes over both postgres core code and extension modules.  When a match
 * for an external function is found - not guaranteed! - the index will then
 * be used to judge their instruction count / inline worthiness. After doing
 * so for all external functions, all the referenced functions (and
 * prerequisites) will be imorted.
 *
 * Copyright (c) 2016-2018, PostgreSQL Global Development Group
 *
 * IDENTIFICATION
 *	  src/backend/lib/llvmjit/llvmjit_lambda.cpp
 *
 *-------------------------------------------------------------------------
 */

extern "C"
{
#include "postgres.h"
}

#include "jit/llvmjit.h"
#include "jit/llvmjit_lambda.h"

extern "C"
{
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "common/string.h"
#include "miscadmin.h"
#include "storage/fd.h"
}
