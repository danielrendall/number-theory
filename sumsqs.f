C UPPER = UPPER BOUND, UPSQRT = INTEGER SQUARE ROOT OF UPPER BOUND,
C NUMSQ = MAX NUMBER OF SQUARES TO BE SUMMED
      SUBROUTINE SUMSQS(UPPER, UPSQRT, NUMSQ)
      INTEGER UPPER, UPSQRT, SQURES(UPSQRT), I, SOLUTN(NUMSQ), NUSED, SQUARE, CUBE
      LOGICAL AICONS
      CALL POPSQU(SQURES, UPSQRT)
C SQURES NOW CONTAINS ALL SQUARE NUMBERS BETWEEN 1 AND THE UPPER 
C BOUND OF THE PROBLEM
      DO 10 I=1,UPPER
      CALL AIZERO(SOLUTN, NUMSQ)
      NUSED = 0
      CALL CBMFS(I, SQURES, UPSQRT, NUMSQ, SOLUTN, NUSED)
      IF (NUSED .EQ. 0) GOTO 10
      PRINT *, I
10    CONTINUE
      END


C CAN BE MADE FROM SQUARES. TARGET IS THE NUMBER TO MAKE, SQURES IS
C AN ARRAY OF ALL USABLE SQUARE NUMBERS, WHICH HAS LENGTH UPSQRT, 
C AND NUMSQ IS THE MAXIMUM NUMBER OF SQUARES TO USE. SOLUTN HOLDS 
C THE SQUARES FOUND, AND NUSED IS HOW MANY WERE USED.
      SUBROUTINE CBMFS(TARGET, SQURES, UPSQRT, NUMSQ, SOLUTN, NUSED)
      INTEGER TARGET, SQURES(*), UPSQRT, NUMSQ, SOLUTN(*), NUSED
C I = INDEX USED WHILE SUMMING SQUARES
      INTEGER I
C CURSUM = SUM OF CURRENT COMBINATION OF SQUARES
C FLAG TO SAY IF ENUMERATION HAS FINISHED
      LOGICAL ISDONE
      ISDONE = .FALSE.
100   CALL ICTNS(SOLUTN, NUMSQ, UPSQRT, NUSED, ISDONE)
      IF (ISDONE) GOTO 190
      CURSUM = 0
      DO 150 I=1,NUSED
      CURSUM = CURSUM + SQURES(SOLUTN(I))
150   CONTINUE
      IF (CURSUM .EQ. TARGET) GOTO 200
      GOTO 100
190   NUSED = 0
200   END

C ICTNS = INCREMENT COUNTERS TO NEXT STATE. WE ARE PASSED AN ARRAY
C OF COUNTERS OF A GIVEN SIZE; THESE ARE ALL EITHER ZERO OR A NUMBER
C BETWEEN 1 AND MAX. IF THERE ARE TRAILING ZERO ENTRIES, WE INCREMENT
C THE FIRST OF THESE TO 1 (THERE ARE NEVER LEADING ZERO ENTRIES). IF
C ALL ENTRIES ARE NON-ZERO, WE INCREMENT THE RIGHT-MOST ENTRY; IF 
C THIS WOULD CAUSE IT TO EXCEED THE MAXIMUM THEN WE RESET IT TO ZERO 
C AND INCREMENT THE NEXT RIGHT-MOST ENTRY AND SO ON. IF WE FIND 
C OURSELVES RESETTING THE LEFT-MOST ENTRY TO ZERO (I.E. WE'VE ENDED
C UP BACK AT THE ALL-ZEROES STATE) WE SET A FLAG TO INDICATE THAT
C WE'VE FINISHED.
C NZLEN IS RETURNED, IT IS THE LENGTH OF THE RUN OF LEFT-MOST NON-ZERO
C ELEMENTS. 1 <= NZLEN <= SIZE
C EXAMPLE, IF SIZE = 3, MAX=2
C 0 0 0
C 1 0 0
C 1 1 0
C 1 1 1
C 1 1 2
C 1 2 0
C 1 2 1
C 1 2 2
C 2 0 0 
C 2 1 0
C 2 1 1
C 2 1 2
C 2 2 0
C 2 2 1
C 2 2 2

      SUBROUTINE ICTNS(CNTERS, SIZE, MAX, NZLEN, ISDONE)
      INTEGER CNTERS(*), SIZE, NZLEN, MAX
      LOGICAL ISDONE
C INDEX OF THE LEFT-MOST ZERO
      INTEGER LMZ
C INDEX THAT WE ARE ABOUT TO IMPLEMENT
      INTEGER INCI
C VALUE AT POSITION THAT WE WANT TO INCREMENT
      INTEGER CURVAL
      ISDONE = .FALSE.
C SCAN TO FIND THE LEFT-MOST ZERO
      LMZ = 1
9000  IF ((LMZ .GT. SIZE) .OR. (CNTERS(LMZ) .EQ. 0)) GOTO 9010
      LMZ = LMZ + 1
      GOTO 9000
C LMZ NOW POINTS AT THE LEFT-MOST ZERO, OR IS EQUAL TO SIZE + 1. IF IT
C IS LESS THAN OR EQUAL TO SIZE, WE JUST INCREASE THE NUMBER THERE AND
C SET NZLEN   
9010  IF (LMZ > SIZE) GOTO 9020
C LMZ <= SIZE, THEREFORE IT POINTS AT ENTRY WHICH IS ZERO, SO WE CAN
C INCREASE IT TO ONE, SET NZLEN AND RETURN
      CNTERS(LMZ) = 1
      NZLEN = LMZ
      GOTO 9100
C WE NEED TO INCREMENT THE RIGHT-MOST NUMBER; IF THIS EXCEEDS MAX THEN
C WE ROLL DOWN TO ZERO AND INCREMENT THE NEXT RIGHT-MOST NUMBER AND SO
C ON. IF WE ROLL THE LEFT-MOST NUMBER DOWN TO ZERO WE'VE FINISHED
9020  INCI = SIZE
9030  CURVAL = CNTERS(INCI)
      IF (CURVAL .LT. MAX) GOTO 9050
C CURVAL = MAX, SO WE NEED TO OVERFLOW TO ZERO AND DECREMENT INCI
      CNTERS(INCI) = 0
      INCI = INCI - 1
      IF (INCI .EQ. 0) GOTO 9040
      GOTO 9030
C WE'VE RESET EVERYTHING TO ZERO, SO WE'VE FINISHED
9040  ISDONE = .TRUE.
      GOTO 9100
C AT INCI IS SOMETHING WHICH CAN BE INCREMENTED WITHOUT OVERFLOW, SO
C INCREMENT AND SET NZLEN TO INCI
9050  CNTERS(INCI) = CURVAL + 1
      NZLEN = INCI
9100  END