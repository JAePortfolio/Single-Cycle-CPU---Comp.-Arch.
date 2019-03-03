library verilog;
use verilog.vl_types.all;
entity Arena_SRAM_vlg_sample_tst is
    port(
        Arena_IN        : in     vl_logic;
        Arena_Select_Chip: in     vl_logic;
        Arena_Write_Enable: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_SRAM_vlg_sample_tst;
