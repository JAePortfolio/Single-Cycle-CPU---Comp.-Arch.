library ieee;
use ieee.std_logic_1164.all;

entity Arena_3to8Decoder is
	port(
		Arena_A, Arena_B, Arena_C : in std_logic;
		Arena_F0, Arena_F1, Arena_F2 : out std_logic; 
		Arena_F3, Arena_F4, Arena_F5 : out std_logic;
		Arena_F6, Arena_F7 : out std_logic
		);
end Arena_3to8Decoder;

architecture Arena_Arch_3to8Decoder of Arena_3to8Decoder is

begin 
	Arena_F0 <= '1' when (Arena_A = '0' and Arena_B = '0' and Arena_C = '0') else '0';
	Arena_F1 <= '1' when (Arena_A = '0' and Arena_B = '0' and Arena_C = '1') else '0';
	Arena_F2 <= '1' when (Arena_A = '0' and Arena_B = '1' and Arena_C = '0') else '0';
	Arena_F3 <= '1' when (Arena_A = '0' and Arena_B = '1' and Arena_C = '1') else '0';
	Arena_F4 <= '1' when (Arena_A = '1' and Arena_B = '0' and Arena_C = '0') else '0';
	Arena_F5 <= '1' when (Arena_A = '1' and Arena_B = '0' and Arena_C = '1') else '0';
	Arena_F6 <= '1' when (Arena_A = '1' and Arena_B = '1' and Arena_C = '0') else '0';
	Arena_F7 <= '1' when (Arena_A = '1' and Arena_B = '1' and Arena_C = '1') else '0';
end Arena_Arch_3to8Decoder;