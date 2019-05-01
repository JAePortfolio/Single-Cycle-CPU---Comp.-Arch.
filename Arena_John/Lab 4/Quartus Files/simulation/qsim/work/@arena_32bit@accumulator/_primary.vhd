library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator is
    port(
        Arena_Cout_32bit: out    vl_logic;
        Arena_sub_add   : in     vl_logic;
        Arena_Cin_32bit : in     vl_logic;
        Arena_Bin_32bit : in     vl_logic;
        Arena_reset     : in     vl_logic;
        Arena_clk       : in     vl_logic;
        Arena_A_32bit   : in     vl_logic_vector(31 downto 0);
        Arena_Bout_32bit: out    vl_logic;
        Arena_AccumOut_32bit: out    vl_logic_vector(31 downto 0)
    );
end Arena_32bitAccumulator;
