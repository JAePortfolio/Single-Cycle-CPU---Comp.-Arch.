library verilog;
use verilog.vl_types.all;
entity Arena_SRAM is
    port(
        Arena_OUT       : out    vl_logic;
        Arena_IN        : in     vl_logic;
        Arena_Select_Chip: in     vl_logic;
        Arena_Write_Enable: in     vl_logic
    );
end Arena_SRAM;
