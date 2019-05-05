-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bit_divider_usingVHDL.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bit_divider_usingVHDL is 
	port(
		Arena_Dividend_32bit, Arena_Divisor_32bit: in std_logic_vector(31 downto 0);
		Arena_Quotient_32bit, Arena_Remainder_32bit: out std_logic_vector(31 downto 0)
	);
end Arena_32bit_divider_usingVHDL;

architecture Arena_32bit_divider_usingVHDL_arch of Arena_32bit_divider_usingVHDL is
type Arena_OKo_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_OKo_vec : Arena_OKo_vecArray := (others => "00000000000000000000000000000000");

type Arena_OKi_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_OKi_vec : Arena_OKi_vecArray := (others => "00000000000000000000000000000000");

type Arena_Bin_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_Bin_vec : Arena_Bin_vecArray := (others => "00000000000000000000000000000000");

type Arena_Bout_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_Bout_vec : Arena_Bout_vecArray := (others => "00000000000000000000000000000000");

type Arena_Difference_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_Difference_vec : Arena_Difference_vecArray := (others => "00000000000000000000000000000000");

type Arena_So_vecArray is array (31 downto 0) of std_logic_vector(31 downto 0);
signal Arena_So_vec : Arena_So_vecArray := (others => "00000000000000000000000000000000");
	

	component Arena_1bitDivider -- Using Full Adder Component
	port(
		Arena_S_fs, Arena_M_fs, Arena_Bin_fs, Arena_OKi : in std_logic;
		Arena_So_fs, Arena_Bout_fs, Arena_OKo, Arena_Difference_fs: out std_logic
		);
	end component;
	
