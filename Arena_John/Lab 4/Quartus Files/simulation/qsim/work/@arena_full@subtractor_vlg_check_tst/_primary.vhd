library verilog;
use verilog.vl_types.all;
entity Arena_fullSubtractor_vlg_check_tst is
    port(
        Arena_Bout_fs   : in     vl_logic;
        Arena_Difference_fs: in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_fullSubtractor_vlg_check_tst;
