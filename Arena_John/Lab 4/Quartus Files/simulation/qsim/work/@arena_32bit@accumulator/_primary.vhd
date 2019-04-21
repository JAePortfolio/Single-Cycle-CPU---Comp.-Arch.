library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator is
    port(
        Arena_Cout_32bit: out    vl_logic;
        Arena_Cin_32bit : in     vl_logic;
        Arena_clk       : in     vl_logic;
        Arena_A_32bit   : in     vl_logic_vector(31 downto 0);
        Arena_Q         : out    vl_logic_vector(31 downto 0);
        Arena_Sum_32bit : out    vl_logic_vector(31 downto 0);
        Arena_Sum_Immediate: out    vl_logic_vector(31 downto 0)
    );
end Arena_32bitAccumulator;
