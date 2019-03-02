library verilog;
use verilog.vl_types.all;
entity Arena_Control_SRLatch_vlg_sample_tst is
    port(
        Arena_C         : in     vl_logic;
        Arena_R         : in     vl_logic;
        Arena_S         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_Control_SRLatch_vlg_sample_tst;
