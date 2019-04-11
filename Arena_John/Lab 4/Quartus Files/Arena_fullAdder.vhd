-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_fullAdder.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_fullAdder is 
	port(
		Arena_A_fa, Arena_B_fa, Arena_Cin_fa : in std_logic;
		Arena_Sum_fa, Arena_Cout_fa : out std_logic
	);
end Arena_fullAdder;

architecture Arena_fullAdder_arch of Arena_fullAdder is

begin
	Arena_Sum_fa <= Arena_A_fa xor Arena_B_fa xor Arena_Cin_fa ;
	Arena_Cout_fa <= (Arena_A_fa and Arena_B_fa) or (Arena_Cin_fa and Arena_A_fa) or (Arena_Cin_fa and Arena_B_fa);
end Arena_fullAdder_arch;