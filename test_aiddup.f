      PROGRAM TESTAIDDUP
      CALL ALSAME(1)
      CALL ALDIFF(2)
      CALL PALN1(3)
      CALL PALN2(4)
      CALL PALN3(5)
      CALL PALN4(6)
      CALL PALN5(7)
      CALL PALN6(8)
      CALL PALN10(9)
      CALL PAIRS(10)
      END

      SUBROUTINE ALSAME(T)
      INTEGER T, ARRAY(10), ANS, AIDDUP
      DO 10 I=1,10
      ARRAY(I) = 7
10    CONTINUE
      ANS = AIDDUP(ARRAY, 10)
      CALL IXPECT(T, 1, ANS, 1)
      END

      SUBROUTINE ALDIFF(T)
      INTEGER T, ARRAY(10), ANS, AIDDUP
      DO 20 I=1,10
      ARRAY(I) = I
20    CONTINUE
      ANS = AIDDUP(ARRAY, 10)
      CALL IXPECT(T, 1, ANS, 10)
      END

      SUBROUTINE PALN1(T)
      INTEGER T, ARRAY(1), ANS, AIDDUP
      ARRAY(1) = 1
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 1)
      CALL IXPECT(T, 2, ANS, 1)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      END

      SUBROUTINE PALN2(T)
      INTEGER T, ARRAY(2), ANS, AIDDUP
      ARRAY(1) = 1
      ARRAY(2) = 1
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 2)
      CALL IXPECT(T, 2, ANS, 1)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      END

      SUBROUTINE PALN3(T)
      INTEGER T, ARRAY(3), ANS, AIDDUP
      ARRAY(1) = 1
      ARRAY(2) = 2
      ARRAY(3) = 1
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 3)
      CALL IXPECT(T, 2, ANS, 2)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      CALL IXPECT(T, 4, ARRAY(2), 2)
      END

      SUBROUTINE PALN4(T)
      INTEGER T, ARRAY(4), ANS, AIDDUP
      ARRAY(1) = 1
      ARRAY(2) = 2
      ARRAY(3) = 2
      ARRAY(4) = 1
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 4)
      CALL IXPECT(T, 2, ANS, 2)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      CALL IXPECT(T, 4, ARRAY(2), 2)
      END

      SUBROUTINE PALN5(T)
      INTEGER T, ARRAY(5), ANS, AIDDUP
      DO 30 I=1,3
      ARRAY(I) = I
      ARRAY(6 - I) = I
30    CONTINUE
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 5)
      CALL IXPECT(T, 2, ANS, 3)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      CALL IXPECT(T, 4, ARRAY(2), 2)
      CALL IXPECT(T, 4, ARRAY(3), 3)
      END

      SUBROUTINE PALN6(T)
      INTEGER T, ARRAY(6), ANS, AIDDUP
      DO 30 I=1,3
      ARRAY(I) = I
      ARRAY(7 - I) = I
30    CONTINUE
      CALL IXPECT(T, 1, ARRAY(1), 1)
      ANS = AIDDUP(ARRAY, 6)
      CALL IXPECT(T, 2, ANS, 3)
      CALL IXPECT(T, 3, ARRAY(1), 1)
      CALL IXPECT(T, 4, ARRAY(2), 2)
      CALL IXPECT(T, 5, ARRAY(3), 3)
      END

      SUBROUTINE PALN10(T)
      INTEGER T, ARRAY(10), ANS, AIDDUP
      DO 30 I=1,5
      ARRAY(I) = I
      ARRAY(11 - I) = I
30    CONTINUE
      CALL IXPECT(T, 1, ARRAY(3), 3)
      CALL IXPECT(T, 2, ARRAY(8), 3)
      ANS = AIDDUP(ARRAY, 10)
      CALL IXPECT(T, 3, ANS, 5)
      CALL IXPECT(T, 4, ARRAY(1), 1)
      CALL IXPECT(T, 5, ARRAY(2), 2)
      CALL IXPECT(T, 6, ARRAY(3), 3)
      CALL IXPECT(T, 7, ARRAY(4), 4)
      CALL IXPECT(T, 8, ARRAY(5), 5)
      END

      SUBROUTINE PAIRS(T)
      INTEGER T, ARRAY(10), ANS, AIDDUP
      DO 40 I=1,5
      ARRAY(2 * I - 1) = I
      ARRAY(2 * I) = I
40    CONTINUE
      CALL IXPECT(T, 1, ARRAY(3), 2)
      CALL IXPECT(T, 2, ARRAY(8), 4)
      ANS = AIDDUP(ARRAY, 10)
      CALL IXPECT(T, 3, ANS, 5)
      CALL IXPECT(T, 4, ARRAY(1), 1)
      CALL IXPECT(T, 5, ARRAY(2), 5)
      CALL IXPECT(T, 6, ARRAY(3), 2)
      CALL IXPECT(T, 7, ARRAY(4), 4)
      CALL IXPECT(T, 8, ARRAY(5), 3)
      END
      
