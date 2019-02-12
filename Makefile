FC = f77
COMMON_LIBS = cntdiv.o \
              dividp.o \
              evenp.o \
              ltoi.o

problem1: problem1.o $(COMMON_LIBS)
	${FC} -o problem1.exe problem1.o $(COMMON_LIBS)

clean:
	rm -f *.o *.exe

