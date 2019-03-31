--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitrotationright is
  port(
    Arena_a_brrIN: in std_logic_vector(5 downto 0); -- Bit rotation right in
    Arena_result_brrOUT: out std_logic_vector(5 downto 0); -- Bit rotation out
	 Arena_brrSelect: in std_logic
  );
end Arena_bitrotationright;

architecture Arena_bitrotationright_arch of Arena_bitrotationright is
begin
	process(Arena_brrSelect)
		begin
			if(Arena_brrSelect = '1') then
				Arena_result_brrOUT <= to_stdlogicvector(to_bitvector(Arena_a_brrIN) ror 1);
			else 
				null;
			end if;
	end process;
end Arena_bitrotationright_arch;
