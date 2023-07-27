LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY r1bit IS

PORT(
	d, load, clear, clock: IN std_logic;
	q: OUT std_logic
);

END r1bit;

ARCHITECTURE r1bit_hardware OF r1bit IS

SIGNAL q_temp: std_logic;

BEGIN

PROCESS(clear, clock)
BEGIN

	IF clear = '1' THEN
		q_temp <= '0';
	ELSIF clock'EVENT AND clock = '1' THEN
		IF load = '1' THEN
			q_temp <= d;
		ELSE 
			q_temp <= q_temp;
		END IF;
	END IF;
	q <= q_temp;
END PROCESS;

END r1bit_hardware;