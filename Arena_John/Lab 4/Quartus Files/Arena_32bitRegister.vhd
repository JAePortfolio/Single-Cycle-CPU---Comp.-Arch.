-- -- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bitRegister.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitRegister is
	port(
		Arena_R : in std_logic_vector(31 downto 0);
		Arena_Q : out std_logic_vector(31 downto 0);
		Arena_clk : in std_logic
		);
end Arena_32bitRegister;

architecture Arena_32bitRegister_arch of Arena_32bitRegister is
	signal Arena_rData : std_logic_vector(31 downto 0);
	begin
		Arena_rData <= Arena_R when (Arena_clk = '1') else Arena_rData;
		Arena_Q <= Arena_rData;
end Arena_32bitRegister_arch;