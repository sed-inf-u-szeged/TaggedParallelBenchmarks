include ../../../repara.mk

# Example
# target: dependencies
	# command 1
	# command 2
          # .
          # .
          # .
	# command n

C_C = g++
OMP_LIB = -lgomp
OMP_FLAG = -fopenmp

# link objects (binaries) together
a.out:		main.o \
			./kernel/kernel_cpu.o \
			./util/num/num.o \
			./util/timer/timer.o
	$(C_C)	main.o \
			./kernel/kernel_cpu.o \
			./util/num/num.o \
			./util/timer/timer.o \
			-lm \
			$(OMP_LIB) \
			-o lavaMD
# compile function files into objects (binaries)
main.o:		main.h \
			main.c \
			./kernel/kernel_cpu.h \
			./kernel/kernel_cpu.c \
			./util/num/num.h \
			./util/num/num.c \
			./util/timer/timer.h \
			./util/timer/timer.c
	$(C_C)	$(ANALYSIS_FLAGS) main.c \
			-c \
			-o main.o \
			-O3

./kernel/kernel_cpu.o:	./kernel/kernel_cpu.h \
						./kernel/kernel_cpu.c
	$(C_C)				$(ANALYSIS_FLAGS) ./kernel/kernel_cpu.c \
						-c \
						-o ./kernel/kernel_cpu.o \
						-O3 \
						$(OMP_FLAG)

./util/num/num.o:	./util/num/num.h \
					./util/num/num.c
	$(C_C)			$(ANALYSIS_FLAGS) ./util/num/num.c \
					-c \
					-o ./util/num/num.o \
					-O3

./util/timer/timer.o:	./util/timer/timer.h \
						./util/timer/timer.c
	$(C_C)				$(ANALYSIS_FLAGS) ./util/timer/timer.c \
						-c \
						-o ./util/timer/timer.o \
						-O3

# delete all object and executable files
clean:
	rm	*.o \
		./kernel/*.o \
		./util/num/*.o \
		./util/timer/*.o \
		lavaMD
