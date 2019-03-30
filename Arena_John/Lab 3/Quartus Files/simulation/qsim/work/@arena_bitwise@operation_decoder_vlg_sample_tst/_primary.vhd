library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseOperation_decoder_vlg_sample_tst is
    port(
        Arena_opcode    : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_bitwiseOperation_decoder_vlg_sample_tst;
