library verilog;
use verilog.vl_types.all;
entity Arena_16x1_SRAM is
    port(
        Arena_OUT0      : out    vl_logic;
        Arena_IN        : in     vl_logic;
        Arena_CS        : in     vl_logic_vector(0 to 15);
        Arena_WE        : in     vl_logic
    );
end Arena_16x1_SRAM;
