library ieee;
use ieee.std_logic_1164.all;

entity Arena_8to3Encoder is 
	port(
		Arena_Y0, Arena_Y1, Arena_Y2, Arena_Y3 : in std_logic;
		Arena_Y4, Arena_Y5, Arena_Y6, Arena_Y7 : in std_logic;
		Arena_F0, Arena_F1, Arena_F2 : out std_logic
		);
end Arena_8to3Encoder;

architecture Arena_Arch_8to3Encoder of Arena_8to3Encoder is
begin
	Arena_F0 <= (Arena_Y3 or Arena_Y2 or Arena_Y1 or Arena_Y0);
	Arena_F1 <= (Arena_Y5 or Arena_Y4 or Arena_Y1 or Arena_Y0);
	Arena_F2 <= (Arena_Y6 or Arena_Y4 or Arena_Y2 or Arena_Y0);
end Arena_Arch_8to3Encoder;	