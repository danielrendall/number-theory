FC = f77
FFLAGS = -g

CNTDIV = cntdiv.o numprd.o

TEST_LIBS = \
            testing.f

PROBLEMS = \
           problem1.exe \
           problem2.exe \
           problem3.exe \
           problem4.exe \
           problem5.exe \
           problem6.exe \
           problem7.exe \
           problem8.exe

SPINOFFS = \
           antiprime.exe

SCRATCHES =

TESTS = \
        test_ictns.exe \
        test_aiddup.exe \
        test_aiqsrt.exe \
        test_bitops.exe

default: $(PROBLEMS) $(SPINOFFS) $(SCRATCHES) $(TESTS)

problem1.exe: problem1.o $(CNTDIV)
	${FC} ${FFLAGS} -o problem1.exe problem1.o $(CNTDIV)

problem2.exe: problem2.o $(CNTDIV)
	${FC} ${FFLAGS} -o problem2.exe problem2.o $(CNTDIV)

P3TO5LIBS = arrays.o numprd.o populate.o sumsqs.o

problem3.exe: problem3.o $(P3TO5LIBS)
	${FC} ${FFLAGS} -o problem3.exe problem3.o $(P3TO5LIBS)

problem4.exe: problem4.o $(P3TO5LIBS)
	${FC} ${FFLAGS} -o problem4.exe problem4.o $(P3TO5LIBS)

problem5.exe: problem5.o $(P3TO5LIBS)
	${FC} ${FFLAGS} -o problem5.exe problem5.o $(P3TO5LIBS)

P67LIBS = arrays.o arrprd.o numprd.o quares.o

problem6.exe: problem6.o $(P67LIBS)
	${FC} ${FFLAGS} -o problem6.exe problem6.o $(P67LIBS)

problem7.exe: problem7.o $(P67LIBS)
	${FC} ${FFLAGS} -o problem7.exe problem7.o $(P67LIBS)

problem8.exe: problem8.o arrays.o bitops.o numprd.o
	${FC} ${FFLAGS} -o problem8.exe problem8.o arrays.o bitops.o numprd.o

antiprime.exe: antiprime.o $(CNTDIV)
	${FC} ${FFLAGS} -o antiprime.exe antiprime.o $(CNTDIV)

test_ictns.exe:test_ictns.o arrays.o populate.o sumsqs.o ${TEST_LIBS}
	${FC} ${FFLAGS} -o test_ictns.exe test_ictns.o arrays.o populate.o sumsqs.o ${TEST_LIBS}

test_aiddup.exe:test_aiddup.o arrays.o ${TEST_LIBS}
	${FC} ${FFLAGS} -o test_aiddup.exe test_aiddup.o arrays.o ${TEST_LIBS}

test_aiqsrt.exe:test_aiqsrt.o arrays.o arrprd.o bitops.o lfsrs.o ${TEST_LIBS}
	${FC} ${FFLAGS} -o test_aiqsrt.exe test_aiqsrt.o arrays.o arrprd.o bitops.o lfsrs.o ${TEST_LIBS}

test_bitops.exe:test_bitops.o bitops.o ${TEST_LIBS}
	${FC} ${FFLAGS} -o test_bitops.exe test_bitops.o bitops.o ${TEST_LIBS}

clean:
	rm -f *.o *.exe

