-- Arena_FullAdder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_FullAdder_tb is 
end Arena_FullAdder_tb;

Architecture Arena_Arch_FullAdder_tb of Arena_FullAdder_tb is
	signal Arena_X, Arena_Y, Arena_CarryIn : std_logic;
	signal Arena_CarryOut, Arena_Sum : std_logic;
	
	type test_vector is record
		Arena_X, Arena_Y, Arena_CarryIn : std_logic;
		Arena_CarryOut, Arena_Sum : std_logic;
	end record;
	
	type test_vector_array is array (natural range <> ) of test_vector;
	constant test_vectors : test_vector_array := (
		-- Arena_X, Arena_Y, Arena_CarryIn, Arena_CarryOut, Arena_Sum
		('0', '0', '0', '0', '0'), -- X=0,Y=0,Ci=0, Co=0,S=0
		('0', '0', '1', '0', '1'), 
		('0', '1', '0', '0', '1'), 
		('0', '1', '1', '1', '0'), 
		('1', '0', '0', '0', '1'), 
		('1', '0', '1', '1', '0'), 
		('1', '1', '0', '1', '0'), 
		('1', '1', '1', '1', '1'),
		
		('0', '0', '1', '1', '0') -- fail test
		);
		
begin
	-- connecting testbench signals with Arena_HalfAdder.vhd
	UUT : entity work.Arena_FullAdder port map (Arena_X => Arena_X, Arena_Y => Arena_Y, Arena_CarryIn => Arena_CarryIn, Arena_CarryOut => Arena_CarryOut, Arena_Sum => Arena_Sum);
	
	tb1: process
	constant period: time := 40ns;
	begin
		for i in test_vectors'range loop
			Arena_X <= test_vectors(i).Arena_X; -- signal a = i^th-row-value of test_vector's a
			Arena_Y <= test_vectors(i).Arena_Y;
			Arena_CarryIn <= test_vectors(i).Arena_CarryIn;
			
			wait for period;
			
			assert(
					(Arena_CarryOut = test_vectors(i).Arena_CarryOut) and
					(Arena_Sum = test_vectors(i).Arena_Sum)
					)
					
			report"test_vector " & integer'image(i) & " failed " &
					" for input Arena_X = " & std_logic'image(Arena_X) &
					" and Arena_Y = " & std_logic'image(Arena_Y) &
					" and Arena_CarryIn = " & std_logic'image(Arena_CarryIn) &
					" For output Arena_CarryOut = " & std_logic'image(Arena_CarryOut) &
					" and output Arena_Sum = " & std_logic'image(Arena_Sum)
					severity error;
		end loop;
		wait;
	end process;
end Arena_Arch_FullAdder_tb;	
