      PROGRAM PROBLEM7
      CALL P7RUN(3)
      CALL P7RUN(5)
      CALL P7RUN(7)
      CALL P7RUN(11)
      CALL P7RUN(17)
      CALL P7RUN(29)
      CALL P7RUN(61)
      END

      SUBROUTINE P7RUN(PRIME)
      INTEGER PRIME
      INTEGER RES(PRIME)
      INTEGER M, QUAR2, I
      INTEGER D
      PRINT *,"PROCESSNG", PRIME
      CALL AIZERO(RES, PRIME)
      M = QUAR2(PRIME, RES)
      D = 0
      CALL AIQSRT(RES, M)
      DO 10 I=1,M-1
      IF (RES(I) + 1 .NE. RES(I+1)) GOTO 10
      D = D + 1
10    CONTINUE
      PRINT *, "CONSECUTIVE", D, "PRIME/4", PRIME/4
      END