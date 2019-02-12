FC = f77
COMMON_LIBS = cntdiv.o \
              dividp.o \
              evenp.o \
              ltoi.o

PROBLEMS = problem1.exe

SPINOFFS = antiprime.exe

default: $(PROBLEMS) $(SPINOFFS)

problem1.exe: problem1.o $(COMMON_LIBS)
	${FC} -o problem1.exe problem1.o $(COMMON_LIBS)

antiprime.exe: antiprime.o $(COMMON_LIBS)
	${FC} -o antiprime.exe antiprime.o $(COMMON_LIBS)

clean:
	rm -f *.o *.exe

