ENTITY exemplo_5 IS

PORT(
	i0, i1, i2, i3, a, b: IN bit;
	q: OUT bit
);

END exemplo_5;

ARCHITECTURE arq OF exemplo_5 IS
BEGIN

	PROCESS(i0, i1, i2, i3, a, b)
		VARIABLE val: INTEGER RANGE 0 TO 3;
	
	BEGIN
		
		val := 0;
		
		IF (a = '1') THEN
			val := val + 1;
		END IF;
		
		IF (b = '1') THEN
			val := val + 2;
		END IF;
		
		CASE val IS
			WHEN 0 => q <= i0;
			WHEN 1 => q <= i1;
			WHEN 2 => q <= i2;
			WHEN 3 => q <= i3;
		END CASE;
		
	END PROCESS;
END arq;