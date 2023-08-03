LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ffd IS

PORT(
	d, load, clear, clock: IN std_logic;
	q, q_not: OUT std_logic
);

END ffd;

ARCHITECTURE ffd_hardware OF ffd IS

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
	q_not <= not q_temp;
END PROCESS;

END ffd_hardware;