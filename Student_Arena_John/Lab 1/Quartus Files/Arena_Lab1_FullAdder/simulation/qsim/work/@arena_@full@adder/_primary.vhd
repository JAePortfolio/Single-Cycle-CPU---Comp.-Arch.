library verilog;
use verilog.vl_types.all;
entity Arena_FullAdder is
    port(
        Arena_X1        : in     vl_logic;
        Arena_Y1        : in     vl_logic;
        Arena_CarryIn1  : in     vl_logic;
        Arena_Sum       : out    vl_logic;
        Arena_CarryOut  : out    vl_logic
    );
end Arena_FullAdder;
