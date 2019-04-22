library verilog;
use verilog.vl_types.all;
entity Arena_fullAdder is
    port(
        Arena_A_fa      : in     vl_logic;
        Arena_B_fa      : in     vl_logic;
        Arena_Cin_fa    : in     vl_logic;
        Arena_Sum_fa    : out    vl_logic;
        Arena_Cout_fa   : out    vl_logic
    );
end Arena_fullAdder;
