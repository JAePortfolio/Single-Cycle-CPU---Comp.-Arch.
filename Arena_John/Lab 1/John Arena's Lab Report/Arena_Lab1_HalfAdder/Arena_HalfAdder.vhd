-- (First, Last) John Arena - CSC 342/343 - Lab 1 - Spring 2019 Due: 2/20/19
-- Arena_HalfAdder.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_HalfAdder is 
	Port(
		Arena_X, Arena_Y: in std_logic;	 -- Two Inputs for X and Y
		Arena_Sum, Arena_CarryOut: out std_logic -- Two outputs for the Sum and the CarryOut bit.
	);
end Arena_HalfAdder; -- End of Entity Arena_HalfAdder

Architecture Arena_Arch_HalfAdder of Arena_HalfAdder is -- Architecture of the Entity (Describes functionality)
begin
	process(Arena_X, Arena_Y)
		begin
			Arena_Sum <= (Arena_X xor Arena_Y); -- Sum = X XOR Y
			Arena_CarryOut <= (Arena_X and Arena_Y); -- Carryout = X*Y
	end process;
end Arena_Arch_HalfAdder; -- End of Architecture statement