library verilog;
use verilog.vl_types.all;
entity Arena_16x4_SRAM_with_Decoder_vlg_sample_tst is
    port(
        Arena_Address   : in     vl_logic_vector(3 downto 0);
        Arena_CS        : in     vl_logic;
        Arena_DataIn    : in     vl_logic_vector(3 downto 0);
        Arena_OE        : in     vl_logic;
        Arena_WE        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_16x4_SRAM_with_Decoder_vlg_sample_tst;
