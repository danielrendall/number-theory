C     PRIMEP RETURNS .TRUE. IF I IS PRIME, OTHERWISE FALSE.
      LOGICAL FUNCTION PRIMEP(I)
      LOGICAL EVENP, DIVIDP
      INTEGER I, T
      REAL SQRTI
      PRIMEP = I .GT. 1
      IF ((I .EQ. 2) .OR. 
     1 (I .EQ. 3) .OR. 
     2 (I .EQ. 5) .OR. 
     3 (I .EQ. 7)) GOTO 100
      IF ((EVENP(I)) .OR. 
     1 (DIVIDP(I, 3)) .OR. 
     2 (DIVIDP(I, 5)) .OR. 
     3 (DIVIDP(I, 7))) PRIMEP = .FALSE.
      SQRTI = SQRT(I * 1.0)
      T = 7
10    T = T + 4
      IF (.NOT. PRIMEP) GOTO 100
      IF (T .GT. SQRTI) GOTO 100
      IF (DIVIDP(I, T)) PRIMEP = .FALSE.
      T = T + 2
      IF (.NOT. PRIMEP) GOTO 100
      IF (T .GT. SQRTI) GOTO 100
      IF (DIVIDP(I, T)) PRIMEP = .FALSE.
      GOTO 10
100   RETURN
      END
