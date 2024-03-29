library verilog;
use verilog.vl_types.all;
entity Arena_16x4_SRAM_with_Decoder is
    port(
        Arena_segment_A : out    vl_logic;
        Arena_WE        : in     vl_logic;
        Arena_CS        : in     vl_logic;
        Arena_OE        : in     vl_logic;
        Arena_Address   : in     vl_logic_vector(3 downto 0);
        Arena_DataIn    : in     vl_logic_vector(3 downto 0);
        Arena_segment_B : out    vl_logic;
        Arena_segment_C : out    vl_logic;
        Arena_segment_D : out    vl_logic;
        Arena_segment_E : out    vl_logic;
        Arena_segment_F : out    vl_logic;
        Arena_segment_G : out    vl_logic
    );
end Arena_16x4_SRAM_with_Decoder;
