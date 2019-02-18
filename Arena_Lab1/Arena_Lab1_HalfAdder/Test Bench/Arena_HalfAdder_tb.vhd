-- Arena_HalfAdder_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_HalfAdder_tb is 
end Arena_HalfAdder_tb;

Architecture Arena_Arch_HalfAdder_tb of Arena_HalfAdder_tb is
	signal Arena_X, Arena_Y : std_logic;
	signal Arena_CarryOut, Arena_Sum : std_logic;
begin
	-- connecting testbench signals with Arena_HalfAdder.vhd
	UUT : entity work.Arena_HalfAdder port map (Arena_X => Arena_X, Arena_Y => Arena_Y, Arena_CarryOut => Arena_CarryOut, Arena_Sum => Arena_Sum);
	
	tb1: process
	constant period: time := 40ns;
	begin
		Arena_X <= '0';
		Arena_Y <= '0';
		wait for period;
		assert((Arena_Sum ='0') and (Arena_CarryOut = '0')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 00" severity error;
		
		Arena_X <= '0';
		Arena_Y <= '1';
		wait for period;
		assert((Arena_Sum ='1') and (Arena_CarryOut = '0')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 01" severity error;
		
		Arena_X <= '1';
		Arena_Y <= '0';
		wait for period;
		assert((Arena_Sum ='1') and (Arena_CarryOut = '0')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 10" severity error;
		
		Arena_X <= '1';
		Arena_Y <= '1';
		wait for period;
		assert((Arena_Sum ='0') and (Arena_CarryOut = '1')) -- expected output
		-- error reported below if the sum or carry is not 0
		report "Test failed for input combination 11" severity error;
		
		wait;
	end process;
end Arena_Arch_HalfAdder_tb;	
