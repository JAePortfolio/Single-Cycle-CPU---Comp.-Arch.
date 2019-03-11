library ieee;
use ieee.std_logic_1164.all;

entity Arena_32BitDivider is
	port(
		Arena_button: in std_logic_vector(3 downto 0);
		Arena_octalBits: in std_logic_vector(7 downto 0);
		Arena_octet0: out std_logic_vector(7 downto 0);
		Arena_octet1: out std_logic_vector(7 downto 0);
		Arena_octet2: out std_logic_vector(7 downto 0);
		Arena_octet3: out std_logic_vector(7 downto 0)
		);
end Arena_32BitDivider;

architecture Arena_Arch_32BitDivider of Arena_32BitDivider is
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
		else 
			null;
		end if;

		if (Arena_button(2) = '0') then -- If button2 pressed, take 3rd set 8 bits of 32-bit number
            Arena_octet2(0) <= Arena_octalBits(0);
            Arena_octet2(1) <= Arena_octalBits(1);
            Arena_octet2(2) <= Arena_octalBits(2);
            Arena_octet2(3) <= Arena_octalBits(3);
            Arena_octet2(4) <= Arena_octalBits(4);
            Arena_octet2(5) <= Arena_octalBits(5);
            Arena_octet2(6) <= Arena_octalBits(6);
            Arena_octet2(7) <= Arena_octalBits(7);
		else 
			null;
		end if;
			
		if (Arena_button(3) = '0') then -- If button3 pressed, take 4th set of 8 bits of 32-bit number
            Arena_octet3(0) <= Arena_octalBits(0);
            Arena_octet3(1) <= Arena_octalBits(1);
            Arena_octet3(2) <= Arena_octalBits(2);
            Arena_octet3(3) <= Arena_octalBits(3);
            Arena_octet3(4) <= Arena_octalBits(4);
            Arena_octet3(5) <= Arena_octalBits(5);
            Arena_octet3(6) <= Arena_octalBits(6);
            Arena_octet3(7) <= Arena_octalBits(7);
		else 
			null;
		end if;
	end process;
end Arena_Arch_32BitDivider;