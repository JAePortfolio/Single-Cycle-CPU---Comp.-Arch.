-- (First, Last) John Arena - CSC 342/343 - Lab 3 - Spring 2019 - Due 3/30/19
-- Arena_bitwise.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Arena_bitwise is
  port(
    Arena_a_bitwiseIN,Arena_b_bitwiseIN: in std_logic_vector(5 downto 0);
    Arena_result_bitwiseOUT: out std_logic_vector (5 downto 0);
	 Arena_opSelect: in std_logic;
	 Arena_opcode: in std_logic_vector (3 downto 0);
	 Arena_buttonStart: in std_logic
);
end Arena_bitwise;

architecture Arena_bitwise_arch of Arena_bitwise is
signal Arena_b_sramt_integer : integer;--Declare and assign value
signal Arena_b_slamt_integer : integer; -- Shift Left integer value declaration
signal Arena_b_rramt_integer : integer; -- Rotate Right integer value declaration
signal Arena_b_rlamt_integer : integer; -- Rotate Left integer value declaration
signal Arena_a_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion
signal Arena_b_sltuIN_integer : integer; -- Declaring variables for binary to integer conversion

signal Arena_a_sltIN_integer : integer; -- Declaring variables for binary to integer conversion
signal Arena_b_sltIN_integer : integer; -- Declaring variables for binary to integer conversion

begin
Arena_b_sramt_integer <= to_integer(unsigned(Arena_b_bitwiseIN)); -- Assign value
Arena_b_slamt_integer <= to_integer(unsigned(Arena_b_bitwiseIN)); -- Assign value
Arena_b_rramt_integer <= to_integer(unsigned(Arena_b_bitwiseIN)); -- Assign value
Arena_b_rlamt_integer <= to_integer(unsigned(Arena_b_bitwiseIN)); -- Assign value

Arena_a_sltuIN_integer <= to_integer(unsigned(Arena_a_bitwiseIN)); -- Conversion to integer
Arena_b_sltuIN_integer <= to_integer(unsigned(Arena_b_bitwiseIN)); -- Conversion to integer

Arena_a_sltIN_integer <= to_integer(signed(Arena_a_bitwiseIN)); -- Conversion to integer
Arena_b_sltIN_integer <= to_integer(signed(Arena_b_bitwiseIN)); -- Conversion to integer
process(Arena_buttonStart, Arena_opcode, Arena_a_sltuIN_integer, Arena_b_sltuIN_integer, Arena_a_sltIN_integer, Arena_b_sltIN_integer)
	begin
		if(Arena_buttonStart = '1') then 
				case Arena_opcode is
					when "0000" =>
					Arena_result_bitwiseOUT <= not Arena_a_bitwiseIN;
					when "0001" =>
					Arena_result_bitwiseOUT <= Arena_a_bitwiseIN or Arena_b_bitwiseIN;
					when "0010" =>
					Arena_result_bitwiseOUT <= Arena_a_bitwiseIN and Arena_b_bitwiseIN;
					when "0011" =>
					Arena_result_bitwiseOUT <= Arena_a_bitwiseIN xor Arena_b_bitwiseIN;
					when "0100" =>
					Arena_result_bitwiseOUT <= to_stdlogicvector(to_bitvector(Arena_a_bitwiseIN) srl Arena_b_sramt_integer);
					when "0101" =>
					Arena_result_bitwiseOUT <= to_stdlogicvector(to_bitvector(Arena_a_bitwiseIN) sll Arena_b_slamt_integer);
					when "0110" =>
					Arena_result_bitwiseOUT <= to_stdlogicvector(to_bitvector(Arena_a_bitwiseIN) ror Arena_b_rramt_integer); -- Rotate by amount
					when "0111" =>
					Arena_result_bitwiseOUT <= to_stdlogicvector(to_bitvector(Arena_a_bitwiseIN) rol Arena_b_rlamt_integer); -- Rotate left by amount
					when "1000" =>
						if(Arena_a_sltuIN_integer < Arena_b_sltuIN_integer) then -- Check if less than, if true
							Arena_result_bitwiseOUT <= "000001"; -- Set output to 1
						else
							Arena_result_bitwiseOUT <= "000000"; -- Otherwise set output to 0 if false
						end if;
					when "1001" =>
						if(Arena_a_sltIN_integer < Arena_b_sltIN_integer) then -- Check if less than, if true
							Arena_result_bitwiseOUT <= "000001"; -- Set output to 1
						else
							Arena_result_bitwiseOUT <= "000000"; -- -- Otherwise set output to 0 if false
						end if;
					When "1111" =>
					Arena_result_bitwiseOUT <= "000000";
					when others =>
					null;
				end case;
		else
			null;
		end if;
	end process;
end Arena_bitwise_arch;