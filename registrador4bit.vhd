LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY registrador4bit IS

PORT(
	d: IN std_logic_vector(3 downto 0);
	load, clear, clock: IN std_logic;
	q: OUT std_logic_vector(3 downto 0)
);

END registrador4bit;

ARCHITECTURE hardware OF registrador4bit IS

COMPONENT registrador1bit IS 

PORT(
	d, load, clear, clock: IN std_logic;
	q: OUT std_logic
);

END COMPONENT;
BEGIN

M0: registrador1bit PORT MAP (
	d => d(0),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(0)
);

M1: registrador1bit PORT MAP (
	d => d(1),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(1)
);

M2: registrador1bit PORT MAP (
	d => d(2),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(2)
);

M3: registrador1bit PORT MAP (
	d => d(3),
	load => load,
	clock => clock,
	clear =>  clear,
	q => q(3)
);

END hardware;