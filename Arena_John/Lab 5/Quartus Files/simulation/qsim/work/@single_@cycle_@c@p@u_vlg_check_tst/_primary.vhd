library verilog;
use verilog.vl_types.all;
entity Single_Cycle_CPU_vlg_check_tst is
    port(
        DRAM_CE_N       : in     vl_logic;
        DRAM_LDQM       : in     vl_logic;
        DRAM_OE_N       : in     vl_logic;
        DRAM_UDQM       : in     vl_logic;
        DRAM_WE_N       : in     vl_logic;
        ram             : in     vl_logic_vector(31 downto 0);
        SRAM_CE_N       : in     vl_logic;
        SRAM_LB_N       : in     vl_logic;
        SRAM_OE_N       : in     vl_logic;
        SRAM_UB_N       : in     vl_logic;
        SRAM_WE_N       : in     vl_logic;
        test            : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Single_Cycle_CPU_vlg_check_tst;
