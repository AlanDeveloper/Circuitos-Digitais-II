LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_unsigned.all;

ENTITY module_60 IS 
PORT(
	clock_50mhz, clear: IN std_logic;
	visor_ten, visor_unity: OUT std_logic_vector(6 downto 0);
	q: OUT integer RANGE 59 DOWNTO 0
);
END module_60;

ARCHITECTURE module_60_hardware OF module_60 IS

SIGNAL clock_1hz: std_logic;
SIGNAL ten, unity : INTEGER range 0 to 9 := 0;
SIGNAL count: integer RANGE 59 DOWNTO 0;

COMPONENT clk_div IS 

PORT(
	clock_50mhz, clear: IN std_logic;
	clock_1hz: OUT std_logic
);

END COMPONENT;

COMPONENT counter IS 

PORT(
	load, clear, clock: IN std_logic;
	q: OUT integer RANGE 59 DOWNTO 0
);

END COMPONENT;

BEGIN

DIV: clk_div PORT MAP (
	clock_50mhz => clock_50mhz,
	clear => clear,
	clock_1hz => clock_1hz
);

COUNT3R: counter PORT MAP(
	load => '1',
	clear => clear,
	clock => clock_1hz,
	q => count
);

PROCESS(clock_1hz)
BEGIN
	IF clock_1hz'event AND clock_1hz = '1' THEN
		q <= count;
		
		ten <= count / 10;
		unity <= count mod 10;
	END IF;
	
	CASE ten IS
		WHEN 0 => visor_ten <= "1111110"; -- 0
		WHEN 1 => visor_ten <= "0110000"; -- 1
		WHEN 2 => visor_ten <= "1101101"; -- 2
		WHEN 3 => visor_ten <= "1111001"; -- 3
		WHEN 4 => visor_ten <= "0110011"; -- 4
		WHEN 5 => visor_ten <= "1011011"; -- 5
		WHEN 6 => visor_ten <= "1011111"; -- 6
		WHEN 7 => visor_ten <= "1110000"; -- 7
		WHEN 8 => visor_ten <= "1111111"; -- 8
		WHEN 9 => visor_ten <= "1111011"; -- 9
		WHEN OTHERS => visor_ten <= "0000000";
	END CASE;
	
	CASE unity IS
		WHEN 0 => visor_unity <= "1111110"; -- 0
		WHEN 1 => visor_unity <= "0110000"; -- 1
		WHEN 2 => visor_unity <= "1101101"; -- 2
		WHEN 3 => visor_unity <= "1111001"; -- 3
		WHEN 4 => visor_unity <= "0110011"; -- 4
		WHEN 5 => visor_unity <= "1011011"; -- 5
		WHEN 6 => visor_unity <= "1011111"; -- 6
		WHEN 7 => visor_unity <= "1110000"; -- 7
		WHEN 8 => visor_unity <= "1111111"; -- 8
		WHEN 9 => visor_unity <= "1111011"; -- 9
		WHEN OTHERS => visor_unity <= "0000000";
	END CASE;
END PROCESS;

END module_60_hardware;