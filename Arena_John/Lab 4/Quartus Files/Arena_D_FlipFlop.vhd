-- -- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_D_FlipFlop.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_D_FlipFlop is
	port(
		Arena_D : in std_logic;
		Arena_Q : out std_logic;
		Arena_clk : in std_logic
		);
end Arena_D_FlipFlop;

architecture Arena_D_FlipFlop_arch of Arena_D_FlipFlop is
	signal Arena_data : std_logic;
	begin
		Arena_data <= Arena_D when (Arena_clk = '1') else Arena_data;
		Arena_Q <= Arena_data;
end Arena_D_FlipFlop_arch;