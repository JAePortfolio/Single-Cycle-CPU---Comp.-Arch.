library verilog;
use verilog.vl_types.all;
entity Arena_mux2to1_vlg_sample_tst is
    port(
        Arena_S         : in     vl_logic;
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_mux2to1_vlg_sample_tst;
