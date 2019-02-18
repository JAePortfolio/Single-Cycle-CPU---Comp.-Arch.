--Arena_Lab1Part1.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_Lab1Part1 is 
	port(
		Arena_A, Arena_B: in std_logic;
		Arena_F: out std_logic
		);
end Arena_Lab1Part1;

architecture Arena_Arch_Lab1Part1 of Arena_Lab1Part1 is
begin
	Arena_F <= ((not Arena_A) or (Arena_A and Arena_B));
end Arena_Arch_Lab1Part1;	