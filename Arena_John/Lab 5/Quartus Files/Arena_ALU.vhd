-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_ALU.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Arena_ALU is
	port(
		Arena_IN_A: in std_logic_vector(31 downto 0); -- 32 bit input A
		Arena_IN_B: in std_logic_vector(31 downto 0); -- 32 bit input B
		Arena_ALU_IN_Operation: in std_logic_vector(3 downto 0); -- Operation input
		Arena_ALU_OUT: out std_logic_vector(31 downto 0); -- 32 bit output of ALU
		Arena_ALU_Zero: out std_logic -- zero flag branch, set less than, etc.
		);
end Arena_ALU;

architecture Arena_ALU_arch of Arena_ALU is
signal Arena_sign_conv_A : signed(31 downto 0);
signal Arena_sign_conv_B : signed(31 downto 0);
signal Arena_arithmetic_conv : signed (31 downto 0);
begin
	process(Arena_ALU_IN_Operation) 
	begin 
		case Arena_ALU_IN_Operation is
			when "0000" => -- Operation bitwise AND
			Arena_ALU_OUT <= Arena_IN_A and ARENA_IN_B;
			when "0001" => -- Operation bitwise OR
			Arena_ALU_OUT <= Arena_IN_A or ARENA_IN_B;
			when "0010" => -- Operation ADDITION
				Arena_sign_conv_A <= signed(Arena_IN_A);
				Arena_sign_conv_B <= signed(Arena_IN_B);
				Arena_arithmetic_conv <= Arena_sign_conv_A + Arena_sign_conv_B;
				Arena_ALU_OUT <= std_logic_vector(Arena_arithmetic_conv);
			when "0110" => -- Operation SUBTRACT
				Arena_sign_conv_A <= signed(Arena_IN_A);
				Arena_sign_conv_B <= signed(Arena_IN_B);
				Arena_arithmetic_conv <= Arena_sign_conv_A - Arena_sign_conv_B;
				Arena_ALU_OUT <= std_logic_vector(Arena_arithmetic_conv);
			when "0111" => -- Set on less than
				if(Arena_IN_A < Arena_IN_B) then
					Arena_ALU_Zero <= '1';
				else 
					Arena_ALU_Zero <= '0';
				end if;
			when others =>
			null;
		end case;
	end process;
end Arena_ALU_arch;