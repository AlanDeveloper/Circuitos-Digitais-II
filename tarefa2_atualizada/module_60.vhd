LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.all;

ENTITY module_60 IS 
PORT(
	clock_50mhz, clear, load: IN std_logic;
	q0, q1: OUT integer RANGE 9 DOWNTO 0;
	q_display0, q_display1: OUT std_logic_vector(6 downto 0)
);
END module_60;

ARCHITECTURE module_60_hardware OF module_60 IS

SIGNAL count: integer RANGE 59 DOWNTO 0;
SIGNAL q0_temp, q1_temp: integer RANGE 9 DOWNTO 0;
SIGNAL q_temp_display0, q_temp_display1: std_logic_vector(6 downto 0);

COMPONENT counter IS 

PORT(
	load, clear, clock: IN std_logic;
	q: OUT integer RANGE 59 DOWNTO 0
);

END COMPONENT;

COMPONENT cod_7seg IS 

PORT(
	d0, d1: IN integer RANGE 9 DOWNTO 0;
	q0, q1: OUT std_logic_vector(6 downto 0)
);

END COMPONENT;

BEGIN

COUNT3R: counter PORT MAP(
	load => load,
	clear => clear,
	clock => clock_50mhz,
	q => count
);
q0_temp <= count mod 10;
q1_temp <= count / 10;
q0 <= q0_temp;
q1 <= q1_temp;

DISPLAY: cod_7seg PORT MAP(
	d0 => q0_temp,
	d1 => q1_temp,
	q0 => q_temp_display0,
	q1 => q_temp_display1
);
q_display0 <= q_temp_display0;
q_display1 <= q_temp_display1;

END module_60_hardware;