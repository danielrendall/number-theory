      PROGRAM ARRAY3
      INTEGER SIZE
      SIZE=5
      CALL DOIT(SIZE)
      END

      SUBROUTINE DOIT(SIZE)
      INTEGER SIZE, ARRAY(SIZE)
      DO 10 I=1,SIZE
      ARRAY(I) = I * I
10    CONTINUE
      DO 20 I=SIZE,1,-1
      PRINT *,"I=", I, "ARRAY(I)=", ARRAY(I)
20    CONTINUE
      END


