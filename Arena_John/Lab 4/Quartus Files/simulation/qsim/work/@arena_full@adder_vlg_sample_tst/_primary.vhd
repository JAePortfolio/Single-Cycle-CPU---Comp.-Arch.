library verilog;
use verilog.vl_types.all;
entity Arena_fullAdder_vlg_sample_tst is
    port(
        Arena_A         : in     vl_logic;
        Arena_B         : in     vl_logic;
        Arena_Cin       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_fullAdder_vlg_sample_tst;
