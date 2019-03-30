--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitshiftleft is
  port(
    Arena_a_bslIN: in std_logic_vector(4 downto 0); -- Bit shift left 
    Arena_result_bslOUT: out std_logic_vector(4 downto 0); -- Bit shift left out
	 Arena_bslSelect: in std_logic
  );
end Arena_bitshiftleft;

architecture Arena_bitshiftleft_arch of Arena_bitshiftleft is
begin
	process(Arena_bslSelect)
		begin
			if (Arena_bslSelect = '1') then
				Arena_result_bslOUT <= to_stdlogicvector(to_bitvector(Arena_a_bslIN) sll 1);
			else 
				null;
			end if;
	end process;
end Arena_bitshiftleft_arch;