LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.all;

entity div_9 is port(
	clk, reset: in std_logic;
	clk_out: out std_logic
);
end div_9;

architecture arq of div_9 is
signal count: std_logic_vector(3 downto 0);
signal temp0, temp1, D: std_logic;

begin

D <= ((not count(3) and  not count(2) and count(1) and count(0)) or temp0) and not count(3);

FF0: process(clk,D,reset)
begin
	if reset = '1' then
		temp0 <= '0';
	elsif clk'event and clk = '1' then
		temp0 <= D;
	end if;
end process;

FF1: process(clk,temp0,reset)
begin
	if reset = '1' then
		temp1 <= '0';
	elsif clk'event and clk = '0' then
		temp1 <= temp0;
	end if;
end process;

P1: process(clk, reset, count)
begin 
	if reset = '1' or count = "1001" then
		count <= "0000";
	elsif clk'event and clk = '1' then
		count <= count + 1;
	end if;
end process;
clk_out <= temp0 and temp1;
end arq;