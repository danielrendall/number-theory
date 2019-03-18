      PROGRAM SWAPS2
      INTEGER A, B
      A = 2
      B = 9
      PRINT *,"BEFORE: A=", A, "B=", B
      CALL SUBRTN(A + 0, B * 1)
      PRINT *,"AFTER: A=", A, "B=", B
      END

      SUBROUTINE SUBRTN(A, B)
      INTEGER A, B, C
      C = B
      B = A
      A = C
      END

