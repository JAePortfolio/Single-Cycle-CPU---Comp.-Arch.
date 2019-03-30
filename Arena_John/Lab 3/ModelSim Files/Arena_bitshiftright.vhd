--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitshiftright is
  port(
    Arena_a_bsrIN: in std_logic_vector(4 downto 0); -- Bit shift right in 
    Arena_result_bsrOUT: out std_logic_vector(4 downto 0); -- Bit shift right out
	 Arena_bsrSelect: in std_logic
  );
end Arena_bitshiftright;

architecture Arena_bitshiftright_arch of Arena_bitshiftright is
begin
process(Arena_bsrSelect)
	begin
		if(Arena_bsrSelect = '1') then
			Arena_result_bsrOUT <= to_stdlogicvector(to_bitvector(Arena_a_bsrIN) srl 1);
		else 
			null;
		end if;
end process;
end Arena_bitshiftright_arch;
