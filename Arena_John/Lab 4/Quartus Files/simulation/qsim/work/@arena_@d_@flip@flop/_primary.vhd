library verilog;
use verilog.vl_types.all;
entity Arena_D_FlipFlop is
    port(
        Arena_D         : in     vl_logic;
        Arena_Q         : out    vl_logic;
        Arena_clk       : in     vl_logic
    );
end Arena_D_FlipFlop;
