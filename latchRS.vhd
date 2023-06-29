ENTITY latchRS IS

PORT (
	R, S: IN bit;
	Q: OUT bit
);

END latchRS;

ARCHITECTURE arq OF latchRS IS
BEGIN

	PROCESS(R, S)
		VARIABLE temp: bit;
		BEGIN
		
			IF (R = '1') THEN
				temp := '0';
			ELSIF (S = '1') THEN
				temp := '1';
			END IF;
			
			Q <= temp;
		
	END PROCESS;

END arq;