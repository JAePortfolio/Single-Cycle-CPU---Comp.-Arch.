-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_ledReset.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_ledReset is
	port(
		Arena_button: in std_logic;
		Arena_ledOUT: out std_logic_vector(5 downto 0) -- 8 outputs
	);
end Arena_ledReset;

architecture Arena_ledReset_arch of Arena_ledReset is -- Architecture

begin
	process(Arena_button)
		begin
			if (Arena_button = '0') then
				Arena_ledOUT <= "000000";
			else 
				null;
			end if;
	end process;
end Arena_ledReset_arch;