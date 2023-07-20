LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY registrador1bit IS

PORT(
	d, load, clear, clock: IN std_logic;
	q: OUT std_logic
);

END registrador1bit;

ARCHITECTURE hardware OF registrador1bit IS

SIGNAL q_temp: std_logic;

BEGIN

PROCESS(load, clear, clock, q_temp)
BEGIN
	
	IF clear = '1' THEN
		q_temp <= '0';
	ELSIF clock'EVENT AND CLOCK = '1' THEN
		IF load = '1' THEN
			q_temp <= d;
		ELSE 
			q_temp <= q_temp;
		END IF;
	END IF;
	q <= q_temp;
END PROCESS;
END hardware;