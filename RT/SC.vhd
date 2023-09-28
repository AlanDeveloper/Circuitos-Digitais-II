Library IEEE;
USE IEEE.std_logic_1164.all;

Entity SC is
Port(A,B,Cin : in std_logic;
	  S,Cout : out std_logic
	  );
end SC;

architecture arq of SC is
begin

S <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);

end arq;