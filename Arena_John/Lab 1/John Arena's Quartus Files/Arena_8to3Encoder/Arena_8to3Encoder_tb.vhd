-- Arena_8to3Encoder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_8to3Encoder_tb is 
end Arena_8to3Encoder_tb;

Architecture Arena_Arch_8to3Encoder_tb of Arena_8to3Encoder_tb is
	signal Arena_Y0, Arena_Y1, Arena_Y2 : std_logic; 
	signal Arena_Y3, Arena_Y4, Arena_Y5 : std_logic;
	signal Arena_Y6, Arena_Y7 : std_logic;
	signal Arena_F0, Arena_F1, Arena_F2 : std_logic;

	
	type test_vector is record
		Arena_Y0, Arena_Y1, Arena_Y2 : std_logic; 
		Arena_Y3, Arena_Y4, Arena_Y5 : std_logic;
		Arena_Y6, Arena_Y7 : std_logic;
		Arena_F0, Arena_F1, Arena_F2 : std_logic;
	end record;
	
	type test_vector_array is array (natural range <> ) of test_vector;
	constant test_vectors : test_vector_array := (
		-- Arena_Y0, Arena_Y1, Arena_Y2, Arena_Y3, Arena_Y4, Arena_Y5, Arena_Y6, Arena_Y7, Arena_Y0, Arena_Y1, Arena_Y2,
		('0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'), -- Y0=0...Y7=0,F0=0,F1=0,F2=0
		('0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '1'),
		('0', '0', '0', '0', '0', '1', '0', '0', '0', '1', '0'),
		('0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '1'),
		('0', '0', '0', '1', '0', '0', '0', '0', '1', '0', '0'),
		('0', '0', '1', '0', '0', '0', '0', '0', '1', '0', '1'),
		('0', '1', '0', '0', '0', '0', '0', '0', '1', '1', '0'),
		('1', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1')
		
		--('0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '1') -- fail test
		);
		
begin
	-- connecting testbench signals with Arena_HalfAdder.vhd
	UUT : entity work.Arena_8to3Encoder port map (Arena_F0 => Arena_F0, Arena_F1 => Arena_F1, Arena_F2 => Arena_F2, Arena_Y0 => Arena_Y0, Arena_Y1 => Arena_Y1,
			 Arena_Y2 => Arena_Y2, Arena_Y3 => Arena_Y3, Arena_Y4 => Arena_Y4, Arena_Y5 => Arena_Y5, Arena_Y6 => Arena_Y6, Arena_Y7 => Arena_Y7);
	
	tb1: process
	constant period: time := 40ns;
	begin
		for i in test_vectors'range loop
			Arena_Y0 <= test_vectors(i).Arena_Y0; -- signal a = i^th-row-value of test_vector's a
			Arena_Y1 <= test_vectors(i).Arena_Y1;
			Arena_Y2 <= test_vectors(i).Arena_Y2;
			Arena_Y3 <= test_vectors(i).Arena_Y3;
			Arena_Y4 <= test_vectors(i).Arena_Y4;
			Arena_Y5 <= test_vectors(i).Arena_Y5;
			Arena_Y6 <= test_vectors(i).Arena_Y6;
			Arena_Y7 <= test_vectors(i).Arena_Y7;
			Arena_F0 <= test_vectors(i).Arena_F0;
			Arena_F1 <= test_vectors(i).Arena_F1;
			Arena_F2 <= test_vectors(i).Arena_F2;
			wait for period;
			
			assert(
					(Arena_Y0 <= test_vectors(i).Arena_Y0) and
					(Arena_Y1 <= test_vectors(i).Arena_Y1) and
					(Arena_Y2 <= test_vectors(i).Arena_Y2) and
					(Arena_Y3 <= test_vectors(i).Arena_Y3) and
					(Arena_Y4 <= test_vectors(i).Arena_Y4) and
					(Arena_Y5 <= test_vectors(i).Arena_Y5) and
					(Arena_Y6 <= test_vectors(i).Arena_Y6) and
					(Arena_Y7 <= test_vectors(i).Arena_Y7) and
					(Arena_F0 <= test_vectors(i).Arena_F0) and
					(Arena_F1 <= test_vectors(i).Arena_F1) and
					(Arena_F2 <= test_vectors(i).Arena_F2) 
					)
					
			report"test_vector " & integer'image(i) & " failed " &
					" For input Arena_Y0 = " & std_logic'image(Arena_Y0) &
					" and input Arena_Y1 = " & std_logic'image(Arena_Y1) &
					" and input Arena_Y2 = " & std_logic'image(Arena_Y2) &
					" and input Arena_Y3 = " & std_logic'image(Arena_Y3) &
					" and input Arena_Y4 = " & std_logic'image(Arena_Y4) &
					" and input Arena_Y5 = " & std_logic'image(Arena_Y5) &
					" and input Arena_Y6 = " & std_logic'image(Arena_Y6) &
					" and input Arena_Y7 = " & std_logic'image(Arena_Y7) &
					" for output Arena_F0 = " & std_logic'image(Arena_F0) &
					" and Arena_F1 = " & std_logic'image(Arena_F1) &
					" and Arena_F2 = " & std_logic'image(Arena_F2) 
					severity error;
		end loop;
		wait;
	end process;
end Arena_Arch_8to3Encoder_tb;	
