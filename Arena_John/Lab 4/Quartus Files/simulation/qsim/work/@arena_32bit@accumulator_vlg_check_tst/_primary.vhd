library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator_vlg_check_tst is
    port(
        Arena_Cout_32bit: in     vl_logic;
        Arena_Q         : in     vl_logic_vector(31 downto 0);
        Arena_Sum_32bit : in     vl_logic_vector(31 downto 0);
        Arena_Sum_Immediate: in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bitAccumulator_vlg_check_tst;