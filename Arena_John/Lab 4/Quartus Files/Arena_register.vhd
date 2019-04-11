-- -- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_register.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_register is
	port(
		Arena_R : in std_logic_vector(31 downto 0);
		Arena_Q : out std_logic_vector(31 downto 0);
		Arena_clk : in std_logic
		);
end Arena_register;

architecture Arena_register_arch of Arena_register is
	signal Arena_rData : std_logic_vector(31 downto 0);
	begin
		Arena_rData <= Arena_R when (Arena_clk = '1') else Arena_rData;
		Arena_Q <= Arena_rData;
end Arena_register_arch;