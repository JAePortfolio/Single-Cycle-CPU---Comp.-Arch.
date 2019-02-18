-- Arena_Lab1Part1_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_Lab1Part1_tb is 
end Arena_Lab1Part1_tb;

Architecture Arena_Arch_Lab1Part1_tb of Arena_Lab1Part1_tb is
	signal Arena_A, Arena_B : std_logic;
	signal Arena_F : std_logic;
begin
	-- connecting testbench signals with Arena_HalfAdder.vhd
	UUT : entity work.Arena_Lab1Part1 port map (Arena_A => Arena_A, Arena_B => Arena_B, Arena_F => Arena_F);
	
	tb1: process
	constant period: time := 40ns;
	begin
		Arena_A <= '0';
		Arena_B <= '0';
		wait for period;
		assert((Arena_F ='1')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 00" severity error;
		
		Arena_A <= '0';
		Arena_B <= '1';
		wait for period;
		assert((Arena_F ='1')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 01" severity error;
		
		Arena_A <= '1';
		Arena_B <= '0';
		wait for period;
		assert((Arena_F ='0')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 10" severity error;
		
		Arena_A <= '1';
		Arena_B <= '1';
		wait for period;
		assert((Arena_F ='1')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 11" severity error;
		
		wait;
	end process;
end Arena_Arch_Lab1Part1_tb;	
