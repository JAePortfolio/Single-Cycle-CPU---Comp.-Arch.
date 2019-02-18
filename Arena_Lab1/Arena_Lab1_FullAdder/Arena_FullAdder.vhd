-- (First, Last) John Arena - CSC 342/343 - Lab 1 - Spring 2019 Due: 2/20/19
-- Arena_FullAdder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_FullAdder is 
	port(
		Arena_X, Arena_Y, Arena_CarryIn : in std_logic; -- Three inputs, X, Y and CarryIn
		Arena_Sum, Arena_CarryOut : out std_logic -- Two outputs, Sum and CarryOut
	);
	end Arena_FullAdder; -- End of entity
	
architecture Arena_Arch_FullAdder of Arena_FullAdder is -- Architecture describing functionality

begin

	Arena_Sum <= Arena_CarryIn xor Arena_X xor Arena_Y; -- Sum = Ci xor (X xor Y)
	Arena_CarryOut <= (Arena_X and Arena_Y) or (Arena_CarryIn and (Arena_X xor Arena_Y)); -- Co (XY) or (Ci(X xorY))

end Arena_Arch_FullAdder; -- end of architecture
	