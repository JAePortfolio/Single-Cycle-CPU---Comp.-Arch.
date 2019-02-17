library verilog;
use verilog.vl_types.all;
entity Arena_8to3Encoder_vlg_sample_tst is
    port(
        Arena_Y0        : in     vl_logic;
        Arena_Y1        : in     vl_logic;
        Arena_Y2        : in     vl_logic;
        Arena_Y3        : in     vl_logic;
        Arena_Y4        : in     vl_logic;
        Arena_Y5        : in     vl_logic;
        Arena_Y6        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_8to3Encoder_vlg_sample_tst;
