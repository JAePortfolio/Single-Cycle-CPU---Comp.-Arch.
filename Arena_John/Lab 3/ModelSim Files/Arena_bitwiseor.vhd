-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 - Due 3/30/19
-- Arena_bitwiseor.vhd
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseor is
  port(
    Arena_a_orIN,Arena_b_orIN: in std_logic_vector(5 downto 0);
    Arena_result_orOUT: out std_logic_vector (5 downto 0);
	Arena_orSelect: in std_logic
);
end Arena_bitwiseor;

architecture Arena_bitwiseor_arch of Arena_bitwiseor is
begin
process(Arena_orSelect)
	begin
		if (Arena_orSelect = '1') then
			Arena_result_orOUT <= Arena_a_orIN or Arena_b_orIN;
		else
			null;
		end if;
end process;
end Arena_bitwiseor_arch;