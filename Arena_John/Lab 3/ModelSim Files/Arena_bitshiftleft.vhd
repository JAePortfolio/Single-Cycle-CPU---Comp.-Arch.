-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 - Due 3/30/19
-- Arena_bitshiftleft.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitshiftleft is
  port(
    Arena_a_bslIN: in std_logic_vector(5 downto 0); -- Bit shift left 
	 Arena_b_slamt_bslIN: in std_logic_vector(5 downto 0); -- Bit shift left amount
    Arena_result_bslOUT: out std_logic_vector(5 downto 0); -- Bit shift left out
	 Arena_bslSelect: in std_logic
  );
end Arena_bitshiftleft;

architecture Arena_bitshiftleft_arch of Arena_bitshiftleft is
signal Arena_b_slamt_integer : integer; -- Shift Left integer value declaration

begin
Arena_b_slamt_integer <= to_integer(unsigned(Arena_b_slamt_bslIN)); -- Assign value
	process(Arena_bslSelect)
		begin
			if (Arena_bslSelect = '1') then
				Arena_result_bslOUT <= to_stdlogicvector(to_bitvector(Arena_a_bslIN) sll Arena_b_slamt_integer); -- Shift left by amounnt
			else 
				null;
			end if;
	end process;
end Arena_bitshiftleft_arch;