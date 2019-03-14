      PROGRAM PROBLEM9
      INTEGER I, RES, WAYS
      DO 10 I=1, 40
      RES = WAYS(I)
      PRINT *, I, RES
10    CONTINUE
      END

C CALCULATE THE NUMBER OF WAYS OF MAKING THE TARGET AS A SUM OF NON-
C NEGATIVE POWERS OF TWO
      INTEGER FUNCTION WAYS(TARGET) 
      INTEGER TARGET
C NPWR = NUMBER OF POWERS OF TWO LESS THAN OR EQUAL TO TARGET, MPWR
C = MAXIMUM POWER OF TWO
      INTEGER NPWR, MPWR
      INTEGER WAYS1
      NPWR = 0
      MPWR = 1
15    IF (MPWR .GT. TARGET) GOTO 17
      MPWR = MPWR * 2
      NPWR = NPWR + 1
      GOTO 15
17    WAYS = WAYS1(TARGET, NPWR)
      END

      INTEGER FUNCTION WAYS1(TARGET, NPWR)
      INTEGER TARGET, NPWR
      INTEGER PWRS(NPWR), COEFFS(NPWR), MAXES(NPWR)
      INTEGER HPWR, I, J, SUM, T
      LOGICAL ISDONE
      PWRS(1) = 1
      DO 20 I=2,NPWR
      PWRS(I) = 2 * PWRS(I - 1)
20    CONTINUE
      WAYS1 = 0
      DO 55 J=NPWR,1,-1
      HPWR = PWRS(J)
      T = TARGET - HPWR
C IF T IS ZERO, HPWR = TARGET
      IF (T .EQ. 0) WAYS1 = 1
C NEED TO MAKE T USING NUMBERS SMALLER THAN OR EQUAL TO HPWR (THE
C HIGHEST POWER OF 2)
      DO 29 I=1,NPWR
C FOR ALL POWERS SMALLER THAN THE MAXIMUM WE'RE CONSIDERING, WORK
C OUT THE MAXIMUM NUMBER OF EACH THAT COULD PLAUSIBLY BE NEEDED IN THE
C SUM. SET ALL COEFFICIENTS TO ZERO
      IF (PWRS(I) .GT. HPWR) GOTO 25
      MAXES(I) = T / PWRS(I)
      GOTO 28
25    MAXES(I) = 0
28    COEFFS(I) = 0
29    CONTINUE
      ISDONE = .FALSE.
30    CALL CNTL(COEFFS, MAXES, J, ISDONE)
      IF (ISDONE) GOTO 55
      SUM = 0
C HAVE WE FOUND A COMBINATION OF COEFFICIENTS THAT MULTIPLY BY THEIR
C RESPECTIVE POWERS OF 2 TO GIVE US THE REDUCED TARGET T?
      DO 40, I=1,NPWR
      SUM = SUM + COEFFS(I) * PWRS(I)
40    CONTINUE
      IF (SUM .NE. T) GOTO 50
      WAYS1 = WAYS1 + 1
C      PRINT *, "INCREASED WAYS1 TO", WAYS1
50    GOTO 30
55    CONTINUE
60    END    