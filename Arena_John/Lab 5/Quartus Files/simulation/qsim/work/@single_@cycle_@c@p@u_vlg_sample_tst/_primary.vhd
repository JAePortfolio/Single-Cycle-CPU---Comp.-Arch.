library verilog;
use verilog.vl_types.all;
entity Single_Cycle_CPU_vlg_sample_tst is
    port(
        Arena_button    : in     vl_logic;
        Arena_clk       : in     vl_logic;
        Arena_octalBits : in     vl_logic_vector(7 downto 0);
        Arena_octalOpcode: in     vl_logic_vector(1 downto 0);
        DRAM_CKE        : in     vl_logic;
        DRAM_CLK        : in     vl_logic;
        INPUT_WE        : in     vl_logic;
        instr           : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Single_Cycle_CPU_vlg_sample_tst;
