-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_ProgramCounter_32bit.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_ProgramCounter_32bit is
	port(
		Arena_button: in std_logic;
		Arena_octalBits: in std_logic_vector(7 downto 0);
		Arena_octalOpcode : in std_logic_vector(1 downto 0); -- Selects which 7 bit number to input
		Arena_32bitOutput : out std_logic_vector(31 downto 0)
		);
end Arena_ProgramCounter_32bit;

architecture Arena_ProgramCounter_32bit_arch of Arena_ProgramCounter_32bit is
begin 
process(Arena_button)
	begin
		if(falling_edge(Arena_button)) then
			if(Arena_octalOpcode = "00") then
				Arena_32bitOutput(7 downto 0) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "01") then
				Arena_32bitOutput(15 downto 8) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "10") then
				Arena_32bitOutput(23 downto 16) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "11") then
				Arena_32bitOutput(31 downto 24) <= Arena_octalBits;
			else
				null;
			end if;
		else
			null;
		end if;
	end process;
end Arena_ProgramCounter_32bit_arch;