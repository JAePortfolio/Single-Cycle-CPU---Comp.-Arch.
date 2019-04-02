-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitrotationleft.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitrotationleft is
  port(
    Arena_a_brlIN: in std_logic_vector(5 downto 0); -- Bit rotation left in
	 Arena_b_rlamt_brlIN: in std_logic_vector(5 downto 0); -- Bit rotation left amount IN
    Arena_result_brlOUT: out std_logic_vector(5 downto 0); -- Bit rotation out
	 Arena_brlSelect: in std_logic
  );
end Arena_bitrotationleft;

architecture Arena_bitrotationleft_arch of Arena_bitrotationleft is
signal Arena_b_rlamt_integer : integer; -- Rotate Left integer value declaration

begin
Arena_b_rlamt_integer <= to_integer(unsigned(Arena_b_rlamt_brlIN)); -- Assign value
	process(Arena_brlSelect)
		begin
			if(Arena_brlSelect = '1') then
				Arena_result_brlOUT <= to_stdlogicvector(to_bitvector(Arena_a_brlIN) rol Arena_b_rlamt_integer); -- Rotate left by amount
			else
				null;
			end if;
	end process;
end Arena_bitrotationleft_arch;
