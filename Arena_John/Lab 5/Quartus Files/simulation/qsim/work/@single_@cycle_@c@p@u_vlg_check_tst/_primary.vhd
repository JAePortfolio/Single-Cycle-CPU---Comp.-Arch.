library verilog;
use verilog.vl_types.all;
entity Single_Cycle_CPU_vlg_check_tst is
    port(
        aluOP           : in     vl_logic_vector(2 downto 0);
        controlLine     : in     vl_logic_vector(6 downto 0);
        DRAM_CE_N       : in     vl_logic;
        DRAM_LDQM       : in     vl_logic;
        DRAM_OE_N       : in     vl_logic;
        DRAM_UDQM       : in     vl_logic;
        DRAM_WE_N       : in     vl_logic;
        operation       : in     vl_logic_vector(3 downto 0);
        out_instruc     : in     vl_logic_vector(31 downto 0);
        readData1       : in     vl_logic_vector(31 downto 0);
        readData2       : in     vl_logic_vector(31 downto 0);
        result          : in     vl_logic_vector(31 downto 0);
        SRAM_CE_N       : in     vl_logic;
        SRAM_LB_N       : in     vl_logic;
        SRAM_OE_N       : in     vl_logic;
        SRAM_UB_N       : in     vl_logic;
        SRAM_WE_N       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Single_Cycle_CPU_vlg_check_tst;
