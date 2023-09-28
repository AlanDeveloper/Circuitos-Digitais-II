Library IEEE;
USE IEEE.std_logic_1164.all;

Entity datapath is
Port(DataIn : in std_logic_vector(7 downto 0);
     C : in std_logic_vector(27 downto 0);
	  clk,reset : in std_logic;
	  N,Z,cout,ov : out std_logic;
	  DataOut,R0,R1,R2,R3,R4,R5,R6,R7 : out std_logic_vector(7 downto 0)
	  );
end datapath;

architecture arq of datapath is

component reg8 is
Port(D : in std_logic_vector(7 downto 0);
     clk,reset,carga : in std_logic;
	  q : out std_logic_vector(7 downto 0)
	  );
end component;

component mux4_1 is
Port(A,B,C,D : in std_logic_vector(7 downto 0);
     sel : in std_logic_vector(1 downto 0);
	  y : out std_logic_vector(7 downto 0)
	  );
end component;

component soma_sub is
Port(A,B : in std_logic_vector(7 downto 0);
     op : in std_logic;
	  N,Z,cout,ov : out std_logic;
	  S : out std_logic_vector(7 downto 0)
	  );
end component;

component ULA is
Port(A : in std_logic_vector(7 downto 0);
     op : in std_logic;
	  S : out std_logic_vector(7 downto 0)
	  );
end component;

type bus_d is array (0 to 7) of std_logic_vector(7 downto 0);

signal S_R,S_Q : bus_d;
 
signal DataUla,aux : std_logic_vector(7 downto 0);
signal opA_mux,opB_mux,opC_mux : std_logic_vector(7 downto 0);
signal OutSoma,OutShift : std_logic_vector(7 downto 0);

begin

G0: for i in 0 to 7 generate
     M: S_R(i) <= DataIn when c(i) = '0' else DataUla;
     R: reg8 port map(S_R(i),clk,reset,c(8+i),S_Q(i));
    end generate;

M8A:with c(18 downto 16) select
     opA_mux <= S_Q(0) when "000",
	             S_Q(1) when "001",
			       S_Q(2) when "010",
			       S_Q(3) when "011",
			       S_Q(4) when "100",
			       S_Q(5) when "101",
			       S_Q(6) when "110",
			       S_Q(7) when others;

		
M8B:with c(21 downto 19) select
     opB_mux <= S_Q(0) when "000",
	             S_Q(1) when "001",
			       S_Q(2) when "010",
			       S_Q(3) when "011",
			       S_Q(4) when "100",
			       S_Q(5) when "101",
			       S_Q(6) when "110",
			       S_Q(7) when others;		
		
M4B: Mux4_1 port map(S_Q(4),S_Q(5),S_Q(6),S_Q(7),c(23 downto 22),opC_mux);

M2: soma_sub port map(opA_mux,opB_mux,c(24),N,Z,Cout,ov,OutSoma);

M3: ULA port map(opC_mux,c(25),OutShift);

aux <= OutSoma when c(26) = '0' else OutShift;
DataUla <= aux when c(27) = '0' else opA_mux;

DataOut <= opC_mux;

R0 <=S_Q(0);
R1 <=S_Q(1);
R2 <=S_Q(2);
R3 <=S_Q(3);
R4 <=S_Q(4);
R5 <=S_Q(5);
R6 <=S_Q(6);
R7 <=S_Q(7);

end arq;

