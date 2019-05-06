-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bitInput.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitInput is
	port(
		Arena_button: in std_logic;
		Arena_octalBits: in std_logic_vector(7 downto 0);
		Arena_octalOpcode : in std_logic_vector(1 downto 0); -- Selects which 16 bit number to input
		Arena_32bitOutput : out std_logic_vector(31 downto 0)
		);
end Arena_32bitInput;

architecture Arena_32bitInput_arch of Arena_32bitInput is
begin 
process(Arena_button)
	begin
		if(falling_edge(Arena_button)) then
			if(Arena_octalOpcode = "00") then
				Arena_32bitOutput(7 downto 0) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "01") then
				Arena_32bitOutput(15 downto 8) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "10") then
				Arena_32bitOutput(23 downto 16) <= Arena_octalBits;
			elsif(Arena_octalOpcode = "11") then
				Arena_32bitOutput(31 downto 24) <= Arena_octalBits;
			else
				null;
			end if;
		else
			null;
		end if;
		
	--		
--		if (Arena_button(2) = '0') then -- If button2 pressed, take 3rd set 8 bits of 32-bit number
--            Arena_octet2(0) <= Arena_octalBits(0);
--            Arena_octet2(1) <= Arena_octalBits(1);
--            Arena_octet2(2) <= Arena_octalBits(2);
--            Arena_octet2(3) <= Arena_octalBits(3);
--            Arena_octet2(4) <= Arena_octalBits(4);
--            Arena_octet2(5) <= Arena_octalBits(5);
--            Arena_octet2(6) <= Arena_octalBits(6);
--            Arena_octet2(7) <= Arena_octalBits(7);
--		else 
--			null;
--		end if;
--			
--		if (Arena_button(3) = '0') then -- If button3 pressed, take 4th set of 8 bits of 32-bit number
--            Arena_octet3(0) <= Arena_octalBits(0);
--            Arena_octet3(1) <= Arena_octalBits(1);
--            Arena_octet3(2) <= Arena_octalBits(2);
--            Arena_octet3(3) <= Arena_octalBits(3);
--            Arena_octet3(4) <= Arena_octalBits(4);
--            Arena_octet3(5) <= Arena_octalBits(5);
--            Arena_octet3(6) <= Arena_octalBits(6);
--            Arena_octet3(7) <= Arena_octalBits(7);
--		else 
--			null;
--		end if;
	end process;
end Arena_32bitInput_arch;