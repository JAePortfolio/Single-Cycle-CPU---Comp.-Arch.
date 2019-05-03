library verilog;
use verilog.vl_types.all;
entity Arena_fullSubtractor is
    port(
        Arena_S_fs      : in     vl_logic;
        Arena_M_fs      : in     vl_logic;
        Arena_Bin_fs    : in     vl_logic;
        Arena_Difference_fs: out    vl_logic;
        Arena_Bout_fs   : out    vl_logic
    );
end Arena_fullSubtractor;
