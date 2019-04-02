-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitrotationright.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitrotationright is
  port(
    Arena_a_brrIN: in std_logic_vector(5 downto 0); -- Bit rotation right in
	 Arena_b_rramt_brrIN: in std_logic_vector(5 downto 0); -- Bit rotation right amount IN
    Arena_result_brrOUT: out std_logic_vector(5 downto 0); -- Bit rotation out
	 --Arena_b_shamt_integer: buffer integer;
	 Arena_brrSelect: in std_logic
  );
end Arena_bitrotationright;

architecture Arena_bitrotationright_arch of Arena_bitrotationright is
signal Arena_b_rramt_integer : integer; -- Rotate Right integer value declaration
begin
Arena_b_rramt_integer <= to_integer(unsigned(Arena_b_rramt_brrIN)); -- Assign value
	process(Arena_brrSelect)
		begin
			if(Arena_brrSelect = '1') then
				Arena_result_brrOUT <= to_stdlogicvector(to_bitvector(Arena_a_brrIN) ror Arena_b_rramt_integer); -- Rotate by amount
			else 
				null;
			end if;
	end process;
end Arena_bitrotationright_arch;
