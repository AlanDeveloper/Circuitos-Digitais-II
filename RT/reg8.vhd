Library IEEE;
USE IEEE.std_logic_1164.all;

Entity reg8 is
Port(D : in std_logic_vector(7 downto 0);
     clk,reset,carga : in std_logic;
	  q : out std_logic_vector(7 downto 0)
	  );
end reg8;

architecture arq of reg8 is
begin

P1: process(clk,reset,D)
begin
    if reset = '1' then
	    q <= (others => '0');
	 elsif clk'event and clk = '1' then
	    if carga = '1' then
		    q <= D;
		 end if;
	 end if;
end process;

end arq; 