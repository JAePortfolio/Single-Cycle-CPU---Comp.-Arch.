library verilog;
use verilog.vl_types.all;
entity Arena_Sign_Extend_16to32_vlg_sample_tst is
    port(
        Arena_16bit_IMMEDIATE_IN: in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_Sign_Extend_16to32_vlg_sample_tst;
