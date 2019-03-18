      PROGRAM IF2
      CALL CMP(2, 4)
      CALL CMP(3, 3)
      CALL CMP(4, 2)
      END

      SUBROUTINE CMP(A, B)
      INTEGER A, B
      IF (A - B) 10, 20, 30
10    PRINT *, A, "IS LESS THAN", B
      GOTO 40
20    PRINT *, A, "EQUALS", B
      GOTO 40
30    PRINT *, A, "IS GREATER THAN", B
40    END
