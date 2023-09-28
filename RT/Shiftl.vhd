Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Shiftl is
Port(A : in std_logic_vector(7 downto 0);
	  S : out std_logic_vector(7 downto 0)
	  );
end Shiftl;

architecture arq of Shiftl is
begin

S <= A(6 downto 0)&'0';

end arq;