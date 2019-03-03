library verilog;
use verilog.vl_types.all;
entity Arena_4to16Decoder_vlg_check_tst is
    port(
        Arena_Dec       : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_4to16Decoder_vlg_check_tst;
