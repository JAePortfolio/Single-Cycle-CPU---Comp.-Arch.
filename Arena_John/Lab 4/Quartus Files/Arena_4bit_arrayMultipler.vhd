-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_4bit_arrayMultipler.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_4bit_arrayMultipler is 
	port(
		Arena_4bitIN_A, Arena_4bitIN_B: in std_logic_vector(3 downto 0);
		Arena_4bitOUT: out std_logic_vector(7 downto 0)
	);
end Arena_4bit_arrayMultipler;

architecture Arena_4bit_arrayMultipler_arch of Arena_4bit_arrayMultipler is
signal Arena_andGate : std_logic_vector(15 downto 0);
signal Arena_Cout_vec : std_logic_vector(11 downto 0);
signal Arena_Sum_vec : std_logic_vector (11 downto 0);

	component Arena_fullAdder -- Using Full Adder Component
	port(
		Arena_A_fa, Arena_B_fa, Arena_Cin_fa: in std_logic;
		Arena_Sum_fa, Arena_Cout_fa : out std_logic
		);
	end component;
	
begin
	Arena_andGate(0) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(0);
	Arena_andGate(1) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(0);
	Arena_andGate(2) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(0);
	Arena_andGate(3) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(0);
	Arena_andGate(4) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(1);
	Arena_andGate(5) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(1);
	Arena_andGate(6) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(1);
	Arena_andGate(7) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(1);
	-- Full Adders 0-3 (comp -> signal)
	FA0: Arena_fullAdder port map(Arena_A_fa => Arena_andGate(1), Arena_B_fa => Arena_andGate(4),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(0), Arena_Cout_fa => Arena_Cout_vec(0));
	
	FA1: Arena_fullAdder port map(Arena_A_fa => Arena_andGate(2), Arena_B_fa => Arena_andGate(5),
	Arena_Cin_fa => Arena_Cout_vec(0), Arena_Sum_fa => Arena_Sum_vec(1), Arena_Cout_fa => Arena_Cout_vec(1));
	
	FA2: Arena_fullAdder port map(Arena_A_fa => Arena_andGate(3), Arena_B_fa => Arena_andGate(6),
	Arena_Cin_fa => Arena_Cout_vec(1), Arena_Sum_fa => Arena_Sum_vec(2), Arena_Cout_fa => Arena_Cout_vec(2));
	
	FA3: Arena_fullAdder port map(Arena_A_fa => '0', Arena_B_fa => Arena_andGate(7),
	Arena_Cin_fa => Arena_Cout_vec(2), Arena_Sum_fa => Arena_Sum_vec(3), Arena_Cout_fa => Arena_Cout_vec(3));

	-- Full Adders 4-7 (comp -> signal)
	Arena_andGate(8) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(2);
	Arena_andGate(9) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(2);
	Arena_andGate(10) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(2);
	Arena_andGate(11) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(2);

	FA4: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(1), Arena_B_fa => Arena_andGate(8),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(4), Arena_Cout_fa => Arena_Cout_vec(4));
	
	FA5: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(2), Arena_B_fa => Arena_andGate(9),
	Arena_Cin_fa => Arena_Cout_vec(4), Arena_Sum_fa => Arena_Sum_vec(5), Arena_Cout_fa => Arena_Cout_vec(5));
	
	FA6: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(3), Arena_B_fa => Arena_andGate(10),
	Arena_Cin_fa => Arena_Cout_vec(5), Arena_Sum_fa => Arena_Sum_vec(6), Arena_Cout_fa => Arena_Cout_vec(6));
	
	FA7: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(3), Arena_B_fa => Arena_andGate(11),
	Arena_Cin_fa => Arena_Cout_vec(6), Arena_Sum_fa => Arena_Sum_vec(7), Arena_Cout_fa => Arena_Cout_vec(7));
	
	-- Full Adders 8-11 (comp -> signal)
	Arena_andGate(12) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(3);
	Arena_andGate(13) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(3);
	Arena_andGate(14) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(3);
	Arena_andGate(15) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(3);

	FA8: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(5), Arena_B_fa => Arena_andGate(12),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(8), Arena_Cout_fa => Arena_Cout_vec(8));
	
	FA9: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(6), Arena_B_fa => Arena_andGate(13),
	Arena_Cin_fa => Arena_Cout_vec(8), Arena_Sum_fa => Arena_Sum_vec(9), Arena_Cout_fa => Arena_Cout_vec(9));
	
	FA10: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(7), Arena_B_fa => Arena_andGate(14),
	Arena_Cin_fa => Arena_Cout_vec(9), Arena_Sum_fa => Arena_Sum_vec(10), Arena_Cout_fa => Arena_Cout_vec(10));
	
	FA11: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(7), Arena_B_fa => Arena_andGate(15),
	Arena_Cin_fa => Arena_Cout_vec(10), Arena_Sum_fa => Arena_Sum_vec(11), Arena_Cout_fa => Arena_Cout_vec(11));
	
	-- Result
	Arena_4bitOUT(0) <= Arena_andGate(0);
	Arena_4bitOUT(1) <= Arena_Sum_vec(0);
	Arena_4bitOUT(2) <= Arena_Sum_vec(4);
	Arena_4bitOUT(3) <= Arena_Sum_vec(8);
	Arena_4bitOUT(4) <= Arena_Sum_vec(9);
	Arena_4bitOUT(5) <= Arena_Sum_vec(10);
	Arena_4bitOUT(6) <= Arena_Sum_vec(11);
	Arena_4bitOUT(7) <= Arena_Cout_vec(11);
	
end Arena_4bit_arrayMultipler_arch;