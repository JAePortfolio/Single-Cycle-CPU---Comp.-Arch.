library verilog;
use verilog.vl_types.all;
entity Arena_8to3Encoder is
    port(
        Arena_Y0        : in     vl_logic;
        Arena_Y1        : in     vl_logic;
        Arena_Y2        : in     vl_logic;
        Arena_Y3        : in     vl_logic;
        Arena_Y4        : in     vl_logic;
        Arena_Y5        : in     vl_logic;
        Arena_Y6        : in     vl_logic;
        Arena_F0        : out    vl_logic;
        Arena_F1        : out    vl_logic;
        Arena_F2        : out    vl_logic
    );
end Arena_8to3Encoder;
