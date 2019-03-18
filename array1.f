      PROGRAM ARRAY1
      INTEGER ARRAY(5)
      DO 10 I=1,5
      ARRAY(I) = I * I
10    CONTINUE
      DO 20 I=5,1,-1
      PRINT *,"I=", I, "ARRAY(I)=", ARRAY(I)
20    CONTINUE
      END


