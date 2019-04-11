library verilog;
use verilog.vl_types.all;
entity Arena_D_FlipFlop_vlg_sample_tst is
    port(
        Arena_clk       : in     vl_logic;
        Arena_D         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_D_FlipFlop_vlg_sample_tst;
