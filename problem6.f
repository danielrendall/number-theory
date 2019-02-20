      PROGRAM PROBLEM6
      CALL QUARES(3)
      CALL QUARES(5)
      CALL QUARES(7)
      CALL QUARES(11)
      CALL QUARES(17)
      CALL QUARES(29)
      CALL QUARES(61)
      END

C A NUMBER N IS A QUADRATIC RESIDUE MODULO P IF P DND N AND THERE IS
C A NUMBER M (1 <= M < PRIME) SUCH THAT PRIME DIVIDES M^2 - N
      SUBROUTINE QUARES(PRIME)
      INTEGER PRIME
C NUMBER TO TEST FOR BEING A QUADRATIC RESIDUE
      INTEGER N
      LOGICAL QURESP
      PRINT *, "QUADRATIC RESIDUES MODULO ", PRIME
      DO 10 N=1,PRIME-1
      IF (QURESP(N, PRIME)) PRINT *, N
10    CONTINUE
      END
   

      LOGICAL FUNCTION QURESP(N, P)
      INTEGER N, P, M
      LOGICAL DIVIDP
      QURESP = .FALSE.
      M = 1
100   IF (DIVIDP(M*M - N, P)) GOTO 110
      M = M + 1
      IF (M .EQ. P) GOTO 120
      GOTO 100
110   QURESP = .TRUE.
120   END
      

