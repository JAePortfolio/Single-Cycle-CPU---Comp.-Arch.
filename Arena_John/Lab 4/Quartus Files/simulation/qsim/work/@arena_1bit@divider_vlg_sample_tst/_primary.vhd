library verilog;
use verilog.vl_types.all;
entity Arena_1bitDivider_vlg_sample_tst is
    port(
        Arena_Bin_fs    : in     vl_logic;
        Arena_M_fs      : in     vl_logic;
        Arena_OKi       : in     vl_logic;
        Arena_S_fs      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_1bitDivider_vlg_sample_tst;
