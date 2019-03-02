library verilog;
use verilog.vl_types.all;
entity Arena_16x1_SRAM_vlg_sample_tst is
    port(
        Arena_CS        : in     vl_logic_vector(15 downto 0);
        Arena_IN        : in     vl_logic;
        Arena_WE        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_16x1_SRAM_vlg_sample_tst;
