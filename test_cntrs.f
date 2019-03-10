      PROGRAM TESTICTNS
      CALL TEST1(1)
      CALL TCNTR1(1)
      CALL TCNTR2(1)
      CALL TCNTL1(1)
      CALL TCNTL2(1)
      END

      SUBROUTINE TEST1(T)
      INTEGER T, NUMS(3), NZLEN, CNT
      LOGICAL ISDONE
      ISDONE = .FALSE.
      CALL AIZERO(NUMS, 3)
      NZLEN = 0
      CNT = 0
1     CALL ICTNS(NUMS, 3, 2, NZLEN, ISDONE)
      CNT = CNT + 1
      IF (ISDONE) GOTO 3
      GOTO 1
3     CALL IXPECT(T, 1, CNT, 15)
      END

      SUBROUTINE TCNTR1(T)
      INTEGER T, NUMS(3), MAXES(3), CNT
      LOGICAL ISDONE
      ISDONE = .FALSE.
      CALL AIZERO(NUMS, 3)
      CALL AIFILL(MAXES, 3, 9)
      CNT = 0
11    CALL CNTR(NUMS, MAXES, 3, ISDONE)
      CNT = CNT + 1
      IF (ISDONE) GOTO 13
      GOTO 11
13    CALL IXPECT(T, 1, CNT, 1000)
      END

      SUBROUTINE TCNTR2(T)
      INTEGER T, NUMS(3), MAXES(3), CNT
      LOGICAL ISDONE
      ISDONE = .FALSE.
      CALL AIZERO(NUMS, 3)
      MAXES(1)=3
      MAXES(2)=6
      MAXES(3)=4
      CNT = 0
21    CALL CNTR(NUMS, MAXES, 3, ISDONE)
      CNT = CNT + 1
      IF (ISDONE) GOTO 23
      GOTO 21
23    CALL IXPECT(T, 1, CNT, 140)
      END

      SUBROUTINE TCNTL1(T)
      INTEGER T, NUMS(3), MAXES(3), CNT
      LOGICAL ISDONE
      ISDONE = .FALSE.
      CALL AIZERO(NUMS, 3)
      CALL AIFILL(MAXES, 3, 9)
      CNT = 0
31    CALL CNTL(NUMS, MAXES, 3, ISDONE)
      CNT = CNT + 1
      IF (ISDONE) GOTO 33
      GOTO 31
33    CALL IXPECT(T, 1, CNT, 1000)
      END

      SUBROUTINE TCNTL2(T)
      INTEGER T, NUMS(3), MAXES(3), CNT
      LOGICAL ISDONE
      ISDONE = .FALSE.
      CALL AIZERO(NUMS, 3)
      MAXES(1)=3
      MAXES(2)=6
      MAXES(3)=4
      CNT = 0
41    CALL CNTL(NUMS, MAXES, 3, ISDONE)
      CNT = CNT + 1
      IF (ISDONE) GOTO 43
      GOTO 41
43    CALL IXPECT(T, 1, CNT, 140)
      END
