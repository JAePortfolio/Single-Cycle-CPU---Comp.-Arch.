library verilog;
use verilog.vl_types.all;
entity Arena_FullAdder_vlg_sample_tst is
    port(
        Arena_CarryIn   : in     vl_logic;
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_FullAdder_vlg_sample_tst;
