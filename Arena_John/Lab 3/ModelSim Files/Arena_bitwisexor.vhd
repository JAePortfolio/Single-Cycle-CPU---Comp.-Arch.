-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 - Due 3/30/19
-- Arena_bitwisexor.vhd
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwisexor is
  port(
    Arena_a_xorIN,Arena_b_xorIN: in std_logic_vector(5 downto 0);
    Arena_result_xorOUT: out std_logic_vector (5 downto 0);
	 Arena_xorSelect: in std_logic
	 );
end Arena_bitwisexor;

architecture Arena_bitwisexor_arch of Arena_bitwisexor is
begin
	process(Arena_xorSelect)
		begin
			if (Arena_xorSelect = '1') then
				Arena_result_xorOUT <= Arena_a_xorIN xor Arena_b_xorIN;
			else 
				null;
			end if;
	end process;
end Arena_bitwisexor_arch;
