include ../../common/make.config
include ../../../repara.mk

#C compiler
CC = g++

SRC = nearestNeighbor.cpp clutils.cpp utils.cpp

CC_FLAGS = -g -O3 $(ANALYSIS_FLAGS)

EXE = nn

release:
	$(CC) $(CC_FLAGS) -lOpenCL  -fopenmp $(SRC) -o $(EXE) -I$(OPENCL_INC) -L$(OPENCL_LIB)
	
clean: 
	rm -f $(EXE) 
