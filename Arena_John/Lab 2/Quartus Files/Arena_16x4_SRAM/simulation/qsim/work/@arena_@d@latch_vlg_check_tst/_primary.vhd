library verilog;
use verilog.vl_types.all;
entity Arena_DLatch_vlg_check_tst is
    port(
        Arena_Q         : in     vl_logic;
        Arena_Q_NOT     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_DLatch_vlg_check_tst;
