--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseor is
  port(
    Arena_a_orIN,Arena_b_orIN: in std_logic_vector(5 downto 0);
    Arena_result_orOUT: out std_logic_vector (5 downto 0);
	Arena_xorSelect: in std_logic
);
end Arena_bitwiseor;

architecture Arena_bitwiseor_arch of Arena_bitwiseor is
begin
process(Arena_xorSelect)
	begin
		if (Arena_xorSelect = '1') then
			Arena_result_orOUT <= Arena_a_orIN or Arena_b_orIN;
		else
			null;
		end if;
end process;
end Arena_bitwiseor_arch;