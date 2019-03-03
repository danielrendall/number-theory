C EXPECT 0XACE1 = 44257 TO BE FOLLOWED BY 0X5670 = 22128
      PROGRAM LFSR1
      INTEGER PERIOD, ISTART, ILFSR, BVAL
     0LOGICAL START(16), LFSR(16), BIT(16), 
     1        TAP1(16), TAP2(16), TAP3(16), TAP4(16),
     2        TMP1(16), TMP2(16), NLFSR(16), NBIT(16)
      PERIOD = 0
      ISTART = 44257
      ILFSR = 44257
      CALL ITOBIT(START, 16, ISTART)
      CALL ITOBIT(LFSR, 16, ILFSR)
C10    PRINT *,ILFSR
10    CALL BSR(LFSR, TAP1, 16, 0)
      CALL BSR(LFSR, TAP2, 16, 2)
      CALL BSR(LFSR, TAP3, 16, 3)
      CALL BSR(LFSR, TAP4, 16, 5)
      CALL XOR(TAP1, TAP2, TMP1, 16)
      CALL XOR(TAP3, TAP4, TMP2, 16)
      CALL XOR(TMP1, TMP2, BIT, 16)
      CALL BSR(LFSR, NLFSR, 16, 1)
      CALL BSL(BIT, NBIT, 16, 15)
      CALL OR(NLFSR, NBIT, LFSR, 16)
      ILFSR = BVAL(LFSR, 16)
      PERIOD = PERIOD + 1
      IF (ILFSR .EQ. ISTART) GOTO 20
      GOTO 10
20    PRINT *, "PERIOD=", PERIOD
      END
