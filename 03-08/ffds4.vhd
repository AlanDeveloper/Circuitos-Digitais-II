LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY ffds4 IS

PORT(
	load, clear, clock: IN std_logic;
	q: OUT std_logic_vector(3 downto 0)
);

END ffds4;

ARCHITECTURE ffds4_hardware OF ffds4 IS

COMPONENT ffd IS 

PORT(
	d, load, clear, clock: IN std_logic;
	q, q_not: OUT std_logic
);

END COMPONENT;

SIGNAL clear_temp: std_logic;
SIGNAL q_temp: std_logic_vector(3 downto 0);
SIGNAL q_not_temp: std_logic_vector(3 downto 0);

BEGIN

R0: ffd PORT MAP (
	d => q_not_temp(0),
	load => load,
	clock => clock,
	clear =>  clear_temp,
	q => q_temp(0),
	q_not => q_not_temp(0)
);

R1: ffd PORT MAP (
	d => q_not_temp(1),
	load => load,
	clock => q_not_temp(0),
	clear =>  clear_temp,
	q => q_temp(1),
	q_not => q_not_temp(1)
);

R2: ffd PORT MAP (
	d => q_not_temp(2),
	load => load,
	clock => q_not_temp(1),
	clear =>  clear_temp,
	q => q_temp(2),
	q_not => q_not_temp(2)
);

R3: ffd PORT MAP (
	d => q_not_temp(3),
	load => load,
	clock => q_not_temp(2),
	clear =>  clear_temp,
	q => q_temp(3),
	q_not => q_not_temp(3)
);

clear_temp <= clear or (q_temp(1) and q_temp(3));
q <= q_temp;

END ffds4_hardware;