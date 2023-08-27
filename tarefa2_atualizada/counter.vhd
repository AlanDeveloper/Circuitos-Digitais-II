LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.all;

ENTITY counter IS
PORT(
	clock, load, clear: IN std_logic;
	q: OUT integer RANGE 59 DOWNTO 0);
END counter;

ARCHITECTURE counter_hardware OF counter IS
BEGIN

PROCESS(clock, clear)
	VARIABLE q_temp: integer RANGE 59 DOWNTO 0;

	BEGIN 
	IF clear = '1' OR q_temp > 59 THEN
		q_temp := 0;
	ELSIF clock'event AND clock = '1' THEN
		IF load = '1' THEN
			q_temp := q_temp + 1;
		END IF;
	END IF;

	q <= q_temp;
END PROCESS;

END counter_hardware;