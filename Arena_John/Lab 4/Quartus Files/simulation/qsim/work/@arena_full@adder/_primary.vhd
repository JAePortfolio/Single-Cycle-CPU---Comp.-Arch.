library verilog;
use verilog.vl_types.all;
entity Arena_fullAdder is
    port(
        Arena_A         : in     vl_logic;
        Arena_B         : in     vl_logic;
        Arena_Cin       : in     vl_logic;
        Arena_Sum       : out    vl_logic;
        Arena_Cout      : out    vl_logic
    );
end Arena_fullAdder;
