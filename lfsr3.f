C EXPECT 0XACE1 = 44257 TO BE FOLLOWED BY ???
      PROGRAM LFSR3
      INTEGER PERIOD, ISTART, ILFSR, BVAL
     0LOGICAL START(16), LFSR(16), BIT(16), 
     1        TMP(16), ZERO(16),
     2        NLFSR(16), NBIT(16)
      PERIOD = 0
      ISTART = 44257
      ILFSR = 44257
      CALL ITOBIT(START, 16, ISTART)
      CALL ITOBIT(LFSR, 16, ILFSR)
C10    PRINT *,ILFSR
10    CALL BSR(LFSR, TMP, 16, 7)
      CALL XOR(LFSR, TMP, LFSR, 16)
      CALL BSL(LFSR, TMP, 16, 9)
      CALL XOR(LFSR, TMP, LFSR, 16)
      CALL BSR(LFSR, TMP, 16, 13)
      CALL XOR(LFSR, TMP, LFSR, 16)
      ILFSR = BVAL(LFSR, 16)
      PERIOD = PERIOD + 1
      IF (ILFSR .EQ. ISTART) GOTO 20
      GOTO 10
20    PRINT *, "PERIOD=", PERIOD
      END
