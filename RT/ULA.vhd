Library IEEE;
USE IEEE.std_logic_1164.all;

Entity ULA is
Port(A : in std_logic_vector(7 downto 0);
     op : in std_logic;
	  S : out std_logic_vector(7 downto 0)
	  );
end ULA;

architecture arq of ULA is

component Shiftl is
Port(A : in std_logic_vector(7 downto 0);
	  S : out std_logic_vector(7 downto 0)
	  );
end component;

component Shiftr is
Port(A : in std_logic_vector(7 downto 0);
	  S : out std_logic_vector(7 downto 0)
	  );
end component;

signal tempL,TempR : std_logic_vector(7 downto 0);

begin

M0: Shiftl port map(A,tempL);
M1: Shiftr port map(A,tempR);


S <= tempL when op = '0' else tempR;

end arq;