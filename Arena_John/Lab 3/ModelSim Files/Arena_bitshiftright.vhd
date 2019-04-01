-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 - Due 3/30/19
-- Arena_bitwisenot.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitshiftright is
  port(
    Arena_a_bsrIN: in std_logic_vector(5 downto 0); -- Bit shift right in 
	 Arena_b_sramt_bsrIN: in std_logic_vector(5 downto 0); -- Bit shift right amount
    Arena_result_bsrOUT: out std_logic_vector(5 downto 0); -- Bit shift right out
	 Arena_bsrSelect: in std_logic
  );
end Arena_bitshiftright;

architecture Arena_bitshiftright_arch of Arena_bitshiftright is
signal Arena_b_sramt_integer : integer;--Declare and assign value

begin
Arena_b_sramt_integer <= to_integer(unsigned(Arena_b_sramt_bsrIN)); -- Assign value
process(Arena_bsrSelect)
	begin
		if(Arena_bsrSelect = '1') then
			Arena_result_bsrOUT <= to_stdlogicvector(to_bitvector(Arena_a_bsrIN) srl Arena_b_sramt_integer);
		else 
			null;
		end if;
end process;
end Arena_bitshiftright_arch;
