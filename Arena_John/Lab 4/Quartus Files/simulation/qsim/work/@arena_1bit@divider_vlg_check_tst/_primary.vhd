library verilog;
use verilog.vl_types.all;
entity Arena_1bitDivider_vlg_check_tst is
    port(
        Arena_Bout_fs   : in     vl_logic;
        Arena_Difference_fs: in     vl_logic;
        Arena_OKo       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_1bitDivider_vlg_check_tst;
