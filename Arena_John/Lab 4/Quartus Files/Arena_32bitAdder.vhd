-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bitAdder.vhd
library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bitAdder is
port(
	Arena_A_32bit, Arena_B_32bit: in std_logic_vector(31 downto 0);
	Arena_sub_add: in std_logic; -- 1 = subtraciton, 0 = addition
	Arena_Cin_32bit : in std_logic; -- Carry for addition, also used for borrowing in subtraction
	Arena_Bin_32bit : in std_logic; -- Borrow in
	Arena_Sum_32bit : out std_logic_vector(31 downto 0);
	Arena_Difference_32bit : out std_logic_vector(31 downto 0);
	Arena_Cout_32bit : out std_logic; -- Carry out
	Arena_Bout_32bit : out std_logic -- Borrow out
	);
end Arena_32bitAdder;

architecture Arena_32bitAdder_arch of Arena_32bitAdder is 
--	component Arena_32bitAdder_comp -- Component
--		port(
--			Arena_A_1bit, Arena_B_1bit, Arena_Cin_1bit : in std_logic;
--			Arena_Sum_1bit, Arena_Cout_1bit : out std_logic
--		);
--	end component;
--	signal Arena_c1, Arena_c2, Arena_c3 : std_logic;
--	begin 
--		FA1: Arena_32bitAdder_comp port map (Arena_A_32bit(0), Arena_B_32bit(0), Arena_Cin_32bit, Arena_Sum_32bit(0), Arena_c1);
--		FA2: Arena_32bitAdder_comp port map (Arena_A_32bit(1), Arena_B_32bit(1), Arena_c1, Arena_Sum_32bit(1), Arena_c2);
--		FA3: Arena_32bitAdder_comp port map (Arena_A_32bit(2), Arena_B_32bit(2), Arena_c2, Arena_Sum_32bit(2), Arena_c3);
--		FA4: Arena_32bitAdder_comp port map (Arena_A_32bit(3), Arena_B_32bit(3), Arena_c3, Arena_Sum_32bit(3), Arena_Cout_bit);
--	
--Arena_Sum_fa <= Arena_A_fa xor Arena_B_fa xor Arena_Cin_fa ;
--Arena_Cout_fa <= (Arena_A_fa and Arena_B_fa) or (Arena_Cin_fa and Arena_A_fa) or  (Arena_Cin_fa and Arena_B_fa);

	begin
		process(Arena_A_32bit, Arena_B_32bit, Arena_Cin_32bit, Arena_sub_add)
			variable Arena_Cin_32bit_vars : std_logic_vector(31 downto 0):= (others => '0');
			variable Arena_Cout_32bit_vars : std_logic_vector(31 downto 0):= (others => '0');
			variable Arena_Bin_32bit_vars : std_logic_vector(31 downto 0):= (others => '0');
			variable Arena_Bout_32bit_vars : std_logic_vector(31 downto 0):= (others => '0');
			
			begin
			if(Arena_sub_add = '0') then
						-- Adder 0
				Arena_Sum_32bit(0) <= Arena_A_32bit(0) xor Arena_B_32bit(0)
				xor Arena_Cin_32bit;
				
				Arena_Cout_32bit_vars(0) := (Arena_A_32bit(0) and Arena_B_32bit(0)) 
				or (Arena_Cin_32bit and Arena_A_32bit(0)) or (Arena_Cin_32bit and Arena_B_32bit(0));
				
				Arena_Cin_32bit_vars(1) := Arena_Cout_32bit_vars(0);
				for i in 1 to 30 loop
					Arena_Sum_32bit(i) <= Arena_A_32bit(i) xor Arena_B_32bit(i)
					xor Arena_Cin_32bit_vars(i);
					
					Arena_Cout_32bit_vars(i) := (Arena_A_32bit(i) and Arena_B_32bit(i)) 
					or (Arena_Cin_32bit_vars(i) and Arena_A_32bit(i)) or (Arena_Cin_32bit_vars(i) and Arena_B_32bit(i));
					
					Arena_Cin_32bit_vars(i+1) := Arena_Cout_32bit_vars(i);
				end loop;
				
				-- Adder 3
				Arena_Sum_32bit(31) <= Arena_A_32bit(31) xor Arena_B_32bit(31)
				xor Arena_Cin_32bit_vars(31);
				
				Arena_Cout_32bit <= (Arena_A_32bit(31) and Arena_B_32bit(31)) 
				or (Arena_Cin_32bit_vars(31) and Arena_A_32bit(31)) or (Arena_Cin_32bit_vars(31) and Arena_B_32bit(31));
			elsif (Arena_sub_add = '1') then
							-- Adder 0
					Arena_Difference_32bit(0) <= Arena_A_32bit(0) xor Arena_B_32bit(0)
					xor Arena_Bin_32bit;
					
					Arena_Bout_32bit_vars(0) := ((not Arena_A_32bit(0)) and Arena_Bin_32bit) 
					or ((not Arena_A_32bit(0)) and Arena_B_32bit(0)) or (Arena_Bin_32bit and Arena_B_32bit(0));
					
					Arena_Bin_32bit_vars(1) := Arena_Bout_32bit_vars(0);
					for i in 1 to 30 loop
						Arena_Difference_32bit(i) <= Arena_A_32bit(i) xor Arena_B_32bit(i)
						xor Arena_Bin_32bit_vars(i);
						
						Arena_Bout_32bit_vars(i) := ((not Arena_A_32bit(i)) and Arena_Bin_32bit_vars(i)) 
						or ((not Arena_A_32bit(i)) and Arena_B_32bit(i)) or (Arena_Bin_32bit_vars(i) and Arena_B_32bit(i));
						
						Arena_Bin_32bit_vars(i+1) := Arena_Bout_32bit_vars(i);
					end loop;
					
					-- Adder 3
					Arena_Difference_32bit(31) <= Arena_A_32bit(31) xor Arena_B_32bit(31)
					xor Arena_Bin_32bit_vars(31);
					
					Arena_Bout_32bit <= ((not Arena_A_32bit(31)) and Arena_Bin_32bit_vars(31)) 
					or ((not Arena_A_32bit(31)) and Arena_B_32bit(31)) or (Arena_Bin_32bit_vars(31) and Arena_B_32bit(31));
				else
					null;
			end if;
		end process;
		

		
		

end Arena_32bitAdder_arch;