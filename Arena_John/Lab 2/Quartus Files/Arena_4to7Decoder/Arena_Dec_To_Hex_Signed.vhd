-- (First, Last) John Arena - CSC 342/343 - Lab 2 - Spring 2019 Due: 3/13/19
-- Arena_Dec_To_Hex.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Hexadecimal to 7 segment decoder for LED display
entity Arena_Dec_To_Hex_Signed is
    port(
        Arena_hexDigit : in std_logic_vector(3 downto 0); -- inputs
        Arena_signedSwitch : in std_logic;
        Arena_segment_A, Arena_segment_B, Arena_segment_C, --outputs of segments 
        Arena_segment_D, Arena_segment_E, Arena_segment_F, 
        Arena_segment_G : out std_logic;
		  Arena_signedSegment_A, Arena_signedSegment_B, Arena_signedSegment_C, -- outputs of segments for sign + or -
		  Arena_signedSegment_D, Arena_signedSegment_E, Arena_signedSegment_F,
		  Arena_signedSegment_G : out std_logic
        );
end Arena_Dec_To_Hex_Signed;
architecture Arena_Arch_Dec_To_Hex_Signed of Arena_Dec_To_Hex_Signed is
    signal Arena_segment_data : std_logic_vector(6 downto 0);
    signal Arena_hexDigit_converted : signed(3 downto 0);
    signal Arena_signedSegment_data : std_logic_vector(6 downto 0);
begin
Arena_hexDigit_converted <= signed(Arena_hexDigit);
process(Arena_signedSwitch)
begin
case Arena_signedSwitch is
    when '1' =>
            case Arena_hexDigit_converted is
                when "0000" => --0 
                Arena_segment_data <= "1111110";
                when "0001" => --1
                Arena_segment_data <= "0110000";
                when "0010" => --2
                Arena_segment_data <= "1101101";
                when "0011" => --3
                Arena_segment_data <= "1111001";
                when "0100" => --4
                Arena_segment_data <= "0110011";
                when "0101" => --5
                Arena_segment_data <= "1011011";
                when "0110" => --6
                Arena_segment_data <= "1011111";
                when "0111" => --7
                Arena_segment_data <= "1110000";
                when "1000" => --8
                Arena_segment_data <= "1111111";
                when "1001" => -- -7
                Arena_segment_data <= "1110000";
                when "1010" => -- -6
                Arena_segment_data <= "1011111";
                when "1011" => -- -5
                Arena_segment_data <= "1011011";
                when "1100" => -- -4
                Arena_segment_data <= "0110011";
                when "1101" => -- -3
                Arena_segment_data <= "1111001";
                when "1110" => -- -2
                Arena_segment_data <= "1101101";
                when "1111" => -- -1
                Arena_segment_data <= "0110000";
            end case;
            Arena_signedSegment_data <= "0000001";
    when '0' =>
            case Arena_hexDigit is
                when "0000" => 
                Arena_segment_data <= "1111110";
                when "0001" => 
                Arena_segment_data <= "0110000";
                when "0010" => 
                Arena_segment_data <= "1101101";
                when "0011" => 
                Arena_segment_data <= "1111001";
                when "0100" => 
                Arena_segment_data <= "0110011";
                when "0101" => 
                Arena_segment_data <= "1011011";
                when "0110" => 
                Arena_segment_data <= "1011111";
                when "0111" => 
                Arena_segment_data <= "1110000";
                when "1000" => 
                Arena_segment_data <= "1111111";
                when "1001" => 
                Arena_segment_data <= "1110011";
                when "1010" => 
                Arena_segment_data <= "1110111";
                when "1011" => 
                Arena_segment_data <= "0011111";
                when "1100" => 
                Arena_segment_data <= "1001110";
                when "1101" => 
                Arena_segment_data <= "0111101";
                when "1110" => 
                Arena_segment_data <= "1001111";
                when "1111" => 
                Arena_segment_data <= "1000111";
            end case;
            Arena_signedSegment_data <= "0110001";
    when others =>
        null;
end case;
end process;
--extract segment data bits and invert since operates on low
-- led driver circuit is inverted
Arena_segment_A <= NOT Arena_segment_data(6); --NOT gate cause the segments respond to active low
Arena_segment_B <= NOT Arena_segment_data(5);
Arena_segment_C <= NOT Arena_segment_data(4);
Arena_segment_D <= NOT Arena_segment_data(3);
Arena_segment_E <= NOT Arena_segment_data(2);
Arena_segment_F <= NOT Arena_segment_data(1);
Arena_segment_G <= NOT Arena_segment_data(0);

Arena_signedSegment_A <= NOT Arena_signedSegment_data(6);
Arena_signedSegment_B <= NOT Arena_signedSegment_data(5);
Arena_signedSegment_C <= NOT Arena_signedSegment_data(4);
Arena_signedSegment_D <= NOT Arena_signedSegment_data(3);
Arena_signedSegment_E <= NOT Arena_signedSegment_data(2);
Arena_signedSegment_F <= NOT Arena_signedSegment_data(1);
Arena_signedSegment_G <= NOT Arena_signedSegment_data(0);
end Arena_Arch_Dec_To_Hex_Signed;