include ../../../repara.mk

# C compiler
CC = g++
CC_FLAGS = -g -fopenmp -O2 $(ANALYSIS_FLAGS)

hotspot: 
	$(CC) $(CC_FLAGS) hotspot_openmp.cpp -o hotspot 

clean:
	rm -f hotspot
