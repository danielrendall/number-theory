      PROGRAM ANTIPRIME
      INTEGER I, CNTDIV, FCT, MAXFCT
      MAXFCT = 0
      DO 10 I=1,10000
      FCT = CNTDIV(I)
      IF (MAXFCT .GE. FCT) GOTO 10
      MAXFCT = FCT
      PRINT *, I, FCT
10    CONTINUE
      END

