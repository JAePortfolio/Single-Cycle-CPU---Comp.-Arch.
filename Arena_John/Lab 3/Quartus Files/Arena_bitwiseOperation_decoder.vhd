-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitwiseOperation_decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseOperation_decoder is
	port(
		Arena_opcode: in std_logic_vector(2 downto 0); -- 3 inputs
		Arena_opSelect: out std_logic_vector(7 downto 0) -- 8 outputs
	);
end Arena_bitwiseOperation_decoder;

architecture Arena_bitwiseOperation_decoder_arch of Arena_bitwiseOperation_decoder is -- Architecture

begin

with Arena_opcode select
	Arena_opSelect <= "00000000" when "000", -- Op 0
							"00000010" when "001", -- Op 1
							"00000100" when "010", -- Op 2
							"00001000" when "011", -- Op 3
							"00010000" when "100", -- Op 4
							"00100000" when "101", -- Op 5
							"01000000" when "110", -- Op 6
							"10000000" when "111", -- Op 7
							"00000000" when others;
end Arena_bitwiseOperation_decoder_arch;