library verilog;
use verilog.vl_types.all;
entity Arena_mux2to1 is
    port(
        Arena_X         : in     vl_logic;
        Arena_Y         : in     vl_logic;
        Arena_S         : in     vl_logic;
        Arena_M         : out    vl_logic
    );
end Arena_mux2to1;
