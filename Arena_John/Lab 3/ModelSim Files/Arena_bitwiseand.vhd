--John Arena
Library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwiseand is
  port(
    Arena_a_andIN,Arena_b_andIN: in std_logic_vector(2 downto 0);
    Arena_result_andOUT: out std_logic_vector (2 downto 0);
	 Arena_andSelect: in std_logic
);
end Arena_bitwiseand;

architecture Arena_bitwiseand_arch of Arena_bitwiseand is
begin
	process(Arena_andSelect)
		begin
			if(Arena_andSelect = '1') then 
				Arena_result_andOUT <= Arena_a_andIN and Arena_b_andIN;
			else 
				null;
			end if;
	end process;
end Arena_bitwiseand_arch;