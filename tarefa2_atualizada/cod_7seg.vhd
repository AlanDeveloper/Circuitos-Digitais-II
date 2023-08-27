LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY cod_7seg IS
PORT(
	d0, d1: IN integer RANGE 9 DOWNTO 0;
	q0, q1 : OUT std_logic_vector(6 downto 0)
);
END cod_7seg;


ARCHITECTURE arch OF cod_7seg IS

BEGIN

WITH d0 SELECT
  q0 <= "0000001" WHEN 0,
             "1001111" WHEN 1,
				 "0010010" WHEN 2,
				 "0000110" WHEN 3,
				 "1001100" WHEN 4,
				 "0100100" WHEN 5,
				 "0100000" WHEN 6,
				 "0001111" WHEN 7,
				 "0000000" WHEN 8,
				 "0000100" WHEN 9,
				 "0111000" WHEN OTHERS;

 WITH d1 SELECT
  q1 <= "0000001" WHEN 0,
             "1001111" WHEN 1,
				 "0010010" WHEN 2,
				 "0000110" WHEN 3,
				 "1001100" WHEN 4,
				 "0100100" WHEN 5,
				 "0100000" WHEN 6,
				 "0001111" WHEN 7,
				 "0000000" WHEN 8,
				 "0000100" WHEN 9,
				 "0111000" WHEN OTHERS; 
END arch;