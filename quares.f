C A NUMBER N IS A QUADRATIC RESIDUE MODULO P IF P DND N AND THERE IS
C A NUMBER M (1 <= M < PRIME) SUCH THAT PRIME DIVIDES M^2 - N
      INTEGER FUNCTION QUARES(PRIME, RES)
      INTEGER PRIME, RES(*)
C NUMBER TO TEST FOR BEING A QUADRATIC RESIDUE
      INTEGER N
      INTEGER I
      LOGICAL QURESP
      I = 0
      DO 100 N=1,PRIME-1
      IF (.NOT. QURESP(N, PRIME)) GOTO 100
      I = I + 1
      RES(I) = N
100   CONTINUE
      QUARES = I
      END
   

      LOGICAL FUNCTION QURESP(N, P)
      INTEGER N, P, M
      LOGICAL DIVIDP
      QURESP = .FALSE.
      M = 1
200   IF (DIVIDP(M*M - N, P)) GOTO 210
      M = M + 1
      IF (M .EQ. P) GOTO 220
      GOTO 200
210   QURESP = .TRUE.
220   END
      

C A NUMBER N IS A QUADRATIC RESIDUE MODULO P IF P DND N AND THERE IS
C A NUMBER M (1 <= M < PRIME) SUCH THAT PRIME DIVIDES M^2 - N
C THIS FUNCTION COMPUTES SQUARES OF ALL NUMBERS LESS THAN THE PRIME 
C MODULO THE PRIME. IT SEEMS THAT THIS GIVES THE RESIDUES IN A 
C MIRRORED PATTERN; 1, 4, 9 ... ... 9, 4, 1
      INTEGER FUNCTION QUAR2(PRIME, RES)
      INTEGER PRIME, RES(*)
      INTEGER N
      INTEGER AIDDUP
      DO 300 N=1,PRIME-1
      RES(N) = MOD(N * N, PRIME)
300   CONTINUE
      QUAR2 = AIDDUP(RES, PRIME - 1)
      END
