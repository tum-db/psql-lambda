/*
 * To avoid breaking cpluspluscheck, allow including the file even when LLVM
 * is not available.
 */
#ifdef USE_LLVM

#ifndef LLVMJIT_LAMBDA_H
#define LLVMJIT_LAMBDA_H

#include <llvm-c/Core.h>
#include "jit/llvmjit.h"


#include <llvm-c/Core.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm-c/BitReader.h>
#include <llvm-c/BitWriter.h>

#include <llvm/ADT/SetVector.h>
#include <llvm/ADT/StringSet.h>
#include <llvm/ADT/StringMap.h>

#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>

#include <llvm/Analysis/ModuleSummaryAnalysis.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/Bitcode/BitcodeWriter.h>


#endif
#endif