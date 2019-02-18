-- Arena_FullAdder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_3to8Decoder_tb is 
end Arena_3to8Decoder_tb;

Architecture Arena_Arch_3to8Decoder_tb of Arena_3to8Decoder_tb is
	signal Arena_A, Arena_B, Arena_C : std_logic;
	signal Arena_F0, Arena_F1, Arena_F2 : std_logic; 
	signal Arena_F3, Arena_F4, Arena_F5 : std_logic;
	signal Arena_F6, Arena_F7 : std_logic;
	
	type test_vector is record
		Arena_A, Arena_B, Arena_C : std_logic;
		Arena_F0, Arena_F1, Arena_F2 : std_logic; 
		Arena_F3, Arena_F4, Arena_F5 : std_logic;
		Arena_F6, Arena_F7 : std_logic;
	end record;
	
	type test_vector_array is array (natural range <> ) of test_vector;
	constant test_vectors : test_vector_array := (
		-- Arena_A, Arena_B, Arena_C, Arena_F0, Arena_F1, Arena_F2, Arena_F3, Arena_F4, Arena_F5, Arena_F6, Arena_F7,
		('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'), -- A=0,B=0,C=0,F0=0...F7=0
		('0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0'),
		('0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
		('0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0'),
		('1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
		('1', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0'),
		('1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
		('1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1'),
		
		('0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '1') -- fail test
		);
		
begin
	-- connecting testbench signals with Arena_HalfAdder.vhd
	UUT : entity work.Arena_3to8Decoder port map (Arena_A => Arena_A, Arena_B => Arena_B, Arena_C => Arena_C, Arena_F0 => Arena_F0, Arena_F1 => Arena_F1,
			 Arena_F2 => Arena_F2, Arena_F3 => Arena_F3, Arena_F4 => Arena_F4, Arena_F5 => Arena_F5, Arena_F6 => Arena_F6, Arena_F7 => Arena_F7);
	
	tb1: process
	constant period: time := 40ns;
	begin
		for i in test_vectors'range loop
			Arena_A <= test_vectors(i).Arena_A; -- signal a = i^th-row-value of test_vector's a
			Arena_B <= test_vectors(i).Arena_B;
			Arena_C <= test_vectors(i).Arena_C;
			Arena_F0 <= test_vectors(i).Arena_F0;
			Arena_F1 <= test_vectors(i).Arena_F1;
			Arena_F2 <= test_vectors(i).Arena_F2;
			Arena_F3 <= test_vectors(i).Arena_F3;
			Arena_F4 <= test_vectors(i).Arena_F4;
			Arena_F5 <= test_vectors(i).Arena_F5;
			Arena_F6 <= test_vectors(i).Arena_F6;
			Arena_F7 <= test_vectors(i).Arena_F7;
			
			wait for period;
			
			assert(
					(Arena_A <= test_vectors(i).Arena_A) and
					(Arena_B <= test_vectors(i).Arena_B) and
					(Arena_C <= test_vectors(i).Arena_C) and
					(Arena_F0 <= test_vectors(i).Arena_F0) and
					(Arena_F1 <= test_vectors(i).Arena_F1) and
					(Arena_F2 <= test_vectors(i).Arena_F2) and
					(Arena_F3 <= test_vectors(i).Arena_F3) and
					(Arena_F4 <= test_vectors(i).Arena_F4) and
					(Arena_F5 <= test_vectors(i).Arena_F5) and
					(Arena_F6 <= test_vectors(i).Arena_F6) and
					(Arena_F7 <= test_vectors(i).Arena_F7)
					)
					
			report"test_vector " & integer'image(i) & " failed " &
					" for input Arena_A = " & std_logic'image(Arena_A) &
					" and Arena_B = " & std_logic'image(Arena_B) &
					" and Arena_C = " & std_logic'image(Arena_C) &
					" For output Arena_F0 = " & std_logic'image(Arena_F0) &
					" and output Arena_F1 = " & std_logic'image(Arena_F1) &
					" and output Arena_F2 = " & std_logic'image(Arena_F2) &
					" and output Arena_F3 = " & std_logic'image(Arena_F3) &
					" and output Arena_F4 = " & std_logic'image(Arena_F4) &
					" and output Arena_F5 = " & std_logic'image(Arena_F5) &
					" and output Arena_F6 = " & std_logic'image(Arena_F6) &
					" and output Arena_F7 = " & std_logic'image(Arena_F7)
					severity error;
		end loop;
		wait;
	end process;
end Arena_Arch_3to8Decoder_tb;	
