LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY r4bit IS

PORT(
	d: IN std_logic_vector(3 downto 0);
	load, clear, clock: IN std_logic;
	q: OUT std_logic_vector(3 downto 0)
);

END r4bit;


ARCHITECTURE r4bit_hardware OF r4bit IS

COMPONENT r1bit IS 

PORT(
	d, load, clear, clock: IN std_logic;
	q: OUT std_logic
);

END COMPONENT;

BEGIN

R0: r1bit PORT MAP (
	d => d(0),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(0)
);

R1: r1bit PORT MAP (
	d => d(1),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(1)
);

R2: r1bit PORT MAP (
	d => d(2),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(2)
);

R3: r1bit PORT MAP (
	d => d(3),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(3)
);

END r4bit_hardware;