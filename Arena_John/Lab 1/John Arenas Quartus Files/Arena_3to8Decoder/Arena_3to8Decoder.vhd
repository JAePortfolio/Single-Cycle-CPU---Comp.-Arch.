-- (First, Last) John Arena - CSC 342/343 - Lab 1 - Spring 2019 Due: 2/20/19
-- Arena_3to8Decoder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_3to8Decoder is -- Decoder entity
	port(
		Arena_A, Arena_B, Arena_C : in std_logic;    -- 3 inputs, A B and C
		Arena_F0, Arena_F1, Arena_F2 : out std_logic; -- 8 outputs, F0..F7
		Arena_F3, Arena_F4, Arena_F5 : out std_logic;
		Arena_F6, Arena_F7 : out std_logic -- all the way up to F7
		);
end Arena_3to8Decoder; -- end of entity

architecture Arena_Arch_3to8Decoder of Arena_3to8Decoder is -- Architecture of Decoder, describing functionality

begin
process(Arena_A, Arena_B, Arena_C)
	begin 
		if (Arena_A = '0' and Arena_B = '0' and Arena_C = '0') then 
		Arena_F0 <= '1';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '0' and Arena_B = '0' and Arena_C = '1') then 
		Arena_F0 <= '0';
		Arena_F1 <= '1';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '0' and Arena_B = '1' and Arena_C = '0') then 
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '1';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '0' and Arena_B = '1' and Arena_C = '1') then 
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '1';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '1' and Arena_B = '0' and Arena_C = '0') then 
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '1';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '1' and Arena_B = '0' and Arena_C = '1') then 
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '1';
		Arena_F6 <= '0';
		Arena_F7 <= '0';
		elsif (Arena_A = '1' and Arena_B = '1' and Arena_C = '0') then
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '1';
		Arena_F7 <= '0';
		elsif (Arena_A = '1' and Arena_B = '1' and Arena_C = '1') then	-- Set high when appropriate
		Arena_F0 <= '0';
		Arena_F1 <= '0';
		Arena_F2 <= '0';
		Arena_F3 <= '0';
		Arena_F4 <= '0';
		Arena_F5 <= '0';
		Arena_F6 <= '0';
		Arena_F7 <= '1';
		else Arena_F0 <= '0';Arena_F1 <= '0';Arena_F2 <= '0';Arena_F3 <= '0';Arena_F4 <= '0';Arena_F5 <= '0';
		Arena_F6 <= '0';Arena_F7 <= '0';
		end if;
	end process;
end Arena_Arch_3to8Decoder; -- end of architecture