-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitwiseOperation_decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseOperation_decoder is
	port(
		Arena_buttonStart: in std_logic;
		Arena_opcode: in std_logic_vector(2 downto 0); -- 3 inputs
		Arena_opSelect: out std_logic_vector(7 downto 0) -- 8 outputs
	);
end Arena_bitwiseOperation_decoder;

architecture Arena_bitwiseOperation_decoder_arch of Arena_bitwiseOperation_decoder is -- Architecture

begin
process(Arena_buttonStart, Arena_opcode)
	begin
		if(Arena_buttonStart = '1') then 
				Arena_opSelect <= "00000000" when (Arena_opcode = "000")-- Op 0
										else "00000010" when (Arena_opcode = "001")-- Op 1
										else "00000100" when (Arena_opcode = "001")-- Op 2
										else "00001000" when (Arena_opcode = "001")-- Op 3
										else "00010000" when (Arena_opcode = "001")-- Op 4
										else "00100000" when (Arena_opcode = "001")-- Op 5
										else "01000000" when (Arena_opcode = "001")-- Op 6
										else "10000000" when (Arena_opcode = "001")-- Op 7
										else "11111111";
		else 
			null;
		end if;
end process;
end Arena_bitwiseOperation_decoder_arch;