library verilog;
use verilog.vl_types.all;
entity Arena_FullAdder is
    port(
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        Arena_CarryIn   : in     vl_logic;
        Arena_Sum       : out    vl_logic;
        Arena_CarryOut  : out    vl_logic
    );
end Arena_FullAdder;
