-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_Shift_Left_32bit.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_Shift_Left_32bit is
	port(
		Arena_32bit_IMMEDIATE_IN: in std_logic_vector(31 downto 0); -- 32bit immediate
		Arena_32bit_IMMEDIATE_OUT: out std_logic_vector(31 downto 0) -- 32bit immediate
		);
end Arena_Shift_Left_32bit;

architecture Arena_Shift_Left_32bit_arch of Arena_Shift_Left_32bit is
begin
	Arena_32bit_IMMEDIATE_OUT <= std_logic_vector((signed(Arena_32bit_IMMEDIATE_IN) sll 2));
end Arena_Shift_Left_32bit_arch;