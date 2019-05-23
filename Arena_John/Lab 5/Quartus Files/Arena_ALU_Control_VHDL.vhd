-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_ALU_Control_VHDL.vhd

library ieee;
use ieee.std_logic_1164.all;


entity Arena_ALU_Control_VHDL is
	port(
		Arena_ALUop: in std_logic_vector(2 downto 0); -- op code
		Arena_func: in std_logic_vector(5 downto 0); -- func code
		Arena_operation: out std_logic_vector(3 downto 0) -- operation out
		);
end Arena_ALU_Control_VHDL;

architecture Arena_ALU_Control_VHDL_arch of Arena_ALU_Control_VHDL is
begin
	process (Arena_func, Arena_ALUop)
	begin 
		case Arena_func is
			when "000000" => -- Add
				if(Arena_ALUop = "010") then
					Arena_operation <= "0010";
				else
					null;
				end if;
			when "010000" => -- Add
				if(Arena_ALUop = "010") then
					Arena_operation <= "0010";
				else
					null;
				end if;
			when "100000" => -- Add
				if(Arena_ALUop = "010") then
					Arena_operation <= "0010";
				else
					null;
				end if;
			when "110000" => -- Add
				if(Arena_ALUop = "010") then
					Arena_operation <= "0010";
				else
					null;
				end if;
				
				
			when "000010" => -- Sub
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0110";
				else
					null;
				end if;				
			when "010010" => -- Sub
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0110";
				else
					null;
				end if;				
			when "100010" => -- Sub
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0110";
				else
					null;
				end if;				
			when "110010" => -- Sub
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0110";
				else
					null;
				end if;
				
								
			when "000100" => -- AND
				if(Arena_ALUop = "010") then
					Arena_operation <= "0000";
				else
					null;
				end if;								
			when "010100" => -- AND
				if(Arena_ALUop = "010") then
					Arena_operation <= "0000";
				else
					null;
				end if;								
			when "100100" => -- AND
				if(Arena_ALUop = "010") then
					Arena_operation <= "0000";
				else
					null;
				end if;								
			when "110100" => -- AND
				if(Arena_ALUop = "010") then
					Arena_operation <= "0000";
				else
					null;
				end if;
					
			when "000101" => -- OR
				if(Arena_ALUop = "010") then
					Arena_operation <= "0001";
				else
					null;
				end if;					
			when "010101" => -- OR
				if(Arena_ALUop = "10") then
					Arena_operation <= "0001";
				else
					null;
				end if;					
			when "100101" => -- OR
				if(Arena_ALUop = "010") then
					Arena_operation <= "0001";
				else
					null;
				end if;					
			when "110101" => -- OR
				if(Arena_ALUop = "010") then
					Arena_operation <= "0001";
				else
					null;
				end if;
									
			when "001010" => -- Set Less Than
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0111";
				else
					null;
				end if;									
			when "011010" => -- Set Less Than
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0111";
				else
					null;
				end if;									
			when "101010" => -- Set Less Than
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0111";
				else
					null;
				end if;							
			when "111010" => -- Set Less Than
				if(Arena_ALUop = "010" or Arena_ALUop = "011") then
					Arena_operation <= "0111";
				else
					null;
				end if;
			when others =>
			null;
		end case;
		case Arena_ALUop is
			when "000" => -- Add for SW/LW
				Arena_operation <= "0010";
			when "001" => -- Sub for BEQ
				Arena_operation <= "0110";
			when "111" => -- OR for ORI
				Arena_operation <= "0001";
			when others =>
				null;
		end case;
	end process;
end Arena_ALU_Control_VHDL_arch;