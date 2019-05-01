library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator_vlg_check_tst is
    port(
        Arena_AccumOut_32bit: in     vl_logic_vector(31 downto 0);
        Arena_Bout_32bit: in     vl_logic;
        Arena_Cout_32bit: in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_32bitAccumulator_vlg_check_tst;
