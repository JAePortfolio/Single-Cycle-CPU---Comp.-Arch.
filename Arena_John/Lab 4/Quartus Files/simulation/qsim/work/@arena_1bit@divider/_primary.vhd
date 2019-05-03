library verilog;
use verilog.vl_types.all;
entity Arena_1bitDivider is
    port(
        Arena_Bout_fs   : out    vl_logic;
        Arena_S_fs      : in     vl_logic;
        Arena_M_fs      : in     vl_logic;
        Arena_Bin_fs    : in     vl_logic;
        Arena_Difference_fs: out    vl_logic;
        Arena_OKi       : in     vl_logic;
        Arena_OKo       : out    vl_logic
    );
end Arena_1bitDivider;
