FC = f77
COMMON_LIBS = \
              arrays.o \
              cntdiv.o \
              dividp.o \
              evenp.o \
              ltoi.o \
              populate.o \
              primep.o \
              sumsqs.o \
              testing.f

PROBLEMS = \
           problem1.exe \
           problem2.exe \
           problem3.exe \
           problem4.exe \
           problem5.exe \
           problem6.exe \

SPINOFFS = antiprime.exe

SCRATCHES =

TESTS = test_ictns.exe test_aiddup.exe

default: $(PROBLEMS) $(SPINOFFS) $(SCRATCHES) $(TESTS)

problem1.exe: problem1.o $(COMMON_LIBS)
	${FC} -o problem1.exe problem1.o $(COMMON_LIBS)

problem2.exe: problem2.o $(COMMON_LIBS)
	${FC} -o problem2.exe problem2.o $(COMMON_LIBS)

problem3.exe: problem3.o $(COMMON_LIBS)
	${FC} -o problem3.exe problem3.o $(COMMON_LIBS)

problem4.exe: problem4.o $(COMMON_LIBS)
	${FC} -o problem4.exe problem4.o $(COMMON_LIBS)

problem5.exe: problem5.o $(COMMON_LIBS)
	${FC} -o problem5.exe problem5.o $(COMMON_LIBS)

problem6.exe: problem6.o $(COMMON_LIBS)
	${FC} -o problem6.exe problem6.o $(COMMON_LIBS)

antiprime.exe: antiprime.o $(COMMON_LIBS)
	${FC} -o antiprime.exe antiprime.o $(COMMON_LIBS)

scratch.exe: scratch.o $(COMMON_LIBS)
	${FC} -o scratch.exe scratch.o $(COMMON_LIBS)

test_ictns.exe:test_ictns.o $(COMMON_LIBS)
	${FC} -o test_ictns.exe test_ictns.o $(COMMON_LIBS)

test_aiddup.exe:test_aiddup.o $(COMMON_LIBS)
	${FC} -o test_aiddup.exe test_aiddup.o $(COMMON_LIBS)

clean:
	rm -f *.o *.exe

