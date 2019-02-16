-- Arena_HalfAdder.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_HalfAdder is 
	Port(
		Arena_X, Arena_Y: in std_logic;
		Arena_Sum, Arena_CarryOut: out std_logic
	);
end Arena_HalfAdder;

Architecture Arena_Arch_HalfAdder of Arena_HalfAdder is
begin
	Arena_Sum <= (Arena_X xor Arena_Y);
	Arena_CarryOut <= (Arena_X and Arena_Y);
end Arena_Arch_HalfAdder; 