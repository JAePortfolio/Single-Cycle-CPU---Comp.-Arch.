library verilog;
use verilog.vl_types.all;
entity Arena_DLatch_vlg_sample_tst is
    port(
        Arena_C         : in     vl_logic;
        Arena_D         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_DLatch_vlg_sample_tst;
