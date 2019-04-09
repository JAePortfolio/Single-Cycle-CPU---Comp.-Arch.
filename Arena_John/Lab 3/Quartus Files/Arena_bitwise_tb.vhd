-- (First, Last) John Arena -CSC 342/343 - Lab 3 - Spring 2019 Due: 4/1/19
-- Arena_bitwise_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_bitwise_tb is

end Arena_bitwise_tb;
architecture Arena_bitwise_tb_arch of Arena_bitwise_tb is
   signal Arena_a_bitwiseIN_tb,Arena_b_bitwiseIN_tb: std_logic_vector(5 downto 0);
   signal Arena_result_bitwiseOUT_tb: std_logic_vector (5 downto 0);
	signal Arena_opcode_tb: std_logic_vector (3 downto 0);
	signal Arena_buttonStart_tb: std_logic;
	
	signal Arena_b_sramt_integer : integer;--Declare and assign value
	signal Arena_b_slamt_integer : integer; -- Shift Left integer value declaration
	signal Arena_b_rramt_integer : integer; -- Rotate Right integer value declaration
	signal Arena_b_rlamt_integer : integer; -- Rotate Left integer value declaration
	signal Arena_a_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion
	signal Arena_b_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion
	
	signal Arena_a_sltIN_integer : integer; -- Declaring variables for binary to integer conversion
	signal Arena_b_sltIN_integer : integer; -- Declaring variables for binary to integer conversion

