library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Hexadecimal to 7 segment33decoder for LED display

entity Arena_Seg3Decoder is
	port(
		Arena_hexDigit3 : in std_logic_vector(3 downto 0);
		Arena_segment3_A, Arena_segment3_B, Arena_segment3_C, 
		Arena_segment3_D, Arena_segment3_E, Arena_segment3_F, 
		Arena_segment3_G : out std_logic
		);
end Arena_Seg3Decoder;

architecture Arena_Arch_Seg3Decoder of Arena_Seg3Decoder is
	signal Arena_segment3_data : std_logic_vector(6 downto 0);
begin
	process (Arena_hexDigit3)
	-- Hex to 7 segment33decoder 
	begin 
		case Arena_hexDigit3 is
			when "0000" => 
			Arena_segment3_data <= "1111110";
			when "0001" => 
			Arena_segment3_data <= "0110000";
			when "0010" => 
			Arena_segment3_data <= "1101101";
			when "0011" => 
			Arena_segment3_data <= "1111001";
			when "0100" => 
			Arena_segment3_data <= "0110011";
			when "0101" => 
			Arena_segment3_data <= "1011011";
			when "0110" => 
			Arena_segment3_data <= "1011111";
			when "0111" => 
			Arena_segment3_data <= "1110000";
			when "1000" => 
			Arena_segment3_data <= "1111111";
			when "1001" => 
			Arena_segment3_data <= "1110011";
			when "1010" => 
			Arena_segment3_data <= "1110111";
			when "1011" => 
			Arena_segment3_data <= "0011111";
			when "1100" => 
			Arena_segment3_data <= "1001110";
			when "1101" => 
			Arena_segment3_data <= "0111101";
			when "1110" => 
			Arena_segment3_data <= "1001111";
			when "1111" => 
			Arena_segment3_data <= "1000111";
		end case;
	end process;
--extract segment33data bits and invert since operates on low
-- led driver circuit is inverted
Arena_segment3_A <= NOT Arena_segment3_data(6);
Arena_segment3_B <= NOT Arena_segment3_data(5);
Arena_segment3_C <= NOT Arena_segment3_data(4);
Arena_segment3_D <= NOT Arena_segment3_data(3);
Arena_segment3_E <= NOT Arena_segment3_data(2);
Arena_segment3_F <= NOT Arena_segment3_data(1);
Arena_segment3_G <= NOT Arena_segment3_data(0);
end Arena_Arch_Seg3Decoder;