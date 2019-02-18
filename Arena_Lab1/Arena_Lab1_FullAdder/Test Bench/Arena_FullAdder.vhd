library ieee;
use ieee.std_logic_1164.all;

entity Arena_FullAdder is 
	port(
		Arena_X, Arena_Y, Arena_CarryIn : in std_logic;
		Arena_Sum, Arena_CarryOut : out std_logic
	);
	end Arena_FullAdder;
	
architecture Arena_Arch_FullAdder of Arena_FullAdder is

begin

	Arena_Sum <= Arena_CarryIn xor Arena_X xor Arena_Y;
	Arena_CarryOut <= (Arena_X and Arena_Y) or (Arena_CarryIn and (Arena_X xor Arena_Y));

end Arena_Arch_FullAdder;
	