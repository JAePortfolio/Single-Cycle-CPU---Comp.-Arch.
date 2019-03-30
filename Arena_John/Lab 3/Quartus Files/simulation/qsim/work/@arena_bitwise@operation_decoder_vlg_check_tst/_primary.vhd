library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseOperation_decoder_vlg_check_tst is
    port(
        Arena_opSelect  : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_bitwiseOperation_decoder_vlg_check_tst;
