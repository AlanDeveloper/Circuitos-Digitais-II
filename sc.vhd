LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SC IS 

PORT (
	A: IN std_logic;
	B: IN std_logic;
	CIN: IN std_logic;
	COUT: OUT std_logic;
	S: OUT std_logic
);

END SC;

ARCHITECTURE ARQ OF SC IS
BEGIN

	S <= (A XOR B) XOR CIN;
	COUT <= (A AND B) OR (A AND CIN) OR (B AND CIN);

END ARQ;