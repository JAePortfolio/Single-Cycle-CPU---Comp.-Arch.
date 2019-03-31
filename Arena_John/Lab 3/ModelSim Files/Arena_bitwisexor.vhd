--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwisexor is
  port(
    Arena_a_xorIN,Arena_b_xorIN: in std_logic_vector(5 downto 0);
    Arena_result_xorOUT: out std_logic_vector (5 downto 0);
	 Arena_orSelect: in std_logic
	 );
end Arena_bitwisexor;

architecture Arena_bitwisexor_arch of Arena_bitwisexor is
begin
	process(Arena_orSelect)
		begin
			if (Arena_orSelect = '1') then
				Arena_result_xorOUT <= Arena_a_xorIN xor Arena_b_xorIN;
			else 
				null;
			end if;
	end process;
end Arena_bitwisexor_arch;
