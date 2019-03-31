--John Arena
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitrotationright is
  port(
    Arena_a_brrIN: in std_logic_vector(5 downto 0); -- Bit rotation right in
	 Arena_b_shamt_brrIN: in std_logic_vector(5 downto 0); -- Bit rotation right amount IN
    Arena_result_brrOUT: out std_logic_vector(5 downto 0); -- Bit rotation out
	 Arena_b_shamt_integer: buffer integer;
	 Arena_brrSelect: in std_logic
  );
end Arena_bitrotationright;

architecture Arena_bitrotationright_arch of Arena_bitrotationright is
begin
Arena_b_shamt_integer <= to_integer(unsigned(Arena_b_shamt_brrIN));
	process(Arena_brrSelect)
		begin
			if(Arena_brrSelect = '1') then
				for I in 0 to Arena_b_shamt_integer loop
					Arena_result_brrOUT <= to_stdlogicvector(to_bitvector(Arena_a_brrIN) ror 1);
				end loop;
			else 
				null;
			end if;
	end process;
end Arena_bitrotationright_arch;
