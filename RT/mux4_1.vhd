Library IEEE;
USE IEEE.std_logic_1164.all;

Entity mux4_1 is
Port(A,B,C,D : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(1 downto 0);
	  y : out std_logic_vector(7 downto 0)
	  );
end mux4_1;

architecture arq of mux4_1 is
begin

with sel select
    y <= A when "00",
	      B when "01",
			C when "10",
			D when others;

end arq;