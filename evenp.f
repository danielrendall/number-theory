C     EVENP RETURNS .TRUE. IF THE INTEGER PASSED IS EVEN, OTHERWISE .FALSE.
      LOGICAL FUNCTION EVENP(I)
      LOGICAL DIVIDP
      INTEGER I
      EVENP = DIVIDP(I, 2)
      RETURN
      END
