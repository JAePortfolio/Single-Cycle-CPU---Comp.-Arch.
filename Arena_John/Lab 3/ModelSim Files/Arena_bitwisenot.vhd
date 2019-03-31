--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwisenot is
  port(
    Arena_a_notIN: in std_logic_vector(5 downto 0);
    Arena_result_notOUT: out std_logic_vector (5 downto 0);
	 Arena_notSelect: in std_logic
);
end Arena_bitwisenot;

architecture Arena_bitwisenot_arch of Arena_bitwisenot is
begin
	process(Arena_notSelect)
		begin
			if (Arena_notSelect = '1') then
				Arena_result_notOUT <= NOT Arena_a_notIN;
			else
				null;
			end if;
	end process;
end Arena_bitwisenot_arch;

