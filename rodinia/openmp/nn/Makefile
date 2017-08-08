include ../../../repara.mk

LOCAL_CC = g++ $(ANALYSIS_FLAGS) -g -O3
CC = g++ $(ANALYSIS_FLAGS)
CFLAGS = -lm -fopenmp


all : nn

clean :
	rm -rf *.o nn

nn : nn_openmp.c
	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)

hurricane_gen : hurricane_gen.c
	$(LOCAL_CC) -o $@ $< -lm

