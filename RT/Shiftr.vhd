Library IEEE;
USE IEEE.std_logic_1164.all;

Entity Shiftr is
Port(A : in std_logic_vector(7 downto 0);
	  S : out std_logic_vector(7 downto 0)
	  );
end Shiftr;

architecture arq of Shiftr is
begin

S <= '0'& A(7 downto 1);

end arq;