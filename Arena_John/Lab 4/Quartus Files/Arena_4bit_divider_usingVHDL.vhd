-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_4bit_divider_usingVHDL.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_4bit_divider_usingVHDL is 
	port(
		Arena_Dividend, Arena_Divisor: in std_logic_vector(3 downto 0);
		Arena_Quotient, Arena_Remainder: out std_logic_vector(3 downto 0)
	);
end Arena_4bit_divider_usingVHDL;

architecture Arena_4bit_divider_usingVHDL_arch of Arena_4bit_divider_usingVHDL is
type Arena_OKo_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_OKo_vec : Arena_OKo_vecArray := (others => "0000");

type Arena_OKi_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_OKi_vec : Arena_OKi_vecArray;

type Arena_Bin_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_Bin_vec : Arena_Bin_vecArray;

type Arena_Bout_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_Bout_vec : Arena_Bout_vecArray;

type Arena_Difference_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_Difference_vec : Arena_Difference_vecArray;

type Arena_So_vecArray is array (3 downto 0) of std_logic_vector(3 downto 0);
signal Arena_So_vec : Arena_So_vecArray;
	

	component Arena_1bitDivider -- Using Full Adder Component
	port(
		Arena_S_fs, Arena_M_fs, Arena_Bin_fs, Arena_OKi : in std_logic;
		Arena_So_fs, Arena_Bout_fs, Arena_OKo, Arena_Difference_fs: out std_logic
		);
	end component;
	
