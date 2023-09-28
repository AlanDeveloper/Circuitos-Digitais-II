Library IEEE;
USE IEEE.std_logic_1164.all;

Entity soma_sub is
Port(A,B : in std_logic_vector(7 downto 0);
     op : in std_logic;
	  N,Z,cout,ov : out std_logic;
	  S : out std_logic_vector(7 downto 0)
	  );
end soma_sub;

architecture arq of soma_sub is

component SC is
port(A,B,Cin :in std_logic;
     S,Cout : out std_logic
);
end component;

signal temp : std_logic_vector(8 downto 0);
signal Binv,s_soma : std_logic_vector(7 downto 0);

begin
temp(0)<= op;

G1: for i in 0 to 7 generate
		Binv(i) <= B(i) xor op;
		MX: SC port map(A(i),Binv(i),temp(i),s_soma(i),temp(i+1));
	 end generate;

cout <= temp(8);
ov <= temp(8) xor temp(7);
N <= s_soma(7);
Z <= '1' when s_soma = "00000000" else '0';	
S <= s_soma; 
	 
end arq;
