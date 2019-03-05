-- (First, Last) John Arena - CSC 342/343 - Lab 2 - Spring 2019 Due: 3/6/19
-- Arena_4to16Decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_4to16Decoder is
	port(
		Arena_In: in std_logic_vector(3 downto 0); -- 4 inputs
		Arena_Dec: out std_logic_vector(15 downto 0) -- 16 outputs
		);
end Arena_4to16Decoder;

architecture Arena_Arch_4to16Decoder of Arena_4to16Decoder is -- Architecture to describe functionalitty

begin

with Arena_In select
	Arena_Dec <= "0000000000000001" when "0000", -- F0
					 "0000000000000010" when "0001", -- F1...
					 "0000000000000100" when "0010",
					 "0000000000001000" when "0011",
					 "0000000000010000" when "0100",
					 "0000000000100000" when "0101",
					 "0000000001000000" when "0110",
					 "0000000010000000" when "0111",
					 "0000000100000000" when "1000",
					 "0000001000000000" when "1001",
					 "0000010000000000" when "1010",
					 "0000100000000000" when "1011",
					 "0001000000000000" when "1100",
					 "0010000000000000" when "1101",
					 "0100000000000000" when "1110",
					 "1000000000000000" when "1111", --...F15
					 "0000000000000000" when others; 
end Arena_Arch_4to16Decoder;