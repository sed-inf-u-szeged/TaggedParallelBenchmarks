include ../../../repara.mk

# C compiler
CC = g++
CC_FLAGS = -g -fopenmp -O2 $(ANALYSIS_FLAGS)

bfs: 
	$(CC) $(CC_FLAGS) bfs.cpp -o bfs 

clean:
	rm -f bfs result.txt
