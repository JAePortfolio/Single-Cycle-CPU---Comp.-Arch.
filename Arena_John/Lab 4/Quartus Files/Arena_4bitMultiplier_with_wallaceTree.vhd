---- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
---- Arena_4bit_arrayMultipler.vhd
--
--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
--
--entity Arena_4bitMultiplier_with_wallaceTree is 
--	port(
--		Arena_4bitIN_A, Arena_4bitIN_B: in std_logic_vector(3 downto 0);
--		Arena_4bitOUT: out std_logic_vector(7 downto 0)
--	);
--end Arena_4bitMultiplier_with_wallaceTree;
--
--architecture Arena_4bitMultiplier_with_wallaceTree_arch of Arena_4bitMultiplier_with_wallaceTree is
---- Creates a 4x3 array for a number pad
----type Arena_Sum_vecArray is array (0 to 7, 0 to 0) of integer range 0 to 16;
--signal Arena_Sum_vec : unsigned(15 downto 0);
--type Arena_result_vecArray is array (15 downto 0) of std_logic_vector(5 downto 0);
--signal Arena_result_vec : Arena_result_vecArray;
--
--signal Arena_Cout_vec : std_logic_vector(255 downto 0);
--
--type Arena_andGateArray is array (3 downto 0) of std_logic_vector(3 downto 0);
--signal Arena_andGate : Arena_andGateArray;
--
--variable resultTest : unsigned(8 downto 0);
--
--
--	component Arena_parallelAdder -- Using Parallel Adder Component
--	port(
--		data0x		: in std_logic_vector (0 downto 0);
--		data10x		: in std_logic_vector (0 downto 0);
--		data11x		: in std_logic_vector (0 downto 0);
--		data12x		: in std_logic_vector (0 downto 0);
--		data13x		: in std_logic_vector (0 downto 0);
--		data14x		: in std_logic_vector (0 downto 0);
--		data15x		: in std_logic_vector (0 downto 0);
--		data16x		: in std_logic_vector (0 downto 0);
--		data1x		: in std_logic_vector (0 downto 0);
--		data2x		: in std_logic_vector (0 downto 0);
--		data3x		: in std_logic_vector (0 downto 0);
--		data4x		: in std_logic_vector (0 downto 0);
--		data5x		: in std_logic_vector (0 downto 0);
--		data6x		: in std_logic_vector (0 downto 0);
--		data7x		: in std_logic_vector (0 downto 0);
--		data8x		: in std_logic_vector (0 downto 0);
--		data9x		: in std_logic_vector (0 downto 0);
--		result		: out std_logic_vector (5 downto 0)
--	);
--	end component;
--	
--begin
--
--	Arena_andGate(0)(0) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(0);
--	Arena_andGate(0)(1) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(0);
--	Arena_andGate(0)(2) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(0);
--	Arena_andGate(0)(3) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(0);
--	Arena_andGate(1)(0) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(1);
--	Arena_andGate(1)(1) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(1);
--	Arena_andGate(1)(2) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(1);
--	Arena_andGate(1)(3) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(1);
--	Arena_andGate(2)(0) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(2);
--	Arena_andGate(2)(1) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(2);
--	Arena_andGate(2)(2) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(2);
--	Arena_andGate(2)(3) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(2);
--	Arena_andGate(3)(0) <= Arena_4bitIN_A(0) and Arena_4bitIN_B(3);
--	Arena_andGate(3)(1) <= Arena_4bitIN_A(1) and Arena_4bitIN_B(3);
--	Arena_andGate(3)(2) <= Arena_4bitIN_A(2) and Arena_4bitIN_B(3);
--	Arena_andGate(3)(3) <= Arena_4bitIN_A(3) and Arena_4bitIN_B(3);
--
--	--Arena_Sum_vec(0) <= Arena_andGate(0)(0);
--	Arena_Cout_vec(0) <= '0';
--	
--	-- Parallel Adder 0 -- (comp=> signal)
--	FA0: Arena_parallelAdder port map(result => Arena_result_vec(0), data16x(0)=>'0',
--	data15x(0)=>'0', data14x(0)=>'0', data13x(0)=>'0', data12x(0)=>'0', data11x(0)=>'0', data10x(0)=>'0', data9x(0)=>'0', 
--	data8x(0)=>'0', data7x(0)=>'0', data6x(0)=>'0', data5x(0)=>'0', data4x(0)=>'0', data3x(0)=>'0', data2x(0)=>'0', 
--	data1x(0) => Arena_andGate(1)(0), data0x(0) => Arena_andGate(0)(1));
--	Arena_Cout_vec(1) <=  Arena_result_vec(0)(1); -- Result OV bit 
--		
--	-- Parallel Adder 1 -- (comp=> signal) -- Previous carry in
--	FA1: Arena_parallelAdder port map(result => Arena_result_vec(1), data16x(0)=>Arena_Cout_vec(1),
--	data15x(0)=>'0', data14x(0)=>'0', data13x(0)=>'0', data12x(0)=>'0', data11x(0)=>'0', data10x(0)=>'0', data9x(0)=>'0', 
--	data8x(0)=>'0', data7x(0)=>'0', data6x(0)=>'0', data5x(0)=>'0', data4x(0)=>'0', data3x(0)=>'0', data2x(0)=>Arena_andGate(2)(0), 
--	data1x(0) => Arena_andGate(1)(1), data0x(0) => Arena_andGate(0)(2));
--	Arena_Cout_vec(2) <=  Arena_result_vec(1)(1); -- Result OV bit 
--
--			
--	-- Parallel Adder 2 -- (comp=> signal) -- Previous carry in
--	FA2: Arena_parallelAdder port map(result => Arena_result_vec(2), data16x(0)=>Arena_Cout_vec(2),
--	data15x(0)=>'0', data14x(0)=>'0', data13x(0)=>'0', data12x(0)=>'0', data11x(0)=>'0', data10x(0)=>'0', data9x(0)=>'0', 
--	data8x(0)=>'0', data7x(0)=>'0', data6x(0)=>'0', data5x(0)=>'0', data4x(0)=>'0', data3x(0)=>Arena_andGate(3)(0), data2x(0)=>Arena_andGate(2)(1), 
--	data1x(0) => Arena_andGate(1)(2), data0x(0) => Arena_andGate(0)(3));
--	Arena_Cout_vec(3) <=  Arena_result_vec(2)(2); -- Result OV bit
--	
--			
--	-- Parallel Adder 3 -- (comp=> signal) -- Previous carry in
--	FA3: Arena_parallelAdder port map(result => Arena_result_vec(3), data16x(0)=>Arena_Cout_vec(3),
--	data15x(0)=>'0', data14x(0)=>'0', data13x(0)=>'0', data12x(0)=>'0', data11x(0)=>'0', data10x(0)=>'0', data9x(0)=>'0', 
--	data8x(0)=>'0', data7x(0)=>'0', data6x(0)=>'0', data5x(0)=>'0', data4x(0)=>'0', data3x(0)=>'0', data2x(0)=>Arena_andGate(3)(1), 
--	data1x(0) => Arena_andGate(2)(2), data0x(0) => Arena_andGate(1)(3));
--	Arena_Cout_vec(4) <=  Arena_result_vec(3)(1); -- Result OV bit
--				
--	-- Parallel Adder 4 -- (comp=> signal) -- Previous carry in
--	FA4: Arena_parallelAdder port map(result => Arena_result_vec(3), data16x(0)=>Arena_Cout_vec(4),
--	data15x(0)=>'0', data14x(0)=>'0', data13x(0)=>'0', data12x(0)=>'0', data11x(0)=>'0', data10x(0)=>'0', data9x(0)=>'0', 
--	data8x(0)=>'0', data7x(0)=>'0', data6x(0)=>'0', data5x(0)=>'0', data4x(0)=>'0', data3x(0)=>'0', data2x(0)=>'0', 
--	data1x(0) => Arena_andGate(3)(2), data0x(0) => Arena_andGate(2)(3));
--	Arena_Cout_vec(5) <=  Arena_result_vec(4)(1); -- Result OV bit
--	
--	Arena_result_vec(5)(0) <= Arena_Cout_vec(5) or Arena_andGate(3)(3);
--	
--	resultTest(0) := unsigned(Arena_andGate(0)(0));
--	resultTest(1) := unsigned(Arena_result_vec(0));
--	-- Result
--	Arena_4bitOUT(0) <= Arena_andGate(0)(0);
--	Arena_4bitOUT(1) <= Arena_result_vec(0);
--	Arena_4bitOUT(2) <= Arena_result_vec(1);
--	Arena_4bitOUT(3) <= Arena_result_vec(2);
--	Arena_4bitOUT(4) <= Arena_result_vec(3);
--	Arena_4bitOUT(5) <= Arena_result_vec(4);
--	Arena_4bitOUT(6) <= Arena_result_vec(5)(0);
--	--Arena_4bitOUT(7) <= Arena_Cout_vec(11);
--	
--end Arena_4bitMultiplier_with_wallaceTree_arch ;