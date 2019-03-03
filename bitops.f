C ASSUMING THE ARRAY IS A BINARY NUMBER OF THE GIVEN SIZE, RETURN IT 
C AS AN INTEGER     
      INTEGER FUNCTION BVAL(ARRAY, SIZE)
      LOGICAL ARRAY(*)
      INTEGER SIZE, I, D
      BVAL = 0
      D = 1
      DO 10, I=SIZE, 1, -1
      IF (ARRAY(I)) BVAL = BVAL + D
      D = D * 2
10    CONTINUE
      RETURN
      END

C WRITE THE GIVEN VAL TO THE ARRAY OF THE GIVEN SIZE AS A BINARY
C NUMBER. NO CHECK IS MADE THAT SIZE IS SUFFICIENT
      SUBROUTINE ITOBIT(ARRAY, SIZE, VAL)
      LOGICAL ARRAY(*)
      INTEGER SIZE, VAL, D, TEST, IVAL
      IVAL = VAL
      D = 1
      DO 12, I=1, SIZE - 1
      D = D * 2
12    CONTINUE
      DO 19, I=1,SIZE
      TEST = IVAL - D
      IF (TEST) 16, 17, 17
16    ARRAY(I) = .FALSE.
      GOTO 18
17    IVAL = TEST
      ARRAY(I) = .TRUE.
18    D = D / 2
19    CONTINUE
      END
      

C COMPUTE BITWISE AND OF A1 AND A2 PUTTING THE RESULT IN RES. ALL
C ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE AND(A1, A2, RES, SIZE)
      LOGICAL A1(*), A2(*), RES(*)
      INTEGER SIZE
      DO 20, I=1,SIZE
      RES(I) = A1(I) .AND. A2(I)
20    CONTINUE
      END

C COMPUTE BITWISE OR OF A1 AND A2 PUTTING THE RESULT IN RES. ALL
C ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE OR(A1, A2, RES, SIZE)
      LOGICAL A1(*), A2(*), RES(*)
      INTEGER SIZE
      DO 30, I=1,SIZE
      RES(I) = A1(I) .OR. A2(I)
30    CONTINUE
      END

C COMPUTE BITWISE XOR OF A1 AND A2 PUTTING THE RESULT IN RES. ALL
C ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE XOR(A1, A2, RES, SIZE)
      LOGICAL A1(*), A2(*), RES(*)
      INTEGER SIZE
      DO 40, I=1,SIZE
     0RES(I) = (A1(I) .AND. .NOT. A2(I)) 
     1         .OR. (.NOT. A1(I) .AND. A2(I))
40    CONTINUE
      END

C COMPUTE BITWISE NOT OF A1 PUTTING THE RESULT IN RES. ALL
C ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE NOT(A1, RES, SIZE)
      LOGICAL A1(*), RES(*)
      INTEGER SIZE
      DO 50, I=1,SIZE
      RES(I) = .NOT. A1(I)
50    CONTINUE
      END

C SHIFT A1 DIST BITS TO THE LEFT PUTTING THE RESULT IN RES. BITS THAT
C OVERFLOW ARE LOST. ALL ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE BSL(A1, RES, SIZE, DIST)
      LOGICAL A1(*), RES(*)
      INTEGER SIZE, DIST
      DO 60, I=1,SIZE-DIST
      RES(I) = A1(I + DIST)
60    CONTINUE
      DO 65, I=SIZE-DIST+1,SIZE
      RES(I) = .FALSE.
65    CONTINUE
      END

C SHIFT A1 DIST BITS TO THE RIGHT PUTTING THE RESULT IN RES. BITS THAT
C OVERFLOW ARE LOST. ALL ARRAYS ARE ASSUMED TO HAVE THE GIVEN SIZE
      SUBROUTINE BSR(A1, RES, SIZE, DIST)
      LOGICAL A1(*), RES(*)
      INTEGER SIZE, DIST
      DO 70, I=SIZE,1+DIST,-1
      RES(I) = A1(I - DIST)
70    CONTINUE
      DO 75, I=DIST,1,-1
      RES(I) = .FALSE.
75    CONTINUE
      END
