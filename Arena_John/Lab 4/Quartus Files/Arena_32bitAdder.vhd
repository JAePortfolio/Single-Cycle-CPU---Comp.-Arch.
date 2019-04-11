-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bitAdder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitAdder is
port(
	Arena_A_32bit, Arena_B_32bit, Arena_Cin_32bit : in std_logic_vector(3 downto 0);
	Arena_Sum_32bit : out std_logic_vector(3 downto 0);
	Arena_Cout_32bit : out std_logic;
	);
end Arena_32bitAdder;

architecture Arena_32bitAdder_arch of Arena_32bitAdder is 
	component Arena_32bitAdder_comp -- Component
		port(
			Arena_A_1bit, Arena_B_1bit, Arena_Cin_1bit : in std_logic;
			Arena_Sum_1bit, Arena_Cout_1bit : out std_logic
		);
	end component;
	signal Arena_c1, Arena_c2, Arena_c3 : std_logic;
	begin 
		FA1: Arena_32bitAdder_comp port map (Arena_A_32bit(0), Arena_B_32bit(0), Arena_Cin_32bit, Arena_Sum_32bit(0), Arena_c1);
		FA2: Arena_32bitAdder_comp port map (Arena_A_32bit(1), Arena_B_32bit(1), Arena_c1, Arena_Sum_32bit(1), Arena_c2);
		FA3: Arena_32bitAdder_comp port map (Arena_A_32bit(2), Arena_B_32bit(2), Arena_c2, Arena_Sum_32bit(2), Arena_c3);
		FA4: Arena_32bitAdder_comp port map (Arena_A_32bit(3), Arena_B_32bit(3), Arena_c3, Arena_Sum_32bit(3), Arena_Cout_1bit);
end Arena_32bitAdder_arch;