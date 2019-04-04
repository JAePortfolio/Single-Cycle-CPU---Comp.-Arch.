-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitwise_setLessThanUnsigned.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitwise_setLessThanUnsigned is
  port(
    Arena_a_sltuIN: in std_logic_vector(5 downto 0); -- First input
	 Arena_b_sltuIN: in std_logic_vector(5 downto 0); -- Second input amount IN
    Arena_result_sltuOUT: out std_logic_vector(5 downto 0); -- Bit rotation out
	 -- Even though the output will just be 1 bit, its connected to a mux using 6 bit wide inputs/outputs.
	 -- the other bits will be set to 0 for this. --
	 Arena_sltuSelect: in std_logic
  );
end Arena_bitwise_setLessThanUnsigned;

architecture Arena_bitwise_setLessThanUnsigned_arch of Arena_bitwise_setLessThanUnsigned is
signal Arena_a_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion
signal Arena_b_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion

begin
Arena_a_sltuIN_integer <= to_integer(unsigned(Arena_a_sltuIN)); -- Conversion to integer
Arena_b_sltuIN_integer <= to_integer(unsigned(Arena_b_sltuIN)); -- Conversion to integer
	process(Arena_sltuSelect, Arena_a_sltuIN_integer, Arena_b_sltuIN_integer)
		begin
			if(Arena_sltuSelect = '1') then
				if(Arena_a_sltuIN_integer < Arena_b_sltuIN_integer) then -- Check if less than, if true
					Arena_result_sltuOUT <= "000001"; -- Set output to 1
				else
					Arena_result_sltuOUT <= "000000"; -- Otherwise set output to 0 if false
				end if;
			else
				null;
			end if;
	end process;
end Arena_bitwise_setLessThanUnsigned_arch;