begin

	-- Full Subtractors 0-3 (comp -> signal)
	FS0: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor(0), Arena_M_fs => Arena_Dividend(3), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(0)(1), Arena_OKo => Arena_OKo_vec(0)(0), Arena_Bout_fs => Arena_Bout_vec(0)(0), 
	Arena_Difference_fs => Arena_Difference_vec(0)(0), Arena_So_fs => Arena_So_vec(0)(0));
	Arena_Quotient(3) <= Arena_OKo_vec(0)(0);
	
	GEN_FS_L0:
	for I in 1 to 2 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor(I), Arena_M_fs => '0', Arena_Bin_fs => Arena_Bout_vec(0)(I-1), 
		Arena_OKi => Arena_OKo_vec(0)(I+1), Arena_OKo => Arena_OKo_vec(0)(I), Arena_Bout_fs => Arena_Bout_vec(0)(I), 
		Arena_Difference_fs => Arena_Difference_vec(0)(I), Arena_So_fs => Arena_So_vec(0)(I));
	end generate GEN_FS_L0;
	
	FS3: Arena_1bitDivider port map(Arena_S_fs => Arena_Divisor(3), Arena_M_fs => '0', Arena_Bin_fs => Arena_Bout_vec(0)(2), 
	Arena_OKi => (not Arena_Bout_vec(0)(3)), Arena_OKo => Arena_OKo_vec(0)(3), Arena_Bout_fs => Arena_Bout_vec(0)(3), 
	Arena_Difference_fs => Arena_Difference_vec(0)(3), Arena_So_fs => Arena_So_vec(0)(3));

	
	-- Full Subtractors 4-7 (comp -> signal)
	FS4: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(0), Arena_M_fs => Arena_Dividend(2), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(1)(1), Arena_OKo => Arena_OKo_vec(1)(0), Arena_Bout_fs => Arena_Bout_vec(1)(0), 
	Arena_Difference_fs => Arena_Difference_vec(1)(0), Arena_So_fs => Arena_So_vec(1)(0));
	Arena_Quotient(2) <= Arena_OKo_vec(1)(0);
	
	GEN_FS_L1:
	for I in 1 to 2 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(I), Arena_M_fs => Arena_Difference_vec(0)(I-1), Arena_Bin_fs => Arena_Bout_vec(1)(I-1), 
		Arena_OKi => Arena_OKo_vec(1)(I+1), Arena_OKo => Arena_OKo_vec(1)(I), Arena_Bout_fs => Arena_Bout_vec(1)(I), 
		Arena_Difference_fs => Arena_Difference_vec(1)(I), Arena_So_fs => Arena_So_vec(1)(I));
	end generate GEN_FS_L1;
	
	FS7: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(0)(3), Arena_M_fs => Arena_Difference_vec(0)(2), Arena_Bin_fs => Arena_Bout_vec(1)(2), 
	Arena_OKi => (not Arena_Bout_vec(1)(3)), Arena_OKo => Arena_OKo_vec(1)(3), Arena_Bout_fs => Arena_Bout_vec(1)(3), 
	Arena_Difference_fs => Arena_Difference_vec(1)(3), Arena_So_fs => Arena_So_vec(1)(3));
	
	-- Full Subtractors 8-11 (comp -> signal)
	FS8: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(0), Arena_M_fs => Arena_Dividend(1), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(2)(1), Arena_OKo => Arena_OKo_vec(2)(0), Arena_Bout_fs => Arena_Bout_vec(2)(0), 
	Arena_Difference_fs => Arena_Difference_vec(2)(0), Arena_So_fs => Arena_So_vec(2)(0));
	Arena_Quotient(1) <= Arena_OKo_vec(2)(0);
	
	GEN_FS_L2:
	for I in 1 to 2 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(I), Arena_M_fs => Arena_Difference_vec(1)(I-1), Arena_Bin_fs => Arena_Bout_vec(2)(I-1), 
		Arena_OKi => Arena_OKo_vec(2)(I+1), Arena_OKo => Arena_OKo_vec(2)(I), Arena_Bout_fs => Arena_Bout_vec(2)(I), 
		Arena_Difference_fs => Arena_Difference_vec(2)(I), Arena_So_fs => Arena_So_vec(2)(I));
	end generate GEN_FS_L2;
	
	FS11: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(1)(3), Arena_M_fs => Arena_Difference_vec(1)(2), Arena_Bin_fs => Arena_Bout_vec(2)(2), 
	Arena_OKi => (not Arena_Bout_vec(2)(3)), Arena_OKo => Arena_OKo_vec(2)(3), Arena_Bout_fs => Arena_Bout_vec(2)(3), 
	Arena_Difference_fs => Arena_Difference_vec(2)(3), Arena_So_fs => Arena_So_vec(2)(3));
	
	-- Full Subtractors 12-15 (comp -> signal) -- Row 3
	FS12: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(0), Arena_M_fs => Arena_Dividend(0), Arena_Bin_fs => '0', 
	Arena_OKi => Arena_OKo_vec(3)(1), Arena_OKo => Arena_OKo_vec(3)(0), Arena_Bout_fs => Arena_Bout_vec(3)(0), 
	Arena_Difference_fs => Arena_Difference_vec(3)(0), Arena_So_fs => Arena_So_vec(3)(0));
	Arena_Quotient(0) <= Arena_OKo_vec(3)(0);
	-- R-1,0 | -1 | '0' | R, 1 | R,0 | R,0 | R,0 | R,0 | -1 | R,0
	GEN_FS_L3:
	for I in 1 to 2 generate 
		FSX: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(I), Arena_M_fs => Arena_Difference_vec(2)(I-1), Arena_Bin_fs => Arena_Bout_vec(3)(I-1), 
		Arena_OKi => Arena_OKo_vec(3)(I+1), Arena_OKo => Arena_OKo_vec(3)(I), Arena_Bout_fs => Arena_Bout_vec(3)(I), 
		Arena_Difference_fs => Arena_Difference_vec(3)(I), Arena_So_fs => Arena_So_vec(3)(I));
	end generate GEN_FS_L3;
	-- R-1,I | R-1,I-1 | R,I-1 | R, I+1 | R,I | R,I | R,I | R,I |	
	FS15: Arena_1bitDivider port map(Arena_S_fs => Arena_So_vec(2)(3), Arena_M_fs => Arena_Difference_vec(2)(2), Arena_Bin_fs => Arena_Bout_vec(3)(2), 
	Arena_OKi => (not Arena_Bout_vec(3)(3)), Arena_OKo => Arena_OKo_vec(3)(3), Arena_Bout_fs => Arena_Bout_vec(3)(3), 
	Arena_Difference_fs => Arena_Difference_vec(3)(3), Arena_So_fs => Arena_So_vec(3)(3));
	-- R-1,31 | R-1, 30 | R,30 | R,31 | R,31 | R,31| R,31| R,31|	

	--Quotient
	Arena_Remainder <= Arena_Difference_vec(3);
end Arena_4bit_divider_usingVHDL_arch;