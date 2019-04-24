library verilog;
use verilog.vl_types.all;
entity Arena_16bitFullAdder_vlg_check_tst is
    port(
        Arena_16bitOUT_Cout_fa: in     vl_logic;
        Arena_16bitOUT_Sum_fa: in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_16bitFullAdder_vlg_check_tst;
