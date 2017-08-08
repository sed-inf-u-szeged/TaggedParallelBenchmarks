INCPATHS = -I$(UTIL_DIR)

BENCHMARK = $(shell basename `pwd`)
EXE = $(BENCHMARK)_acc
SRC = $(BENCHMARK).c
HEADERS = $(BENCHMARK).h

SRC += $(UTIL_DIR)/polybench.c

DEPS        := Makefile.dep
DEP_FLAG    := -MM

.PHONY: all exe clean veryclean

all : exe

exe : $(EXE)

$(EXE) : $(SRC)
	$(ACC) $(ACCFLAGS) $(CC) $(CFLAGS) $(INCPATHS) $(ANALYSIS_FLAGS) $^ -o $@

clean :
	-rm -vf __hmpp* -vf $(EXE) *~ 

veryclean : clean
	-rm -vf $(DEPS)

$(DEPS): $(SRC) $(HEADERS)
	$(CC) $(INCPATHS) $(DEP_FLAG) $(ANALYSIS_FLAGS) $(SRC) > $(DEPS)

-include $(DEPS)