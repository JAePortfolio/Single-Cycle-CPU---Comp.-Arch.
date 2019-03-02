library verilog;
use verilog.vl_types.all;
entity Arena_3to8Decoder_vlg_check_tst is
    port(
        Arena_F0        : in     vl_logic;
        Arena_F1        : in     vl_logic;
        Arena_F2        : in     vl_logic;
        Arena_F3        : in     vl_logic;
        Arena_F4        : in     vl_logic;
        Arena_F5        : in     vl_logic;
        Arena_F6        : in     vl_logic;
        Arena_F7        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Arena_3to8Decoder_vlg_check_tst;
