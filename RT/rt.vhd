Library IEEE;
USE IEEE.std_logic_1164.all;

Entity RT is
Port(
	DataIn : in std_logic_vector(7 downto 0);
	clk,reset : in std_logic;
	N,Z,cout,ov : out std_logic;
	DataOut,R0,R1,R2,R3,R4,R5,R6,R7 : out std_logic_vector(7 downto 0)
);
end RT;

architecture arq of RT is

component datapath is
Port(
	DataIn : in std_logic_vector(7 downto 0);
	C : in std_logic_vector(27 downto 0);
	clk,reset : in std_logic;
	N,Z,cout,ov : out std_logic;
	DataOut,R0,R1,R2,R3,R4,R5,R6,R7 : out std_logic_vector(7 downto 0)
);
end component;

type t_state is (Sreset,S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10);
signal estado_atual, prox_estado : t_state; 
signal C : std_logic_vector(27 downto 0);


begin

P1: process(clk,reset)
begin
   if reset = '1' then
	   estado_atual <= Sreset;
		
	elsif clk'event and clk = '1' then
	   estado_atual <= prox_estado;
	end if;
end process;

P2: process(estado_atual,reset)
begin
  case estado_atual is
      when Sreset => if reset = '1' then
		                  prox_estado <= Sreset;
							else
							   prox_estado <= S0;
							end if;
			  
		when S0 => --R0=dataIn
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000001";--load
			  C(18 downto 16) <= "000"; -- OpA
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S1;
			  
		when S1 => --R1=dataIn
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000010";--load
			  C(18 downto 16) <= "000"; -- OpA
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S2;
		
		when S2 => --R2=dataIn
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000100";--load
			  C(18 downto 16) <= "000"; -- OpA
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S3;
			  
		when S3 => --R3=dataIn
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00001000";--load
			  C(18 downto 16) <= "000"; -- OpA
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S4;
			  
		when S4 => --R3=R0 AND R3
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00001000";--load
			  C(18 downto 16) <= "000"; -- OpA=R0
			  C(21 downto 19) <= "011"; -- OpB=R3
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S6;
			  
		when S5 => --R0=R0-1
		     C(7 downto 0)  <= "00000001";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000001";--load
			  C(18 downto 16) <= "000"; -- OpA=R0
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '1'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '1'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S7;
			  
		when S6 => --R0=R0+1
		     C(7 downto 0)  <= "00000001";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000001";--load
			  C(18 downto 16) <= "000"; -- OpA=R0
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '1'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S7;
			  
		when S7 => --R0=R0+1
		     C(7 downto 0)  <= "00000001";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000001";--load
			  C(18 downto 16) <= "000"; -- OpA=R0
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '1'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S8;
		
		when S8 => --R1=R1+R0
		     C(7 downto 0)  <= "00000010";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000010";--load
			  C(18 downto 16) <= "001"; -- OpA=R1
			  C(21 downto 19) <= "000"; -- OpB=R0
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '1'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S10;
		
		when S9 => --R2=R2+1
		     C(7 downto 0)  <= "00000100";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00000100";--load
			  C(18 downto 16) <= "010"; -- OpA=R2
			  C(21 downto 19) <= "000"; -- OpB=R0
			  C(23 downto 22) <= "00"; -- OpC
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '1'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S10;
		
		when S10 => --R4=R1
		     C(7 downto 0)  <= "00000000";--Mux2:1 0-DataIn  1-Data_Ula
			  C(15 downto 8) <= "00010000";--load
			  C(18 downto 16) <= "001"; -- OpA=R1
			  C(21 downto 19) <= "000"; -- OpB
			  C(23 downto 22) <= "00"; -- OpC/DataOut=R4
			  C(24) <= '0'; -- 0- soma  1-subtrai
			  C(25) <= '0'; -- 0- SLL  1-SRL
			  C(26) <= '0'; -- 0- Soma/Sub  1-Shifter
			  C(27) <= '0'; -- 0- DataUla  1-OpA
			  prox_estado <= S0;
		
  end case;
		
end process;

DP: datapath port map(DataIn,
                      C,
							 clk,
							 reset,
							 N,
							 Z,
							 cout,
							 ov,
							 DataOut,
							 R0,
							 R1,
							 R2,
							 R3,
							 R4,
							 R5,
							 R6,
							 R7);

end arq;