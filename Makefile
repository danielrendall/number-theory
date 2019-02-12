FC = f77
COMMON_LIBS = cntdiv.o \
              dividp.o \
              evenp.o \
              ltoi.o \
              primep.o

PROBLEMS = problem1.exe \
           problem2.exe

SPINOFFS = antiprime.exe

default: $(PROBLEMS) $(SPINOFFS)

problem1.exe: problem1.o $(COMMON_LIBS)
	${FC} -o problem1.exe problem1.o $(COMMON_LIBS)

antiprime.exe: antiprime.o $(COMMON_LIBS)
	${FC} -o antiprime.exe antiprime.o $(COMMON_LIBS)

problem2.exe: problem2.o $(COMMON_LIBS)
	${FC} -o problem2.exe problem2.o $(COMMON_LIBS)

scratch.exe: scratch.o $(COMMON_LIBS)
	${FC} -o scratch.exe scratch.o $(COMMON_LIBS)

clean:
	rm -f *.o *.exe