begin

	-- Full Subtractors 0-31 (comp -> signal) -- Row 0
	FS0: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor_32bit(0), Arena_M_fs => Arena_Dividend_32bit(31), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(0)(1), Arena_OKo => Arena_OKo_vec(0)(0), Arena_Bout_fs => Arena_Bout_vec(0)(0), 
	Arena_Difference_fs => Arena_Difference_vec(0)(0), Arena_So_fs => Arena_So_vec(0)(0));
	Arena_Quotient_32bit(31) <= Arena_OKo_vec(0)(0);
	
	GEN_FS_L0:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor_32bit(I), Arena_M_fs => '0', Arena_Bin_fs => Arena_Bout_vec(0)(I-1), 
		Arena_OKi => Arena_OKo_vec(0)(I+1), Arena_OKo => Arena_OKo_vec(0)(I), Arena_Bout_fs => Arena_Bout_vec(0)(I), 
		Arena_Difference_fs => Arena_Difference_vec(0)(I), Arena_So_fs => Arena_So_vec(0)(I));
	end generate GEN_FS_L0;
	
	FS31: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor_32bit(31), Arena_M_fs => '0', Arena_Bin_fs => Arena_Bout_vec(0)(30), 
	Arena_OKi => (not Arena_Bout_vec(0)(31)), Arena_OKo => Arena_OKo_vec(0)(31), Arena_Bout_fs => Arena_Bout_vec(0)(31), 
	Arena_Difference_fs => Arena_Difference_vec(0)(31), Arena_So_fs => Arena_So_vec(0)(31));

	
	-- Full Subtractors 32-63 (comp -> signal) -- Row 1
	FS32: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(0), Arena_M_fs => Arena_Dividend_32bit(30), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(1)(1), Arena_OKo => Arena_OKo_vec(1)(0), Arena_Bout_fs => Arena_Bout_vec(1)(0), 
	Arena_Difference_fs => Arena_Difference_vec(1)(0), Arena_So_fs => Arena_So_vec(1)(0));
	Arena_Quotient_32bit(30) <= Arena_OKo_vec(1)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 |	
	GEN_FS_L1:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(I), Arena_M_fs => Arena_Difference_vec(0)(I-1), Arena_Bin_fs => Arena_Bout_vec(1)(I-1), 
		Arena_OKi => Arena_OKo_vec(1)(I+1), Arena_OKo => Arena_OKo_vec(1)(I), Arena_Bout_fs => Arena_Bout_vec(1)(I), 
		Arena_Difference_fs => Arena_Difference_vec(1)(I), Arena_So_fs => Arena_So_vec(1)(I));
	end generate GEN_FS_L1;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	FS63: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(31), Arena_M_fs => Arena_Difference_vec(0)(30), Arena_Bin_fs => Arena_Bout_vec(1)(30), 
	Arena_OKi => (not Arena_Bout_vec(1)(31)), Arena_OKo => Arena_OKo_vec(1)(31), Arena_Bout_fs => Arena_Bout_vec(1)(31), 
	Arena_Difference_fs => Arena_Difference_vec(1)(31), Arena_So_fs => Arena_So_vec(1)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|
	
	-- Full Subtractors 64-95 (comp -> signal) -- Row 2
	FS64: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(0), Arena_M_fs => Arena_Dividend_32bit(29), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(2)(1), Arena_OKo => Arena_OKo_vec(2)(0), Arena_Bout_fs => Arena_Bout_vec(2)(0), 
	Arena_Difference_fs => Arena_Difference_vec(2)(0), Arena_So_fs => Arena_So_vec(2)(0));
	Arena_Quotient_32bit(29) <= Arena_OKo_vec(2)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 |
	GEN_FS_L2:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(I), Arena_M_fs => Arena_Difference_vec(1)(I-1), Arena_Bin_fs => Arena_Bout_vec(2)(I-1), 
		Arena_OKi => Arena_OKo_vec(2)(I+1), Arena_OKo => Arena_OKo_vec(2)(I), Arena_Bout_fs => Arena_Bout_vec(2)(I), 
		Arena_Difference_fs => Arena_Difference_vec(2)(I), Arena_So_fs => Arena_So_vec(2)(I));
	end generate GEN_FS_L2;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS95: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(31), Arena_M_fs => Arena_Difference_vec(1)(30), Arena_Bin_fs => Arena_Bout_vec(2)(30), 
	Arena_OKi => (not Arena_Bout_vec(2)(31)), Arena_OKo => Arena_OKo_vec(2)(31), Arena_Bout_fs => Arena_Bout_vec(2)(31), 
	Arena_Difference_fs => Arena_Difference_vec(2)(31), Arena_So_fs => Arena_So_vec(2)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|
	
	
	-- Full Subtractors 96-127 (comp -> signal) -- Row 3
	FS96: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(0), Arena_M_fs => Arena_Dividend_32bit(28), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(3)(1), Arena_OKo => Arena_OKo_vec(3)(0), Arena_Bout_fs => Arena_Bout_vec(3)(0), 
	Arena_Difference_fs => Arena_Difference_vec(3)(0), Arena_So_fs => Arena_So_vec(3)(0));
	Arena_Quotient_32bit(28) <= Arena_OKo_vec(3)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L3:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(I), Arena_M_fs => Arena_Difference_vec(2)(I-1), Arena_Bin_fs => Arena_Bout_vec(3)(I-1), 
		Arena_OKi => Arena_OKo_vec(3)(I+1), Arena_OKo => Arena_OKo_vec(3)(I), Arena_Bout_fs => Arena_Bout_vec(3)(I), 
		Arena_Difference_fs => Arena_Difference_vec(3)(I), Arena_So_fs => Arena_So_vec(3)(I));
	end generate GEN_FS_L3;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS127: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(31), Arena_M_fs => Arena_Difference_vec(2)(30), Arena_Bin_fs => Arena_Bout_vec(3)(30), 
	Arena_OKi => (not Arena_Bout_vec(3)(31)), Arena_OKo => Arena_OKo_vec(3)(31), Arena_Bout_fs => Arena_Bout_vec(3)(31), 
	Arena_Difference_fs => Arena_Difference_vec(3)(31), Arena_So_fs => Arena_So_vec(3)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-- Full Subtractors 128-159 (comp -> signal) -- Row 4
	FS128: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(3)(0), Arena_M_fs => Arena_Dividend_32bit(27), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(4)(1), Arena_OKo => Arena_OKo_vec(4)(0), Arena_Bout_fs => Arena_Bout_vec(4)(0), 
	Arena_Difference_fs => Arena_Difference_vec(4)(0), Arena_So_fs => Arena_So_vec(4)(0));
	Arena_Quotient_32bit(27) <= Arena_OKo_vec(4)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L4:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(3)(I), Arena_M_fs => Arena_Difference_vec(3)(I-1), Arena_Bin_fs => Arena_Bout_vec(4)(I-1), 
		Arena_OKi => Arena_OKo_vec(4)(I+1), Arena_OKo => Arena_OKo_vec(4)(I), Arena_Bout_fs => Arena_Bout_vec(4)(I), 
		Arena_Difference_fs => Arena_Difference_vec(4)(I), Arena_So_fs => Arena_So_vec(4)(I));
	end generate GEN_FS_L4;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS159: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(3)(31), Arena_M_fs => Arena_Difference_vec(3)(30), Arena_Bin_fs => Arena_Bout_vec(4)(30), 
	Arena_OKi => (not Arena_Bout_vec(4)(31)), Arena_OKo => Arena_OKo_vec(4)(31), Arena_Bout_fs => Arena_Bout_vec(4)(31), 
	Arena_Difference_fs => Arena_Difference_vec(4)(31), Arena_So_fs => Arena_So_vec(4)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
	
		
	-- Full Subtractors 160-191 (comp -> signal) -- Row 5
	FS160: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(4)(0), Arena_M_fs => Arena_Dividend_32bit(26), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(5)(1), Arena_OKo => Arena_OKo_vec(5)(0), Arena_Bout_fs => Arena_Bout_vec(5)(0), 
	Arena_Difference_fs => Arena_Difference_vec(5)(0), Arena_So_fs => Arena_So_vec(5)(0));
	Arena_Quotient_32bit(26) <= Arena_OKo_vec(5)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L5:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(4)(I), Arena_M_fs => Arena_Difference_vec(4)(I-1), Arena_Bin_fs => Arena_Bout_vec(5)(I-1), 
		Arena_OKi => Arena_OKo_vec(5)(I+1), Arena_OKo => Arena_OKo_vec(5)(I), Arena_Bout_fs => Arena_Bout_vec(5)(I), 
		Arena_Difference_fs => Arena_Difference_vec(5)(I), Arena_So_fs => Arena_So_vec(5)(I));
	end generate GEN_FS_L5;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS191: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(4)(31), Arena_M_fs => Arena_Difference_vec(4)(30), Arena_Bin_fs => Arena_Bout_vec(5)(30), 
	Arena_OKi => (not Arena_Bout_vec(5)(31)), Arena_OKo => Arena_OKo_vec(5)(31), Arena_Bout_fs => Arena_Bout_vec(5)(31), 
	Arena_Difference_fs => Arena_Difference_vec(5)(31), Arena_So_fs => Arena_So_vec(5)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
	
		
	-------------------------------------------------- Full Subtractors 192-223 (comp -> signal) -- Row 6-------------------------------------------------------
	FS192: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(5)(0), Arena_M_fs => Arena_Dividend_32bit(25), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(6)(1), Arena_OKo => Arena_OKo_vec(6)(0), Arena_Bout_fs => Arena_Bout_vec(6)(0), 
	Arena_Difference_fs => Arena_Difference_vec(6)(0), Arena_So_fs => Arena_So_vec(6)(0));
	Arena_Quotient_32bit(25) <= Arena_OKo_vec(6)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L6:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(5)(I), Arena_M_fs => Arena_Difference_vec(5)(I-1), Arena_Bin_fs => Arena_Bout_vec(6)(I-1), 
		Arena_OKi => Arena_OKo_vec(6)(I+1), Arena_OKo => Arena_OKo_vec(6)(I), Arena_Bout_fs => Arena_Bout_vec(6)(I), 
		Arena_Difference_fs => Arena_Difference_vec(6)(I), Arena_So_fs => Arena_So_vec(6)(I));
	end generate GEN_FS_L6;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS223: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(5)(31), Arena_M_fs => Arena_Difference_vec(5)(30), Arena_Bin_fs => Arena_Bout_vec(6)(30), 
	Arena_OKi => (not Arena_Bout_vec(6)(31)), Arena_OKo => Arena_OKo_vec(6)(31), Arena_Bout_fs => Arena_Bout_vec(6)(31), 
	Arena_Difference_fs => Arena_Difference_vec(6)(31), Arena_So_fs => Arena_So_vec(6)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	
	-------------------------------------------------- Full Subtractors 224-255 (comp -> signal) -- Row 7-------------------------------------------------------
	FS224: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(6)(0), Arena_M_fs => Arena_Dividend_32bit(24), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(7)(1), Arena_OKo => Arena_OKo_vec(7)(0), Arena_Bout_fs => Arena_Bout_vec(7)(0), 
	Arena_Difference_fs => Arena_Difference_vec(7)(0), Arena_So_fs => Arena_So_vec(7)(0));
	Arena_Quotient_32bit(24) <= Arena_OKo_vec(7)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L7:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(6)(I), Arena_M_fs => Arena_Difference_vec(6)(I-1), Arena_Bin_fs => Arena_Bout_vec(7)(I-1), 
		Arena_OKi => Arena_OKo_vec(7)(I+1), Arena_OKo => Arena_OKo_vec(7)(I), Arena_Bout_fs => Arena_Bout_vec(7)(I), 
		Arena_Difference_fs => Arena_Difference_vec(7)(I), Arena_So_fs => Arena_So_vec(7)(I));
	end generate GEN_FS_L7;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS255: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(6)(31), Arena_M_fs => Arena_Difference_vec(6)(30), Arena_Bin_fs => Arena_Bout_vec(7)(30), 
	Arena_OKi => (not Arena_Bout_vec(7)(31)), Arena_OKo => Arena_OKo_vec(7)(31), Arena_Bout_fs => Arena_Bout_vec(7)(31), 
	Arena_Difference_fs => Arena_Difference_vec(7)(31), Arena_So_fs => Arena_So_vec(7)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-------------------------------------------------- Full Subtractors 256-287 (comp -> signal) -- Row 8-------------------------------------------------------
	FS256: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(7)(0), Arena_M_fs => Arena_Dividend_32bit(23), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(8)(1), Arena_OKo => Arena_OKo_vec(8)(0), Arena_Bout_fs => Arena_Bout_vec(8)(0), 
	Arena_Difference_fs => Arena_Difference_vec(8)(0), Arena_So_fs => Arena_So_vec(8)(0));
	Arena_Quotient_32bit(23) <= Arena_OKo_vec(8)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L8:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(7)(I), Arena_M_fs => Arena_Difference_vec(7)(I-1), Arena_Bin_fs => Arena_Bout_vec(8)(I-1), 
		Arena_OKi => Arena_OKo_vec(8)(I+1), Arena_OKo => Arena_OKo_vec(8)(I), Arena_Bout_fs => Arena_Bout_vec(8)(I), 
		Arena_Difference_fs => Arena_Difference_vec(8)(I), Arena_So_fs => Arena_So_vec(8)(I));
	end generate GEN_FS_L8;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS287: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(7)(31), Arena_M_fs => Arena_Difference_vec(7)(30), Arena_Bin_fs => Arena_Bout_vec(8)(30), 
	Arena_OKi => (not Arena_Bout_vec(8)(31)), Arena_OKo => Arena_OKo_vec(8)(31), Arena_Bout_fs => Arena_Bout_vec(8)(31), 
	Arena_Difference_fs => Arena_Difference_vec(8)(31), Arena_So_fs => Arena_So_vec(8)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-------------------------------------------------- Full Subtractors 288-319 (comp -> signal) -- Row 9-------------------------------------------------------
	FS288: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(8)(0), Arena_M_fs => Arena_Dividend_32bit(22), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(9)(1), Arena_OKo => Arena_OKo_vec(9)(0), Arena_Bout_fs => Arena_Bout_vec(9)(0), 
	Arena_Difference_fs => Arena_Difference_vec(9)(0), Arena_So_fs => Arena_So_vec(9)(0));
	Arena_Quotient_32bit(22) <= Arena_OKo_vec(9)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L9:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(8)(I), Arena_M_fs => Arena_Difference_vec(8)(I-1), Arena_Bin_fs => Arena_Bout_vec(9)(I-1), 
		Arena_OKi => Arena_OKo_vec(9)(I+1), Arena_OKo => Arena_OKo_vec(9)(I), Arena_Bout_fs => Arena_Bout_vec(9)(I), 
		Arena_Difference_fs => Arena_Difference_vec(9)(I), Arena_So_fs => Arena_So_vec(9)(I));
	end generate GEN_FS_L9;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS319: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(8)(31), Arena_M_fs => Arena_Difference_vec(8)(30), Arena_Bin_fs => Arena_Bout_vec(9)(30), 
	Arena_OKi => (not Arena_Bout_vec(9)(31)), Arena_OKo => Arena_OKo_vec(9)(31), Arena_Bout_fs => Arena_Bout_vec(9)(31), 
	Arena_Difference_fs => Arena_Difference_vec(9)(31), Arena_So_fs => Arena_So_vec(9)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-------------------------------------------------- Full Subtractors 320-351 (comp -> signal) -- Row 10-------------------------------------------------------
	FS320: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(9)(0), Arena_M_fs => Arena_Dividend_32bit(21), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(10)(1), Arena_OKo => Arena_OKo_vec(10)(0), Arena_Bout_fs => Arena_Bout_vec(10)(0), 
	Arena_Difference_fs => Arena_Difference_vec(10)(0), Arena_So_fs => Arena_So_vec(10)(0));
	Arena_Quotient_32bit(21) <= Arena_OKo_vec(10)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L10:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(9)(I), Arena_M_fs => Arena_Difference_vec(9)(I-1), Arena_Bin_fs => Arena_Bout_vec(10)(I-1), 
		Arena_OKi => Arena_OKo_vec(10)(I+1), Arena_OKo => Arena_OKo_vec(10)(I), Arena_Bout_fs => Arena_Bout_vec(10)(I), 
		Arena_Difference_fs => Arena_Difference_vec(10)(I), Arena_So_fs => Arena_So_vec(10)(I));
	end generate GEN_FS_L10;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS351: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(9)(31), Arena_M_fs => Arena_Difference_vec(9)(30), Arena_Bin_fs => Arena_Bout_vec(10)(30), 
	Arena_OKi => (not Arena_Bout_vec(10)(31)), Arena_OKo => Arena_OKo_vec(10)(31), Arena_Bout_fs => Arena_Bout_vec(10)(31), 
	Arena_Difference_fs => Arena_Difference_vec(10)(31), Arena_So_fs => Arena_So_vec(10)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-------------------------------------------------- Full Subtractors 352-383 (comp -> signal) -- Row 11-------------------------------------------------------
	FS352: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(10)(0), Arena_M_fs => Arena_Dividend_32bit(20), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(11)(1), Arena_OKo => Arena_OKo_vec(11)(0), Arena_Bout_fs => Arena_Bout_vec(11)(0), 
	Arena_Difference_fs => Arena_Difference_vec(11)(0), Arena_So_fs => Arena_So_vec(11)(0));
	Arena_Quotient_32bit(20) <= Arena_OKo_vec(11)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L11:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(10)(I), Arena_M_fs => Arena_Difference_vec(10)(I-1), Arena_Bin_fs => Arena_Bout_vec(11)(I-1), 
		Arena_OKi => Arena_OKo_vec(11)(I+1), Arena_OKo => Arena_OKo_vec(11)(I), Arena_Bout_fs => Arena_Bout_vec(11)(I), 
		Arena_Difference_fs => Arena_Difference_vec(11)(I), Arena_So_fs => Arena_So_vec(11)(I));
	end generate GEN_FS_L11;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS383: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(10)(31), Arena_M_fs => Arena_Difference_vec(10)(30), Arena_Bin_fs => Arena_Bout_vec(11)(30), 
	Arena_OKi => (not Arena_Bout_vec(11)(31)), Arena_OKo => Arena_OKo_vec(11)(31), Arena_Bout_fs => Arena_Bout_vec(11)(31), 
	Arena_Difference_fs => Arena_Difference_vec(11)(31), Arena_So_fs => Arena_So_vec(11)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
				
	-------------------------------------------------- Full Subtractors 384-415 (comp -> signal) -- Row 12-------------------------------------------------------
	FS384: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(11)(0), Arena_M_fs => Arena_Dividend_32bit(19), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(12)(1), Arena_OKo => Arena_OKo_vec(12)(0), Arena_Bout_fs => Arena_Bout_vec(12)(0), 
	Arena_Difference_fs => Arena_Difference_vec(12)(0), Arena_So_fs => Arena_So_vec(12)(0));
	Arena_Quotient_32bit(19) <= Arena_OKo_vec(12)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L12:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(11)(I), Arena_M_fs => Arena_Difference_vec(11)(I-1), Arena_Bin_fs => Arena_Bout_vec(12)(I-1), 
		Arena_OKi => Arena_OKo_vec(12)(I+1), Arena_OKo => Arena_OKo_vec(12)(I), Arena_Bout_fs => Arena_Bout_vec(12)(I), 
		Arena_Difference_fs => Arena_Difference_vec(12)(I), Arena_So_fs => Arena_So_vec(12)(I));
	end generate GEN_FS_L12;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS415: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(11)(31), Arena_M_fs => Arena_Difference_vec(11)(30), Arena_Bin_fs => Arena_Bout_vec(12)(30), 
	Arena_OKi => (not Arena_Bout_vec(12)(31)), Arena_OKo => Arena_OKo_vec(12)(31), Arena_Bout_fs => Arena_Bout_vec(12)(31), 
	Arena_Difference_fs => Arena_Difference_vec(12)(31), Arena_So_fs => Arena_So_vec(12)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|					
				
	-------------------------------------------------- Full Subtractors 416-447 (comp -> signal) -- Row 13-------------------------------------------------------
	FS416: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(12)(0), Arena_M_fs => Arena_Dividend_32bit(18), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(13)(1), Arena_OKo => Arena_OKo_vec(13)(0), Arena_Bout_fs => Arena_Bout_vec(13)(0), 
	Arena_Difference_fs => Arena_Difference_vec(13)(0), Arena_So_fs => Arena_So_vec(13)(0));
	Arena_Quotient_32bit(18) <= Arena_OKo_vec(13)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L13:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(12)(I), Arena_M_fs => Arena_Difference_vec(12)(I-1), Arena_Bin_fs => Arena_Bout_vec(13)(I-1), 
		Arena_OKi => Arena_OKo_vec(13)(I+1), Arena_OKo => Arena_OKo_vec(13)(I), Arena_Bout_fs => Arena_Bout_vec(13)(I), 
		Arena_Difference_fs => Arena_Difference_vec(13)(I), Arena_So_fs => Arena_So_vec(13)(I));
	end generate GEN_FS_L13;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS447: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(12)(31), Arena_M_fs => Arena_Difference_vec(12)(30), Arena_Bin_fs => Arena_Bout_vec(13)(30), 
	Arena_OKi => (not Arena_Bout_vec(13)(31)), Arena_OKo => Arena_OKo_vec(13)(31), Arena_Bout_fs => Arena_Bout_vec(13)(31), 
	Arena_Difference_fs => Arena_Difference_vec(13)(31), Arena_So_fs => Arena_So_vec(13)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 448-479 (comp -> signal) -- Row 14-------------------------------------------------------
	FS448: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(13)(0), Arena_M_fs => Arena_Dividend_32bit(17), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(14)(1), Arena_OKo => Arena_OKo_vec(14)(0), Arena_Bout_fs => Arena_Bout_vec(14)(0), 
	Arena_Difference_fs => Arena_Difference_vec(14)(0), Arena_So_fs => Arena_So_vec(14)(0));
	Arena_Quotient_32bit(17) <= Arena_OKo_vec(14)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L14:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(13)(I), Arena_M_fs => Arena_Difference_vec(13)(I-1), Arena_Bin_fs => Arena_Bout_vec(14)(I-1), 
		Arena_OKi => Arena_OKo_vec(14)(I+1), Arena_OKo => Arena_OKo_vec(14)(I), Arena_Bout_fs => Arena_Bout_vec(14)(I), 
		Arena_Difference_fs => Arena_Difference_vec(14)(I), Arena_So_fs => Arena_So_vec(14)(I));
	end generate GEN_FS_L14;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS479: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(13)(31), Arena_M_fs => Arena_Difference_vec(13)(30), Arena_Bin_fs => Arena_Bout_vec(14)(30), 
	Arena_OKi => (not Arena_Bout_vec(14)(31)), Arena_OKo => Arena_OKo_vec(14)(31), Arena_Bout_fs => Arena_Bout_vec(14)(31), 
	Arena_Difference_fs => Arena_Difference_vec(14)(31), Arena_So_fs => Arena_So_vec(14)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
				
	-------------------------------------------------- Full Subtractors 480-511 (comp -> signal) -- Row 15-------------------------------------------------------
	FS480: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(14)(0), Arena_M_fs => Arena_Dividend_32bit(16), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(15)(1), Arena_OKo => Arena_OKo_vec(15)(0), Arena_Bout_fs => Arena_Bout_vec(15)(0), 
	Arena_Difference_fs => Arena_Difference_vec(15)(0), Arena_So_fs => Arena_So_vec(15)(0));
	Arena_Quotient_32bit(16) <= Arena_OKo_vec(15)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L15:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(14)(I), Arena_M_fs => Arena_Difference_vec(14)(I-1), Arena_Bin_fs => Arena_Bout_vec(15)(I-1), 
		Arena_OKi => Arena_OKo_vec(15)(I+1), Arena_OKo => Arena_OKo_vec(15)(I), Arena_Bout_fs => Arena_Bout_vec(15)(I), 
		Arena_Difference_fs => Arena_Difference_vec(15)(I), Arena_So_fs => Arena_So_vec(15)(I));
	end generate GEN_FS_L15;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS511: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(14)(31), Arena_M_fs => Arena_Difference_vec(14)(30), Arena_Bin_fs => Arena_Bout_vec(15)(30), 
	Arena_OKi => (not Arena_Bout_vec(15)(31)), Arena_OKo => Arena_OKo_vec(15)(31), Arena_Bout_fs => Arena_Bout_vec(15)(31), 
	Arena_Difference_fs => Arena_Difference_vec(15)(31), Arena_So_fs => Arena_So_vec(15)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
				
	-------------------------------------------------- Full Subtractors 512-543 (comp -> signal) -- Row 16-------------------------------------------------------
	FS512: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(15)(0), Arena_M_fs => Arena_Dividend_32bit(15), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(16)(1), Arena_OKo => Arena_OKo_vec(16)(0), Arena_Bout_fs => Arena_Bout_vec(16)(0), 
	Arena_Difference_fs => Arena_Difference_vec(16)(0), Arena_So_fs => Arena_So_vec(16)(0));
	Arena_Quotient_32bit(15) <= Arena_OKo_vec(16)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L16:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(15)(I), Arena_M_fs => Arena_Difference_vec(15)(I-1), Arena_Bin_fs => Arena_Bout_vec(16)(I-1), 
		Arena_OKi => Arena_OKo_vec(16)(I+1), Arena_OKo => Arena_OKo_vec(16)(I), Arena_Bout_fs => Arena_Bout_vec(16)(I), 
		Arena_Difference_fs => Arena_Difference_vec(16)(I), Arena_So_fs => Arena_So_vec(16)(I));
	end generate GEN_FS_L16;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS543: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(15)(31), Arena_M_fs => Arena_Difference_vec(15)(30), Arena_Bin_fs => Arena_Bout_vec(16)(30), 
	Arena_OKi => (not Arena_Bout_vec(16)(31)), Arena_OKo => Arena_OKo_vec(16)(31), Arena_Bout_fs => Arena_Bout_vec(16)(31), 
	Arena_Difference_fs => Arena_Difference_vec(16)(31), Arena_So_fs => Arena_So_vec(16)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
		
	-------------------------------------------------- Full Subtractors 544-575 (comp -> signal) -- Row 17-------------------------------------------------------
	FS544: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(16)(0), Arena_M_fs => Arena_Dividend_32bit(14), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(17)(1), Arena_OKo => Arena_OKo_vec(17)(0), Arena_Bout_fs => Arena_Bout_vec(17)(0), 
	Arena_Difference_fs => Arena_Difference_vec(17)(0), Arena_So_fs => Arena_So_vec(17)(0));
	Arena_Quotient_32bit(14) <= Arena_OKo_vec(17)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L17:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(16)(I), Arena_M_fs => Arena_Difference_vec(16)(I-1), Arena_Bin_fs => Arena_Bout_vec(17)(I-1), 
		Arena_OKi => Arena_OKo_vec(17)(I+1), Arena_OKo => Arena_OKo_vec(17)(I), Arena_Bout_fs => Arena_Bout_vec(17)(I), 
		Arena_Difference_fs => Arena_Difference_vec(17)(I), Arena_So_fs => Arena_So_vec(17)(I));
	end generate GEN_FS_L17;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS575: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(16)(31), Arena_M_fs => Arena_Difference_vec(16)(30), Arena_Bin_fs => Arena_Bout_vec(17)(30), 
	Arena_OKi => (not Arena_Bout_vec(17)(31)), Arena_OKo => Arena_OKo_vec(17)(31), Arena_Bout_fs => Arena_Bout_vec(17)(31), 
	Arena_Difference_fs => Arena_Difference_vec(17)(31), Arena_So_fs => Arena_So_vec(17)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 576-607 (comp -> signal) -- Row 18-------------------------------------------------------
	FS576: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(17)(0), Arena_M_fs => Arena_Dividend_32bit(13), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(18)(1), Arena_OKo => Arena_OKo_vec(18)(0), Arena_Bout_fs => Arena_Bout_vec(18)(0), 
	Arena_Difference_fs => Arena_Difference_vec(18)(0), Arena_So_fs => Arena_So_vec(18)(0));
	Arena_Quotient_32bit(13) <= Arena_OKo_vec(18)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L18:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(17)(I), Arena_M_fs => Arena_Difference_vec(17)(I-1), Arena_Bin_fs => Arena_Bout_vec(18)(I-1), 
		Arena_OKi => Arena_OKo_vec(18)(I+1), Arena_OKo => Arena_OKo_vec(18)(I), Arena_Bout_fs => Arena_Bout_vec(18)(I), 
		Arena_Difference_fs => Arena_Difference_vec(18)(I), Arena_So_fs => Arena_So_vec(18)(I));
	end generate GEN_FS_L18;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS607: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(17)(31), Arena_M_fs => Arena_Difference_vec(17)(30), Arena_Bin_fs => Arena_Bout_vec(18)(30), 
	Arena_OKi => (not Arena_Bout_vec(18)(31)), Arena_OKo => Arena_OKo_vec(18)(31), Arena_Bout_fs => Arena_Bout_vec(18)(31), 
	Arena_Difference_fs => Arena_Difference_vec(18)(31), Arena_So_fs => Arena_So_vec(18)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 608-639 (comp -> signal) -- Row 19-------------------------------------------------------
	FS608: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(18)(0), Arena_M_fs => Arena_Dividend_32bit(12), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(19)(1), Arena_OKo => Arena_OKo_vec(19)(0), Arena_Bout_fs => Arena_Bout_vec(19)(0), 
	Arena_Difference_fs => Arena_Difference_vec(19)(0), Arena_So_fs => Arena_So_vec(19)(0));
	Arena_Quotient_32bit(12) <= Arena_OKo_vec(19)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L19:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(18)(I), Arena_M_fs => Arena_Difference_vec(18)(I-1), Arena_Bin_fs => Arena_Bout_vec(19)(I-1), 
		Arena_OKi => Arena_OKo_vec(19)(I+1), Arena_OKo => Arena_OKo_vec(19)(I), Arena_Bout_fs => Arena_Bout_vec(19)(I), 
		Arena_Difference_fs => Arena_Difference_vec(19)(I), Arena_So_fs => Arena_So_vec(19)(I));
	end generate GEN_FS_L19;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS639: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(18)(31), Arena_M_fs => Arena_Difference_vec(18)(30), Arena_Bin_fs => Arena_Bout_vec(19)(30), 
	Arena_OKi => (not Arena_Bout_vec(19)(31)), Arena_OKo => Arena_OKo_vec(19)(31), Arena_Bout_fs => Arena_Bout_vec(19)(31), 
	Arena_Difference_fs => Arena_Difference_vec(19)(31), Arena_So_fs => Arena_So_vec(19)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 640-671 (comp -> signal) -- Row 20-------------------------------------------------------
	FS640: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(19)(0), Arena_M_fs => Arena_Dividend_32bit(11), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(20)(1), Arena_OKo => Arena_OKo_vec(20)(0), Arena_Bout_fs => Arena_Bout_vec(20)(0), 
	Arena_Difference_fs => Arena_Difference_vec(20)(0), Arena_So_fs => Arena_So_vec(20)(0));
	Arena_Quotient_32bit(11) <= Arena_OKo_vec(20)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L20:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(19)(I), Arena_M_fs => Arena_Difference_vec(19)(I-1), Arena_Bin_fs => Arena_Bout_vec(20)(I-1), 
		Arena_OKi => Arena_OKo_vec(20)(I+1), Arena_OKo => Arena_OKo_vec(20)(I), Arena_Bout_fs => Arena_Bout_vec(20)(I), 
		Arena_Difference_fs => Arena_Difference_vec(20)(I), Arena_So_fs => Arena_So_vec(20)(I));
	end generate GEN_FS_L20;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS671: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(19)(31), Arena_M_fs => Arena_Difference_vec(19)(30), Arena_Bin_fs => Arena_Bout_vec(20)(30), 
	Arena_OKi => (not Arena_Bout_vec(20)(31)), Arena_OKo => Arena_OKo_vec(20)(31), Arena_Bout_fs => Arena_Bout_vec(20)(31), 
	Arena_Difference_fs => Arena_Difference_vec(20)(31), Arena_So_fs => Arena_So_vec(20)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 672-703 (comp -> signal) -- Row 21-------------------------------------------------------
	FS672: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(20)(0), Arena_M_fs => Arena_Dividend_32bit(10), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(21)(1), Arena_OKo => Arena_OKo_vec(21)(0), Arena_Bout_fs => Arena_Bout_vec(21)(0), 
	Arena_Difference_fs => Arena_Difference_vec(21)(0), Arena_So_fs => Arena_So_vec(21)(0));
	Arena_Quotient_32bit(10) <= Arena_OKo_vec(21)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L21:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(20)(I), Arena_M_fs => Arena_Difference_vec(20)(I-1), Arena_Bin_fs => Arena_Bout_vec(21)(I-1), 
		Arena_OKi => Arena_OKo_vec(21)(I+1), Arena_OKo => Arena_OKo_vec(21)(I), Arena_Bout_fs => Arena_Bout_vec(21)(I), 
		Arena_Difference_fs => Arena_Difference_vec(21)(I), Arena_So_fs => Arena_So_vec(21)(I));
	end generate GEN_FS_L21;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS703: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(20)(31), Arena_M_fs => Arena_Difference_vec(20)(30), Arena_Bin_fs => Arena_Bout_vec(21)(30), 
	Arena_OKi => (not Arena_Bout_vec(20)(31)), Arena_OKo => Arena_OKo_vec(21)(31), Arena_Bout_fs => Arena_Bout_vec(21)(31), 
	Arena_Difference_fs => Arena_Difference_vec(21)(31), Arena_So_fs => Arena_So_vec(21)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 704-735 (comp -> signal) -- Row 22-------------------------------------------------------
	FS704: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(21)(0), Arena_M_fs => Arena_Dividend_32bit(9), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(22)(1), Arena_OKo => Arena_OKo_vec(22)(0), Arena_Bout_fs => Arena_Bout_vec(22)(0), 
	Arena_Difference_fs => Arena_Difference_vec(22)(0), Arena_So_fs => Arena_So_vec(22)(0));
	Arena_Quotient_32bit(9) <= Arena_OKo_vec(22)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L22:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(21)(I), Arena_M_fs => Arena_Difference_vec(21)(I-1), Arena_Bin_fs => Arena_Bout_vec(22)(I-1), 
		Arena_OKi => Arena_OKo_vec(22)(I+1), Arena_OKo => Arena_OKo_vec(22)(I), Arena_Bout_fs => Arena_Bout_vec(22)(I), 
		Arena_Difference_fs => Arena_Difference_vec(22)(I), Arena_So_fs => Arena_So_vec(22)(I));
	end generate GEN_FS_L22;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS735: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(21)(31), Arena_M_fs => Arena_Difference_vec(21)(30), Arena_Bin_fs => Arena_Bout_vec(22)(30), 
	Arena_OKi => (not Arena_Bout_vec(22)(31)), Arena_OKo => Arena_OKo_vec(22)(31), Arena_Bout_fs => Arena_Bout_vec(22)(31), 
	Arena_Difference_fs => Arena_Difference_vec(22)(31), Arena_So_fs => Arena_So_vec(22)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 736-767 (comp -> signal) -- Row 23-------------------------------------------------------
	FS736: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(22)(0), Arena_M_fs => Arena_Dividend_32bit(8), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(23)(1), Arena_OKo => Arena_OKo_vec(23)(0), Arena_Bout_fs => Arena_Bout_vec(23)(0), 
	Arena_Difference_fs => Arena_Difference_vec(23)(0), Arena_So_fs => Arena_So_vec(23)(0));
	Arena_Quotient_32bit(8) <= Arena_OKo_vec(23)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L23:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(22)(I), Arena_M_fs => Arena_Difference_vec(22)(I-1), Arena_Bin_fs => Arena_Bout_vec(23)(I-1), 
		Arena_OKi => Arena_OKo_vec(23)(I+1), Arena_OKo => Arena_OKo_vec(23)(I), Arena_Bout_fs => Arena_Bout_vec(23)(I), 
		Arena_Difference_fs => Arena_Difference_vec(23)(I), Arena_So_fs => Arena_So_vec(23)(I));
	end generate GEN_FS_L23;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS767: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(22)(31), Arena_M_fs => Arena_Difference_vec(22)(30), Arena_Bin_fs => Arena_Bout_vec(23)(30), 
	Arena_OKi => (not Arena_Bout_vec(23)(31)), Arena_OKo => Arena_OKo_vec(23)(31), Arena_Bout_fs => Arena_Bout_vec(23)(31), 
	Arena_Difference_fs => Arena_Difference_vec(23)(31), Arena_So_fs => Arena_So_vec(23)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 768-799 (comp -> signal) -- Row 24-------------------------------------------------------
	FS768: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(23)(0), Arena_M_fs => Arena_Dividend_32bit(7), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(24)(1), Arena_OKo => Arena_OKo_vec(24)(0), Arena_Bout_fs => Arena_Bout_vec(24)(0), 
	Arena_Difference_fs => Arena_Difference_vec(24)(0), Arena_So_fs => Arena_So_vec(24)(0));
	Arena_Quotient_32bit(7) <= Arena_OKo_vec(24)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L24:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(23)(I), Arena_M_fs => Arena_Difference_vec(23)(I-1), Arena_Bin_fs => Arena_Bout_vec(24)(I-1), 
		Arena_OKi => Arena_OKo_vec(24)(I+1), Arena_OKo => Arena_OKo_vec(24)(I), Arena_Bout_fs => Arena_Bout_vec(24)(I), 
		Arena_Difference_fs => Arena_Difference_vec(24)(I), Arena_So_fs => Arena_So_vec(24)(I));
	end generate GEN_FS_L24;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS799: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(23)(31), Arena_M_fs => Arena_Difference_vec(23)(30), Arena_Bin_fs => Arena_Bout_vec(24)(30), 
	Arena_OKi => (not Arena_Bout_vec(24)(31)), Arena_OKo => Arena_OKo_vec(24)(31), Arena_Bout_fs => Arena_Bout_vec(24)(31), 
	Arena_Difference_fs => Arena_Difference_vec(24)(31), Arena_So_fs => Arena_So_vec(24)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	
			
	-------------------------------------------------- Full Subtractors 800-831 (comp -> signal) -- Row 25-------------------------------------------------------
	FS800: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(24)(0), Arena_M_fs => Arena_Dividend_32bit(6), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(25)(1), Arena_OKo => Arena_OKo_vec(25)(0), Arena_Bout_fs => Arena_Bout_vec(25)(0), 
	Arena_Difference_fs => Arena_Difference_vec(25)(0), Arena_So_fs => Arena_So_vec(25)(0));
	Arena_Quotient_32bit(6) <= Arena_OKo_vec(25)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L25:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(24)(I), Arena_M_fs => Arena_Difference_vec(24)(I-1), Arena_Bin_fs => Arena_Bout_vec(25)(I-1), 
		Arena_OKi => Arena_OKo_vec(25)(I+1), Arena_OKo => Arena_OKo_vec(25)(I), Arena_Bout_fs => Arena_Bout_vec(25)(I), 
		Arena_Difference_fs => Arena_Difference_vec(25)(I), Arena_So_fs => Arena_So_vec(25)(I));
	end generate GEN_FS_L25;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS831: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(24)(31), Arena_M_fs => Arena_Difference_vec(24)(30), Arena_Bin_fs => Arena_Bout_vec(25)(30), 
	Arena_OKi => (not Arena_Bout_vec(25)(31)), Arena_OKo => Arena_OKo_vec(25)(31), Arena_Bout_fs => Arena_Bout_vec(25)(31), 
	Arena_Difference_fs => Arena_Difference_vec(25)(31), Arena_So_fs => Arena_So_vec(25)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	-------------------------------------------------- Full Subtractors 832-863 (comp -> signal) -- Row 26-------------------------------------------------------
	FS832: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(25)(0), Arena_M_fs => Arena_Dividend_32bit(5), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(26)(1), Arena_OKo => Arena_OKo_vec(26)(0), Arena_Bout_fs => Arena_Bout_vec(26)(0), 
	Arena_Difference_fs => Arena_Difference_vec(26)(0), Arena_So_fs => Arena_So_vec(26)(0));
	Arena_Quotient_32bit(5) <= Arena_OKo_vec(26)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L26:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(25)(I), Arena_M_fs => Arena_Difference_vec(25)(I-1), Arena_Bin_fs => Arena_Bout_vec(26)(I-1), 
		Arena_OKi => Arena_OKo_vec(26)(I+1), Arena_OKo => Arena_OKo_vec(26)(I), Arena_Bout_fs => Arena_Bout_vec(26)(I), 
		Arena_Difference_fs => Arena_Difference_vec(26)(I), Arena_So_fs => Arena_So_vec(26)(I));
	end generate GEN_FS_L26;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS863: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(25)(31), Arena_M_fs => Arena_Difference_vec(25)(30), Arena_Bin_fs => Arena_Bout_vec(26)(30), 
	Arena_OKi => (not Arena_Bout_vec(26)(31)), Arena_OKo => Arena_OKo_vec(26)(31), Arena_Bout_fs => Arena_Bout_vec(26)(31), 
	Arena_Difference_fs => Arena_Difference_vec(26)(31), Arena_So_fs => Arena_So_vec(26)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	-------------------------------------------------- Full Subtractors 864-895 (comp -> signal) -- Row 27-------------------------------------------------------
	FS864: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(26)(0), Arena_M_fs => Arena_Dividend_32bit(4), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(27)(1), Arena_OKo => Arena_OKo_vec(27)(0), Arena_Bout_fs => Arena_Bout_vec(27)(0), 
	Arena_Difference_fs => Arena_Difference_vec(27)(0), Arena_So_fs => Arena_So_vec(27)(0));
	Arena_Quotient_32bit(4) <= Arena_OKo_vec(27)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L27:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(26)(I), Arena_M_fs => Arena_Difference_vec(26)(I-1), Arena_Bin_fs => Arena_Bout_vec(27)(I-1), 
		Arena_OKi => Arena_OKo_vec(27)(I+1), Arena_OKo => Arena_OKo_vec(27)(I), Arena_Bout_fs => Arena_Bout_vec(27)(I), 
		Arena_Difference_fs => Arena_Difference_vec(27)(I), Arena_So_fs => Arena_So_vec(27)(I));
	end generate GEN_FS_L27;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS895: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(26)(31), Arena_M_fs => Arena_Difference_vec(26)(30), Arena_Bin_fs => Arena_Bout_vec(27)(30), 
	Arena_OKi => (not Arena_Bout_vec(27)(31)), Arena_OKo => Arena_OKo_vec(27)(31), Arena_Bout_fs => Arena_Bout_vec(27)(31), 
	Arena_Difference_fs => Arena_Difference_vec(27)(31), Arena_So_fs => Arena_So_vec(27)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	-------------------------------------------------- Full Subtractors 896-927 (comp -> signal) -- Row 28-------------------------------------------------------
	FS896: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(27)(0), Arena_M_fs => Arena_Dividend_32bit(3), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(28)(1), Arena_OKo => Arena_OKo_vec(28)(0), Arena_Bout_fs => Arena_Bout_vec(28)(0), 
	Arena_Difference_fs => Arena_Difference_vec(28)(0), Arena_So_fs => Arena_So_vec(28)(0));
	Arena_Quotient_32bit(3) <= Arena_OKo_vec(28)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L28:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(27)(I), Arena_M_fs => Arena_Difference_vec(27)(I-1), Arena_Bin_fs => Arena_Bout_vec(28)(I-1), 
		Arena_OKi => Arena_OKo_vec(28)(I+1), Arena_OKo => Arena_OKo_vec(28)(I), Arena_Bout_fs => Arena_Bout_vec(28)(I), 
		Arena_Difference_fs => Arena_Difference_vec(28)(I), Arena_So_fs => Arena_So_vec(28)(I));
	end generate GEN_FS_L28;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS927: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(27)(31), Arena_M_fs => Arena_Difference_vec(27)(30), Arena_Bin_fs => Arena_Bout_vec(28)(30), 
	Arena_OKi => (not Arena_Bout_vec(28)(31)), Arena_OKo => Arena_OKo_vec(28)(31), Arena_Bout_fs => Arena_Bout_vec(28)(31), 
	Arena_Difference_fs => Arena_Difference_vec(28)(31), Arena_So_fs => Arena_So_vec(28)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	-------------------------------------------------- Full Subtractors 928-959 (comp -> signal) -- Row 29-------------------------------------------------------
	FS928: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(28)(0), Arena_M_fs => Arena_Dividend_32bit(2), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(29)(1), Arena_OKo => Arena_OKo_vec(29)(0), Arena_Bout_fs => Arena_Bout_vec(29)(0), 
	Arena_Difference_fs => Arena_Difference_vec(29)(0), Arena_So_fs => Arena_So_vec(29)(0));
	Arena_Quotient_32bit(2) <= Arena_OKo_vec(29)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L29:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(28)(I), Arena_M_fs => Arena_Difference_vec(28)(I-1), Arena_Bin_fs => Arena_Bout_vec(29)(I-1), 
		Arena_OKi => Arena_OKo_vec(29)(I+1), Arena_OKo => Arena_OKo_vec(29)(I), Arena_Bout_fs => Arena_Bout_vec(29)(I), 
		Arena_Difference_fs => Arena_Difference_vec(29)(I), Arena_So_fs => Arena_So_vec(29)(I));
	end generate GEN_FS_L29;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS959: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(28)(31), Arena_M_fs => Arena_Difference_vec(28)(30), Arena_Bin_fs => Arena_Bout_vec(29)(30), 
	Arena_OKi => (not Arena_Bout_vec(29)(31)), Arena_OKo => Arena_OKo_vec(29)(31), Arena_Bout_fs => Arena_Bout_vec(29)(31), 
	Arena_Difference_fs => Arena_Difference_vec(29)(31), Arena_So_fs => Arena_So_vec(29)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	-------------------------------------------------- Full Subtractors 960-991 (comp -> signal) -- Row 30-------------------------------------------------------
	FS960: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(29)(0), Arena_M_fs => Arena_Dividend_32bit(1), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(30)(1), Arena_OKo => Arena_OKo_vec(30)(0), Arena_Bout_fs => Arena_Bout_vec(30)(0), 
	Arena_Difference_fs => Arena_Difference_vec(30)(0), Arena_So_fs => Arena_So_vec(30)(0));
	Arena_Quotient_32bit(1) <= Arena_OKo_vec(30)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L30:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(29)(I), Arena_M_fs => Arena_Difference_vec(29)(I-1), Arena_Bin_fs => Arena_Bout_vec(30)(I-1), 
		Arena_OKi => Arena_OKo_vec(30)(I+1), Arena_OKo => Arena_OKo_vec(30)(I), Arena_Bout_fs => Arena_Bout_vec(30)(I), 
		Arena_Difference_fs => Arena_Difference_vec(30)(I), Arena_So_fs => Arena_So_vec(30)(I));
	end generate GEN_FS_L30;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |
	
	FS991: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(29)(31), Arena_M_fs => Arena_Difference_vec(29)(30), Arena_Bin_fs => Arena_Bout_vec(30)(30), 
	Arena_OKi => (not Arena_Bout_vec(30)(31)), Arena_OKo => Arena_OKo_vec(30)(31), Arena_Bout_fs => Arena_Bout_vec(30)(31), 
	Arena_Difference_fs => Arena_Difference_vec(30)(31), Arena_So_fs => Arena_So_vec(30)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	


	
	------------------------------------------------- Full Subtractors 992-1023 (comp -> signal) -- Row 31-------------------------------------------------------
	FS992: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(30)(0), Arena_M_fs => Arena_Dividend_32bit(0), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(31)(1), Arena_OKo => Arena_OKo_vec(31)(0), Arena_Bout_fs => Arena_Bout_vec(31)(0), 
	Arena_Difference_fs => Arena_Difference_vec(31)(0), Arena_So_fs => Arena_So_vec(31)(0));
	Arena_Quotient_32bit(0) <= Arena_OKo_vec(31)(0);
		-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L31:
	for I in 1 to 30 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(30)(I), Arena_M_fs => Arena_Difference_vec(30)(I-1), Arena_Bin_fs => Arena_Bout_vec(31)(I-1), 
		Arena_OKi => Arena_OKo_vec(31)(I+1), Arena_OKo => Arena_OKo_vec(31)(I), Arena_Bout_fs => Arena_Bout_vec(31)(I), 
		Arena_Difference_fs => Arena_Difference_vec(31)(I), Arena_So_fs => Arena_So_vec(31)(I));
	end generate GEN_FS_L31;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |

	FS1023: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(30)(31), Arena_M_fs => Arena_Difference_vec(30)(30), Arena_Bin_fs => Arena_Bout_vec(31)(30), 
	Arena_OKi => (not Arena_Bout_vec(31)(31)), Arena_OKo => Arena_OKo_vec(31)(31), Arena_Bout_fs => Arena_Bout_vec(31)(31), 
	Arena_Difference_fs => Arena_Difference_vec(31)(31), Arena_So_fs => Arena_So_vec(31)(31));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	--Quotient
	Arena_Remainder_32bit <= Arena_Difference_vec(31);
end Arena_32bit_divider_usingVHDL_arch;