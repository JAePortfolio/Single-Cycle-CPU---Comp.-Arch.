library verilog;
use verilog.vl_types.all;
entity Arena_HalfAdder_vlg_sample_tst is
    port(
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_HalfAdder_vlg_sample_tst;
