library verilog;
use verilog.vl_types.all;
entity Arena_HalfAdder_vlg_check_tst is
    port(
        Arena_CarryOut  : in     vl_logic;
        Arena_Sum       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_HalfAdder_vlg_check_tst;
