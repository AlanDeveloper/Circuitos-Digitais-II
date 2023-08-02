LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY rp4bit IS

PORT(
	A, B: IN std_logic_vector(3 downto 0);
	load, clear, clock, sel_ab, c1, c0: IN std_logic;
	q: OUT std_logic_vector(3 downto 0)
);

END rp4bit;

ARCHITECTURE rp4bit_hardware OF rp4bit IS

COMPONENT r4bit IS 

PORT(
	d: IN std_logic_vector(3 downto 0);
	load, clear, clock: IN std_logic;
	q: OUT std_logic_vector(3 downto 0)
);

END COMPONENT;

SIGNAL d_temp: std_logic_vector(3 downto 0);

BEGIN

PROCESS(clear, clock)
BEGIN

	IF sel_ab = '1' THEN
		d_temp <= A;
	ELSE
		d_temp <= B;
	END IF;
END PROCESS;

R0: r4bit PORT MAP (
	d => d_temp,
	load => load,
	clock => clock,
	clear =>  clear,
	q => q
);

END rp4bit_hardware;