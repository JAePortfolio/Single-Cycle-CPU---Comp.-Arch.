-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_16bitFullAdder.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_16bitFullAdder is 
	port(
		Arena_16bitIN_A_fa, Arena_16bitIN_B_fa: in std_logic_vector(15 downto 0);
		Arena_16bitIN_Cin_fa : in std_logic;
		Arena_16bitOUT_Sum_fa : out std_logic_vector(15 downto 0);
		Arena_16bitOUT_Cout_fa : out std_logic
	);
end Arena_16bitFullAdder;

architecture Arena_16bitFullAdder_arch of Arena_16bitFullAdder is
signal Arena_16bitCout_vec : std_logic_vector(15 downto 0);
signal Arena_16bitCin_vec : std_logic_vector(15 downto 0);

begin
	-------------------------------------------- Adder Bit 0 ------------------------------------------------------
	Arena_16bitOUT_Sum_fa(0) <= Arena_16bitIN_A_fa(0) xor Arena_16bitIN_B_fa(0) xor Arena_16bitIN_Cin_fa;
	Arena_16bitCout_vec(0) <= (Arena_16bitIN_A_fa(0) and Arena_16bitIN_B_fa(0)) or (Arena_16bitIN_Cin_fa and Arena_16bitIN_A_fa(0))
	or (Arena_16bitIN_Cin_fa and Arena_16bitIN_B_fa(0));
	Arena_16bitCin_vec(1) <= Arena_16bitCout_vec(0);
	
	process( Arena_16bitCout_vec, Arena_16bitCin_vec)
	begin
		-------------------------------------------- Adder Bits 1-14 -------------------------------------------------------
		for I in 1 to 14 loop
			Arena_16bitOUT_Sum_fa(I) <= Arena_16bitIN_A_fa(I) xor Arena_16bitIN_B_fa(I) xor Arena_16bitCin_vec(I);
			Arena_16bitCout_vec(I) <= (Arena_16bitIN_A_fa(I) and Arena_16bitIN_B_fa(I)) or (Arena_16bitCin_vec(I) and Arena_16bitIN_A_fa(I))
			or (Arena_16bitCin_vec(I) and Arena_16bitIN_B_fa(I));
			Arena_16bitCin_vec(I+1) <= Arena_16bitCout_vec(I);
		end loop;
	end process;

	-------------------------------------------- Adder Bit 15 -------------------------------------------------------
	Arena_16bitOUT_Sum_fa(15) <= Arena_16bitIN_A_fa(15) xor Arena_16bitIN_B_fa(15) xor Arena_16bitCin_vec(15);
	Arena_16bitCout_vec(15) <= (Arena_16bitIN_A_fa(15) and Arena_16bitIN_B_fa(15)) or (Arena_16bitCin_vec(15) and Arena_16bitIN_A_fa(15))
	or (Arena_16bitCin_vec(15) and Arena_16bitIN_B_fa(15));
	Arena_16bitOUT_Cout_fa <= Arena_16bitCout_vec(15);
	

	
end Arena_16bitFullAdder_arch;