-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitwiseOperation_decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseOperation_decoder is
	port(
		Arena_buttonStart: in std_logic;
		Arena_opcode: in std_logic_vector(3 downto 0); -- 4 inputs
		Arena_opSelect: out std_logic_vector(15 downto 0) -- 16 outputs
	);
end Arena_bitwiseOperation_decoder;

architecture Arena_bitwiseOperation_decoder_arch of Arena_bitwiseOperation_decoder is -- Architecture

begin
process(Arena_buttonStart, Arena_opcode)
	begin
		if(Arena_buttonStart = '1') then 
--				Arena_opSelect <= "00000000" when (Arena_opcode = "000")-- Op 0
--										else "00000010" when (Arena_opcode = "001")-- Op 1
--										else "00000100" when (Arena_opcode = "001")-- Op 2
--										else "00001000" when (Arena_opcode = "001")-- Op 3
--										else "00010000" when (Arena_opcode = "001")-- Op 4
--										else "00100000" when (Arena_opcode = "001")-- Op 5
--										else "01000000" when (Arena_opcode = "001")-- Op 6
--										else "10000000" when (Arena_opcode = "001")-- Op 7
--										else "11111111";
				case Arena_opcode is
					when "0000" =>
					Arena_opSelect <= "0000000000000001";
					when "0001" =>
					Arena_opSelect <= "0000000000000010";
					when "0010" =>
					Arena_opSelect <= "0000000000000100";
					when "0011" =>
					Arena_opSelect <= "0000000000001000";
					when "0100" =>
					Arena_opSelect <= "0000000000010000";
					when "0101" =>
					Arena_opSelect <= "0000000000100000";
					when "0110" =>
					Arena_opSelect <= "0000000001000000";
					when "0111" =>
					Arena_opSelect <= "0000000010000000";
					when "1000" =>
					Arena_opSelect <= "0000000100000000";
					when "1001" =>
					Arena_opSelect <= "0000001000000000";
					when others =>
					Arena_opSelect <= "1111111111111111";
				end case;
		else 
			null;
		end if;
end process;
end Arena_bitwiseOperation_decoder_arch;