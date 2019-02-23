-- (First, Last) John Arena - CSC 342/343 - Lab 1 - Spring 2019 Due: 2/20/19
-- Arena_3to8Decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_8to3Encoder is -- Entity for Encoder
	port(
		Arena_Y0, Arena_Y1, Arena_Y2, Arena_Y3 : in std_logic; -- 8 inputs
		Arena_Y4, Arena_Y5, Arena_Y6, Arena_Y7 : in std_logic;
		Arena_F0, Arena_F1, Arena_F2 : out std_logic -- 3 outputs
		);
end Arena_8to3Encoder; -- End of entity

architecture Arena_Arch_8to3Encoder of Arena_8to3Encoder is --Architecture to describe functionality
begin
	Arena_F0 <= (Arena_Y3 or Arena_Y2 or Arena_Y1 or Arena_Y0); -- F0 = Y3+Y2+Y1+Y0
	Arena_F1 <= (Arena_Y5 or Arena_Y4 or Arena_Y1 or Arena_Y0); -- F1 = Y5+Y4+Y1+Y0
	Arena_F2 <= (Arena_Y6 or Arena_Y4 or Arena_Y2 or Arena_Y0); -- F2 = Y6+Y4+Y2+Y0
end Arena_Arch_8to3Encoder;	 -- End of architecture