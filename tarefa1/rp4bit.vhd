LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY rp4bit IS

PORT(
	A, B: IN std_logic_vector(3 downto 0);
	clear, clock, sel_ab, c1, c0: IN std_logic;
	visor_ten, visor_unity: OUT std_logic_vector(6 downto 0);
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
SIGNAL load: std_logic := '1';
SIGNAL ten, unity : INTEGER range 0 to 9 := 0;

BEGIN

PROCESS(clear, clock)

BEGIN	

	IF clock'EVENT AND clock = '1' THEN
	
		IF c1 = '1' AND c0 = '1' THEN
			
			IF sel_ab = '1' THEN
				d_temp <= A;
			ELSE
				d_temp <= B;
			END IF;
		ELSIF (c1 = '1' AND c0 = '0') THEN
			d_temp <= '0' & d_temp(3) & d_temp(2) & d_temp(1);
		ELSIF (c1 = '0' AND c0 = '1') THEN
			d_temp <= d_temp(2) & d_temp(1) & d_temp(0) & '0';
		ELSE
			d_temp <= d_temp;
		END IF;
	END IF;
END PROCESS;

R0: r4bit PORT MAP (
	d => d_temp,
	load => load,
	clock => clock,
	clear =>  clear,
	q => q
);

PROCESS(d_temp)
BEGIN
	IF clock'event AND clock = '1' THEN		
		ten <= to_integer(signed(d_temp)) / 10;
		unity <= to_integer(signed(d_temp)) mod 10;
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

END rp4bit_hardware;