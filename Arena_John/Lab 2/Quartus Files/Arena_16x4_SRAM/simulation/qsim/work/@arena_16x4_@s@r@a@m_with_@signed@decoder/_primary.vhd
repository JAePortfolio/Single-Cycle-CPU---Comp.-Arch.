library verilog;
use verilog.vl_types.all;
entity Arena_16x4_SRAM_with_SignedDecoder is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        auto_stp_external_clock_0: in     vl_logic;
        Arena_segment_A : out    vl_logic;
        Arena_signedSwitch: in     vl_logic;
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
        Arena_segment_G : out    vl_logic;
        Arena_signedSegment_A: out    vl_logic;
        Arena_signedSegment_B: out    vl_logic;
        Arena_signedSegment_C: out    vl_logic;
        Arena_signedSegment_D: out    vl_logic;
        Arena_signedSegment_E: out    vl_logic;
        Arena_signedSegment_F: out    vl_logic;
        Arena_signedSegment_G: out    vl_logic
    );
end Arena_16x4_SRAM_with_SignedDecoder;
