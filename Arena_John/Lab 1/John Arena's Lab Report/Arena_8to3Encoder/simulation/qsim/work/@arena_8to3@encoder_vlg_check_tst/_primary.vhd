library verilog;
use verilog.vl_types.all;
entity Arena_8to3Encoder_vlg_check_tst is
    port(
        Arena_F0        : in     vl_logic;
        Arena_F1        : in     vl_logic;
        Arena_F2        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_8to3Encoder_vlg_check_tst;
