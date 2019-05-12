-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_Sign_Extend_16to32.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_Sign_Extend_16to32 is
	port(
		Arena_16bit_IMMEDIATE_IN: in std_logic_vector(15 downto 0); -- 16bit immediate
		Arena_32bit_IMMEDIATE_OUT: out std_logic_vector(31 downto 0) -- 32bit immediate
		);
end Arena_Sign_Extend_16to32;

architecture Arena_Sign_Extend_16to32_arch of Arena_Sign_Extend_16to32 is
begin
	Arena_32bit_IMMEDIATE_OUT <= std_logic_vector(resize(signed(Arena_16bit_IMMEDIATE_IN),32));
end Arena_Sign_Extend_16to32_arch;