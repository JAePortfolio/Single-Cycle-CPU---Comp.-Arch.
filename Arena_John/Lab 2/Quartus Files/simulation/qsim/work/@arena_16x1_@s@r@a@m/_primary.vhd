library verilog;
use verilog.vl_types.all;
entity Arena_16x1_SRAM is
    port(
        Arena_OUT       : out    vl_logic;
        Arena_IN        : in     vl_logic;
        Arena_CS        : in     vl_logic_vector(15 downto 0);
        Arena_WE        : in     vl_logic
    );
end Arena_16x1_SRAM;
