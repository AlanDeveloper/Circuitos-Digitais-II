LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.all;

ENTITY clk_div IS 
PORT(
	clock_50mhz, clear: IN std_logic;
	clock_1hz: OUT std_logic
);
END clk_div;

ARCHITECTURE clk_div_hardware OF clk_div IS

SIGNAL clock_1hz_temp: std_logic;

BEGIN 

PROCESS(clock_50mhz, clear)

VARIABLE count: NATURAL RANGE 0 TO 5 := 0;

BEGIN

	IF clear = '1' THEN
		clock_1hz_temp <= '0';
	ELSIF clock_50mhz'EVENT AND clock_50mhz = '1' THEN
		count := count + 1;

		IF count = 5 THEN
			clock_1hz_temp <= '1';
			count := 0;
		ELSE
			clock_1hz_temp <= '0';
		END IF;
	END IF;
	clock_1hz <= clock_1hz_temp;
END PROCESS;

END clk_div_hardware;