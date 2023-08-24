LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity FSM is
port(
clk, reset, updown : in std_logic;
saida : out std_logic_vector(1 downto 0));
end FSM;

architecture arq of FSM is

TYPE tipo_estado IS (estado_0, estado_1, estado_2, estado_3);
SIGNAL estado_atual, proximo_estado: tipo_estado;
begin

process (reset, clk)
begin
	if (reset = '0') then
		estado_atual <= estado_0;
	elsif (clk'EVENT and clk = '1') then
		estado_atual <= proximo_estado;
	end if;

end process;

process(estado_atual, updown)
begin

	case estado_atual is
		when estado_0 =>
			saida <= "00";
			if updown = '0' then
				proximo_estado <= estado_1;
			else 
				proximo_estado <=estado_3;
			end if;
		when estado_1 =>
			saida <= "01";
			if updown = '0' then
				proximo_estado <= estado_2;
			else 
				proximo_estado <= estado_0;
			end if;
		when estado_2 =>
			saida <= "10";
			if updown = '0' then
				proximo_estado <= estado_3;
			else 
				proximo_estado <= estado_1;
			end if;
		when estado_3 =>
			saida <= "11";
			if updown = '0' then
				proximo_estado <= estado_0;
			else 
				proximo_estado <= estado_2;
			end if;
	end case;

end process;

end arq;