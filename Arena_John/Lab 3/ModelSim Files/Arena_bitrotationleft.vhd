--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitrotationleft is
  port(
    Arena_a_brlIN: in std_logic_vector(4 downto 0); -- Bit rotation left in
    Arena_result_brlOUT: out std_logic_vector(4 downto 0); -- Bit rotation out
	 Arena_brlSelect: in std_logic
  );
end Arena_bitrotationleft;

architecture Arena_bitrotationleft_arch of Arena_bitrotationleft is
begin
	process(Arena_brlSelect)
		begin
			if(Arena_brlSelect = '1') then
				Arena_result_brlOUT <= to_stdlogicvector(to_bitvector(Arena_a_brlIN) rol 1);
			else
				null;
			end if;
	end process;
end Arena_bitrotationleft_arch;
