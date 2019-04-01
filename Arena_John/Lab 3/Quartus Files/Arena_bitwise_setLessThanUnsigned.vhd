--John Arena
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitwise_setLessThanUnsigned is
  port(
    Arena_a_sltuIN: in std_logic_vector(5 downto 0); -- Bit rotation left in
	 Arena_b_sltuIN: in std_logic_vector(5 downto 0); -- Bit rotation left amount IN
    Arena_result_sltuOUT: out std_logic; -- Bit rotation out
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
					Arena_result_sltuOUT <= '1'; -- Set output to 1
				else
					Arena_result_sltuOUT <= '0'; -- Otherwise set output to 0 if false
				end if;
			else
				null;
			end if;
	end process;
end Arena_bitwise_setLessThanUnsigned_arch;
