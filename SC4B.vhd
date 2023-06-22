LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY SC4b IS 

PORT (
	A: IN std_logic_vector(3 downto 0);
	B: IN std_logic_vector(3 downto 0);
	COUT: OUT std_logic;
	S: OUT std_logic_vector(3 downto 0);
	Z: OUT std_logic
);

END SC4b;

ARCHITECTURE ARQ OF SC4b IS

COMPONENT SC IS 

PORT (
	A: IN std_logic;
	B: IN std_logic;
	CIN: IN std_logic;
	COUT: OUT std_logic;
	S: OUT std_logic
);

END COMPONENT;

SIGNAL C0, C1, C2: std_logic;
SIGNAL S_AUX: std_logic_vector(3 downto 0);

BEGIN

M0: SC PORT MAP (
	A => A(0),
	B => B(0),
	CIN => '0',
	COUT => C0,
	S =>  S_AUX(0)
);

M1: SC PORT MAP (
	A => A(1),
	B => B(1),
	CIN => C0,
	COUT => C1,
	S =>  S_AUX(1)
);

M2: SC PORT MAP (
	A => A(2),
	B => B(2),
	CIN => C1,
	COUT => C2,
	S =>  S_AUX(2)
);

M3: SC PORT MAP (
	A => A(3),
	B => B(3),
	CIN => C2,
	COUT => COUT,
	S =>  S_AUX(3)
);

S <= S_AUX;
Z <= NOT(S_AUX(0) OR S_AUX(1) OR S_AUX(2) OR S_AUX(3));

END ARQ;