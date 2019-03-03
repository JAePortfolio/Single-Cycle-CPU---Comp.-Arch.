library verilog;
use verilog.vl_types.all;
entity Arena_4to16Decoder_vlg_sample_tst is
    port(
        Arena_In        : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_4to16Decoder_vlg_sample_tst;
