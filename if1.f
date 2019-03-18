      PROGRAM IF1
      LOGICAL A, B
      A = .FALSE.
      B = .TRUE.
      IF (A .AND. B) GOTO 10
      PRINT *,"ELSE BRANCH: A AND B IS FALSE"
      GOTO 20
10    PRINT *,"IF BRANCH: A AND B IS TRUE"
20    PRINT *,"THE END"
      END

