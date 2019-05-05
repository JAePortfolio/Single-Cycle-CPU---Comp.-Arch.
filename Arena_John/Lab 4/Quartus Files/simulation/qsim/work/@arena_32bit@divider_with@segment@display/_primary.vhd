library verilog;
use verilog.vl_types.all;
entity Arena_32bitDivider_withSegmentDisplay is
    port(
        Arena_segment1_A: out    vl_logic;
        Arena_Quotient_32bit: out    vl_logic_vector(31 downto 0);
        Arena_startDivision: in     vl_logic;
        Arena_button    : in     vl_logic_vector(3 downto 0);
        Arena_octalBits : in     vl_logic_vector(15 downto 0);
        Arena_segment1_B: out    vl_logic;
        Arena_segment1_C: out    vl_logic;
        Arena_segment1_D: out    vl_logic;
        Arena_segment1_E: out    vl_logic;
        Arena_segment1_F: out    vl_logic;
        Arena_segment1_G: out    vl_logic;
        Arena_segment2_A: out    vl_logic;
        Arena_segment2_B: out    vl_logic;
        Arena_segment2_C: out    vl_logic;
        Arena_segment2_D: out    vl_logic;
        Arena_segment2_E: out    vl_logic;
        Arena_segment2_F: out    vl_logic;
        Arena_segment2_G: out    vl_logic;
        Arena_segment3_A: out    vl_logic;
        Arena_segment3_C: out    vl_logic;
        Arena_segment3_D: out    vl_logic;
        Arena_segment3_E: out    vl_logic;
        Arena_segment3_F: out    vl_logic;
        Arena_segment3_G: out    vl_logic;
        Arena_segment3_B: out    vl_logic;
        Arena_segment4_A: out    vl_logic;
        Arena_segment4_B: out    vl_logic;
        Arena_segment4_C: out    vl_logic;
        Arena_segment4_D: out    vl_logic;
        Arena_segment4_E: out    vl_logic;
        Arena_segment4_F: out    vl_logic;
        Arena_segment4_G: out    vl_logic;
        Arena_segment5_A: out    vl_logic;
        Arena_segment5_B: out    vl_logic;
        Arena_segment5_C: out    vl_logic;
        Arena_segment5_D: out    vl_logic;
        Arena_segment5_E: out    vl_logic;
        Arena_segment5_F: out    vl_logic;
        Arena_segment5_G: out    vl_logic;
        Arena_segment6_A: out    vl_logic;
        Arena_segment6_B: out    vl_logic;
        Arena_segment6_C: out    vl_logic;
        Arena_segment6_D: out    vl_logic;
        Arena_segment6_E: out    vl_logic;
        Arena_segment6_F: out    vl_logic;
        Arena_segment6_G: out    vl_logic;
        Arena_segment7_A: out    vl_logic;
        Arena_segment7_B: out    vl_logic;
        Arena_segment7_C: out    vl_logic;
        Arena_segment7_D: out    vl_logic;
        Arena_segment7_E: out    vl_logic;
        Arena_segment7_F: out    vl_logic;
        Arena_segment7_G: out    vl_logic;
        Arena_segment8_A: out    vl_logic;
        Arena_segment8_B: out    vl_logic;
        Arena_segment8_C: out    vl_logic;
        Arena_segment8_D: out    vl_logic;
        Arena_segment8_E: out    vl_logic;
        Arena_segment8_F: out    vl_logic;
        Arena_segment8_G: out    vl_logic;
        Arena_Remainder_32bit: out    vl_logic_vector(31 downto 0)
    );
end Arena_32bitDivider_withSegmentDisplay;
