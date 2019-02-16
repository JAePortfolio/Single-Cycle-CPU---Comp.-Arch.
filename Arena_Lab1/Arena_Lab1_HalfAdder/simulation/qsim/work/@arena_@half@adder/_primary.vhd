library verilog;
use verilog.vl_types.all;
entity Arena_HalfAdder is
    port(
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        Arena_Sum       : out    vl_logic;
        Arena_CarryOut  : out    vl_logic
    );
end Arena_HalfAdder;
