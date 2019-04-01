--John Arena
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitwise_setLessThanSigned is
  port(
    Arena_a_sltIN: in std_logic_vector(5 downto 0); -- Bit rotation left in
	 Arena_b_sltIN: in std_logic_vector(5 downto 0); -- Bit rotation left amount IN
    Arena_result_sltOUT: out std_logic; -- Bit rotation out
	 Arena_sltSelect: in std_logic
  );
end Arena_bitwise_setLessThanSigned;

architecture Arena_bitwise_setLessThanSigned_arch of Arena_bitwise_setLessThanSigned is
signal Arena_a_sltIN_integer : integer; -- Declaring variables for binary to integer conversion
signal Arena_b_sltIN_integer : integer; -- Declaring variables for binary to integer conversion

begin
Arena_a_sltIN_integer <= to_integer(signed(Arena_a_sltIN)); -- Conversion to integer
Arena_b_sltIN_integer <= to_integer(signed(Arena_b_sltIN)); -- Conversion to integer
	process(Arena_sltSelect, Arena_a_sltIN_integer, Arena_b_sltIN_integer)
		begin
			if(Arena_sltSelect = '1') then
				if(Arena_a_sltIN_integer < Arena_b_sltIN_integer) then -- Check if less than, if true
					Arena_result_sltOUT <= '1'; -- Set output to 1
				else
					Arena_result_sltOUT <= '0'; -- Otherwise set output to 0 if false
				end if;
			else
				null;
			end if;
	end process;
end Arena_bitwise_setLessThanSigned_arch;
