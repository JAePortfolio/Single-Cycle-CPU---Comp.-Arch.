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
	signal Arena_Sum1, Arena_CarryOut1, Arena_CarryOut2 : std_logic; --Variables for mapping

	component Arena_HalfAdder -- Using Half Adder component 
	port(
		Arena_X, Arena_Y : in std_logic;
		Arena_Sum, Arena_CarryOut : out std_logic
		);
end component;

begin

	HA1: Arena_HalfAdder port map (Arena_X, Arena_Y, Arena_Sum1, Arena_CarryOut1);
	-- X into X, Y into Y, Sum1 out of Sum1, Co1 out of Co1
	HA2: Arena_HalfAdder port map(Arena_Sum1, Arena_CarryIn, Arena_Sum, Arena_CarryOut2);
   -- Sum1 into X, Ci into Y, Sum out as final Sum, CarryOut2 out of CarryOut2
	
	Arena_CarryOut <= Arena_CarryOut1 or Arena_CarryOut2; -- Final CarryOut 
	--Sum is already final, don't need a statement
end Arena_Arch_FullAdder; -- end of architecture
	