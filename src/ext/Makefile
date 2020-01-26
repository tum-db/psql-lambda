top_builddir = ../..
include $(top_builddir)/src/Makefile.global

ifneq ($(with_llvm), yes)
    $(error "not building with LLVM support")
endif

CFLAGS += $(LLVM_CFLAGS)
CXXFLAGS += $(LLVM_CXXFLAGS)
override CPPFLAGS := $(LLVM_CPPFLAGS) $(CPPFLAGS)
SHLIB_LINK += $(LLVM_LIBS)

override COMPILER = $(CXX) $(CFLAGS)

all: lambda_ext lambda_ext.bc kmeans_ext kmeans_ext.bc pagerank_ext pagerank_ext.bc

lambda_ext: lambda_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -fPIC -c lambda_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -shared -o lambda_ext.so lambda_ext.o

kmeans_ext: kmeans_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -fPIC -c kmeans_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -shared -o kmeans_ext.so kmeans_ext.o

pagerank_ext: pagerank_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -fPIC -c pagerank_ext.c
	$(CC) $(LLVM_CPPFLAGS) $(CPPFLAGS) -O2 -I../include -shared -o pagerank_ext.so pagerank_ext.o

install-postgres-bitcode: $(OBJS) all
	$(call install_llvm_module,ext,lambda_ext.o)
	$(call install_llvm_module,ext,kmeans_ext.o)
	$(call install_llvm_module,ext,pagerank_ext.o)