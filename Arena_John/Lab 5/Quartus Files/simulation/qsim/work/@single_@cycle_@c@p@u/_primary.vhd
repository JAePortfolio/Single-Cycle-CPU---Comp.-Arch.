library verilog;
use verilog.vl_types.all;
entity Single_Cycle_CPU is
    port(
        SRAM_CE_N       : out    vl_logic;
        INPUT_WE        : in     vl_logic;
        DRAM_CKE        : in     vl_logic;
        DRAM_CLK        : in     vl_logic;
        DRAM_DQ         : inout  vl_logic_vector(15 downto 0);
        Arena_clk       : in     vl_logic;
        Arena_button    : in     vl_logic;
        Arena_octalBits : in     vl_logic_vector(7 downto 0);
        Arena_octalOpcode: in     vl_logic_vector(1 downto 0);
        SRAM_DQ         : inout  vl_logic_vector(15 downto 0);
        SRAM_OE_N       : out    vl_logic;
        SRAM_WE_N       : out    vl_logic;
        SRAM_UB_N       : out    vl_logic;
        SRAM_LB_N       : out    vl_logic;
        DRAM_CE_N       : out    vl_logic;
        DRAM_OE_N       : out    vl_logic;
        DRAM_WE_N       : out    vl_logic;
        DRAM_LDQM       : out    vl_logic;
        DRAM_UDQM       : out    vl_logic;
        aluOP           : out    vl_logic_vector(2 downto 0);
        Arena_PC        : out    vl_logic_vector(31 downto 0);
        controlLine     : out    vl_logic_vector(6 downto 0);
        operation       : out    vl_logic_vector(3 downto 0);
        out_instruc     : out    vl_logic_vector(31 downto 0);
        readData1       : out    vl_logic_vector(31 downto 0);
        readData2       : out    vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        SDRAM_ADDR      : out    vl_logic_vector(11 downto 0);
        SRAM_ADDR       : out    vl_logic_vector(17 downto 0);
        instr           : in     vl_logic_vector(31 downto 0)
    );
end Single_Cycle_CPU;
