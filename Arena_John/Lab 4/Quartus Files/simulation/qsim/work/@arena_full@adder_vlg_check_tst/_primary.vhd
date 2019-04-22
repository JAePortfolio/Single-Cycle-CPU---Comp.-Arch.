library verilog;
use verilog.vl_types.all;
entity Arena_fullAdder_vlg_check_tst is
    port(
        Arena_Cout_fa   : in     vl_logic;
        Arena_Sum_fa    : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_fullAdder_vlg_check_tst;
