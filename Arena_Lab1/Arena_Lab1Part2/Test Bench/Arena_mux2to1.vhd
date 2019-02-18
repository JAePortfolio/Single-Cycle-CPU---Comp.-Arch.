-- Arena_mux2to1.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_mux2to1 is 
	Port(
		Arena_X, Arena_Y, Arena_S: in std_logic;
		Arena_M: out std_logic
	);
end Arena_mux2to1;

Architecture Arena_Arch_mux2to1 of Arena_mux2to1 is
begin
	Arena_M <= Arena_X when (Arena_S = '0') else Arena_Y;
end Arena_Arch_mux2to1;