C ARRAY PREDICATES

C SORTDP RETURNS .TRUE. IF ARRAY IS SORTED, OTHERWISE .FALSE.
      LOGICAL FUNCTION SORTDP(ARRAY, SIZE)
      INTEGER ARRAY(*), SIZE, I
      SORTDP = .TRUE.
      DO 10 I=1,SIZE-1
      IF (ARRAY(I) .GT. ARRAY(I+1)) SORTDP = .FALSE.
10    CONTINUE
      END

C AIEQ RETURNS .TRUE. IF A1 EQUALS A2, OTHERWISE .FALSE.
      LOGICAL FUNCTION AIEQ(A1, A2, SIZE)
      INTEGER A1(*), A2(*), SIZE, I
      AIEQ = .TRUE.
      DO 20 I=1,SIZE
      IF (A1(I) .NE. A2(I)) AIEQ = .FALSE.
20    CONTINUE
      END
