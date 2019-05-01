library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitInput is
	port(
		Arena_button: in std_logic_vector(1 downto 0);
		Arena_octalBits: in std_logic_vector(15 downto 0);
		Arena_octet0: buffer std_logic_vector(15 downto 0);
		Arena_octet1: buffer std_logic_vector(15 downto 0);
		Arena_32bitOutput : out std_logic_vector(31 downto 0)
--		Arena_octet2: out std_logic_vector(7 downto 0);
--		Arena_octet3: out std_logic_vector(7 downto 0)
		);
end Arena_32bitInput;

architecture Arena_32bitInput_arch of Arena_32bitInput is
begin 
process(Arena_octalBits, Arena_button)
	begin
		if (Arena_button(0) = '0') then -- If button0 pressed, take first 8 bits of 32-bit number
            Arena_octet0(0) <= Arena_octalBits(0); -- octalBits are values gotten from switches using pin assignments
            Arena_octet0(1) <= Arena_octalBits(1);
            Arena_octet0(2) <= Arena_octalBits(2);
            Arena_octet0(3) <= Arena_octalBits(3);
            Arena_octet0(4) <= Arena_octalBits(4);
            Arena_octet0(5) <= Arena_octalBits(5);
            Arena_octet0(6) <= Arena_octalBits(6);
            Arena_octet0(7) <= Arena_octalBits(7);
				Arena_octet0(8) <= Arena_octalBits(8);
				Arena_octet0(9) <= Arena_octalBits(9);
				Arena_octet0(10) <= Arena_octalBits(10);
				Arena_octet0(11) <= Arena_octalBits(11);
				Arena_octet0(12) <= Arena_octalBits(12);
				Arena_octet0(13) <= Arena_octalBits(13);
				Arena_octet0(14) <= Arena_octalBits(14);
				Arena_octet0(15) <= Arena_octalBits(15);
		else 
			null;
		end if;
			
		if (Arena_button(1) = '0') then -- If button1 pressed, take 2nd set 8 bits of 32-bit number
            Arena_octet1(0) <= Arena_octalBits(0);
            Arena_octet1(1) <= Arena_octalBits(1);
            Arena_octet1(2) <= Arena_octalBits(2);
            Arena_octet1(3) <= Arena_octalBits(3);
            Arena_octet1(4) <= Arena_octalBits(4);
            Arena_octet1(5) <= Arena_octalBits(5);
            Arena_octet1(6) <= Arena_octalBits(6);
            Arena_octet1(7) <= Arena_octalBits(7);
            Arena_octet1(8) <= Arena_octalBits(8);
            Arena_octet1(9) <= Arena_octalBits(9);
            Arena_octet1(10) <= Arena_octalBits(10);
            Arena_octet1(11) <= Arena_octalBits(11);
            Arena_octet1(12) <= Arena_octalBits(12);
            Arena_octet1(13) <= Arena_octalBits(13);
            Arena_octet1(14) <= Arena_octalBits(14);
            Arena_octet1(15) <= Arena_octalBits(15);
		else 
			null;
		end if;
		Arena_32bitOutput(15 downto 0) <= Arena_octet0;
		Arena_32bitOutput(31 downto 16) <= Arena_octet1;
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