--	type test_vector is record -- collection of sginals
--		Arena_opcode_tb: std_logic_vector(3 downto 0);
--		Arena_a_bitwiseIN_tb, Arena_b_bitwiseIN_tb: std_logic_vector(5 downto 0);
--		--Arena_result_bitwiseOUT_tb: std_logic_vector(5 downto 0);
--		Arena_buttonStart_tb: std_logic;
--	end record;
--	
--	type test_vector_array is array (natural range <> ) of test_vector; -- Array of test vector
--	constant test_vectors : test_vector_array := (
--	-- Arena_opcode(3..0), Arena_a_bitwiseIN(5..0), Arena_b_bitwiseIN(5..0), Arena_buttonStart
--	("0000", "000000", "000000", "0") -- Opcode:0000 for NOT, A = 000000, button=0, out should be 111111
--	);
begin
	UUT : entity work.Arena_bitwise port map (Arena_a_bitwiseIN => Arena_a_bitwiseIN_tb, Arena_b_bitwiseIN => Arena_b_bitwiseIN_tb,
	   Arena_result_bitwiseOUT => Arena_result_bitwiseOUT_tb, Arena_opcode => Arena_opcode_tb, Arena_buttonStart => Arena_buttonStart_tb);
	
	tb1: process
	constant period: time := 40ns;
	begin
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_opcode_tb <="0000"; -- Test for NOT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "111111") -- Expected output
		report "Test failed for input 000000 for NOT" severity error;
		
		Arena_a_bitwiseIN_tb <= "111111";
		Arena_opcode_tb <="0000"; -- Test for NOT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for input 111111 for NOT" severity error;
				
		Arena_a_bitwiseIN_tb <= "101010";
		Arena_opcode_tb <="0000"; -- Test for NOT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "010101") -- Expected output
		report "Test failed for input 101010 for NOT" severity error;
				
		Arena_a_bitwiseIN_tb <= "000001";
		Arena_b_bitwiseIN_tb <= "111111";
		Arena_opcode_tb <="0001"; -- Test for OR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "111111") -- Expected output
		report "Test failed for input A:000001 and B:111111 for OR" severity error;
				
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_b_bitwiseIN_tb <= "000000";
		Arena_opcode_tb <="0001"; -- Test for OR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for input A:000000 and B:0000000 for OR" severity error;
				
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_b_bitwiseIN_tb <= "000000";
		Arena_opcode_tb <="0010"; -- Test for AND operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:000000 and B:000000 for AND" severity error;
				
		Arena_a_bitwiseIN_tb <= "000011";
		Arena_b_bitwiseIN_tb <= "111100";
		Arena_opcode_tb <="0010"; -- Test for AND operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:000011 and B:111100 for AND" severity error;
				
		Arena_a_bitwiseIN_tb <= "000001";
		Arena_b_bitwiseIN_tb <= "111111";
		Arena_opcode_tb <="0010"; -- Test for AND operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:000001 and B:111111 for AND" severity error;
				
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_b_bitwiseIN_tb <= "000000";
		Arena_opcode_tb <="0011"; -- Test for XOR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:000000 and B:000000 for XOR" severity error;
				
		Arena_a_bitwiseIN_tb <= "101010";
		Arena_b_bitwiseIN_tb <= "010101";
		Arena_opcode_tb <="0011"; -- Test for XOR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "111111") -- Expected output
		report "Test failed for inputs A:101010 and B:010101 for XOR" severity error;
				
		Arena_a_bitwiseIN_tb <= "111111";
		Arena_b_bitwiseIN_tb <= "111111";
		Arena_opcode_tb <="0011"; -- Test for XOR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:111111 and B:111111 for XOR" severity error;
				
		Arena_a_bitwiseIN_tb <= "100000";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="0100"; -- Test for BSR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "010000") -- Expected output
		report "Test failed for inputs A:100000 and B:000001 for BSR" severity error;
				
		Arena_a_bitwiseIN_tb <= "100011";
		Arena_b_bitwiseIN_tb <= "000011";
		Arena_opcode_tb <="0100"; -- Test for BSR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000100") -- Expected output
		report "Test failed for inputs A:100011 and B:000011 for BSR" severity error;
				
		Arena_a_bitwiseIN_tb <= "000001";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="0101"; -- Test for BSL operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000010") -- Expected output
		report "Test failed for inputs A:000001 and B:000001 for BSL" severity error;
				
		Arena_a_bitwiseIN_tb <= "110001";
		Arena_b_bitwiseIN_tb <= "000011";
		Arena_opcode_tb <="0101"; -- Test for BSL operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "001000") -- Expected output
		report "Test failed for inputs A:110001 and B:000011 for BSL" severity error;
				
		Arena_a_bitwiseIN_tb <= "000001";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="0110"; -- Test for BRR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "100000") -- Expected output
		report "Test failed for inputs A:000001 and B:000001 for BRR" severity error;
				
		Arena_a_bitwiseIN_tb <= "001000";
		Arena_b_bitwiseIN_tb <= "000011";
		Arena_opcode_tb <="0110"; -- Test for BRR operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:001000 and B:000011 for BRR" severity error;
				
		Arena_a_bitwiseIN_tb <= "100000";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="0111"; -- Test for BRL operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:100000 and B:000001 for BRL" severity error;
				
		Arena_a_bitwiseIN_tb <= "000100";
		Arena_b_bitwiseIN_tb <= "000011";
		Arena_opcode_tb <="0111"; -- Test for BRL operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "100000") -- Expected output
		report "Test failed for inputs A:000100 and B:000011 for BRL" severity error;
				
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="1000"; -- Test for SLTU operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:000000 and B:000001 for SLTU" severity error;
				
		Arena_a_bitwiseIN_tb <= "111111";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="1000"; -- Test for SLTU operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:111111 and B:000001 for SLTU" severity error;
				
		Arena_a_bitwiseIN_tb <= "000000";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="1001"; -- Test for SLT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:000000 and B:000001 for SLT" severity error;
				
		Arena_a_bitwiseIN_tb <= "111111";
		Arena_b_bitwiseIN_tb <= "000001";
		Arena_opcode_tb <="1001"; -- Test for SLT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000001") -- Expected output
		report "Test failed for inputs A:111111 and B:000001 for SLT" severity error;
				
		Arena_a_bitwiseIN_tb <= "111110";
		Arena_b_bitwiseIN_tb <= "111101";
		Arena_opcode_tb <="1001"; -- Test for SLT operation
		Arena_buttonStart_tb <= '0';
	   wait for period;
		assert(Arena_result_bitwiseOUT_tb = "000000") -- Expected output
		report "Test failed for inputs A:111110 and B:111101 for SLT" severity error;
		
		wait;
	end process;

end Arena_bitwise_tb_arch;