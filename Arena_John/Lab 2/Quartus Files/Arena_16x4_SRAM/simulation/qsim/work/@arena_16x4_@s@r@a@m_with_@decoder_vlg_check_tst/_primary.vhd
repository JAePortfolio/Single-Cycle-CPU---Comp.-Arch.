library verilog;
use verilog.vl_types.all;
entity Arena_16x4_SRAM_with_Decoder_vlg_check_tst is
    port(
        Arena_segment_A : in     vl_logic;
        Arena_segment_B : in     vl_logic;
        Arena_segment_C : in     vl_logic;
        Arena_segment_D : in     vl_logic;
        Arena_segment_E : in     vl_logic;
        Arena_segment_F : in     vl_logic;
        Arena_segment_G : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_16x4_SRAM_with_Decoder_vlg_check_tst;
