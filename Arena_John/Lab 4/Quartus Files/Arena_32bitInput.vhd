-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bitInput.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitInput is 
	port(
		Arena_A_In, Arena_B_In : in std_logic_vector(15 downto 0);
		Arena_A_out, Arena_B_out : out std_logic_vector(15 downto 0);
		Arena_buttonSelect_one, Arena_buttonSelect_two: in std_logic
	);
end Arena_32bitInput;

architecture Arena_32bitInput_arch of Arena_32bitInput is
begin
	process(Arena_buttonSelect_one, Arena_buttonSelect_two)
		begin
			if(Arena_buttonSelect_one = '0') then
				Arena_A_out <= Arena_A_In;
			else 
				null;
			end if;
			
			if(Arena_buttonSelect_two = '0') then
				Arena_B_out <= Arena_B_In;
			else
				null;
			end if;
	end process;
end Arena_32bitInput_arch;