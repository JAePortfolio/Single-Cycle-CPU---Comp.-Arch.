library verilog;
use verilog.vl_types.all;
entity Arena_3to8Decoder is
    port(
        Arena_A         : in     vl_logic;
        Arena_B         : in     vl_logic;
        Arena_C         : in     vl_logic;
        Arena_F0        : out    vl_logic;
        Arena_F1        : out    vl_logic;
        Arena_F2        : out    vl_logic;
        Arena_F3        : out    vl_logic;
        Arena_F4        : out    vl_logic;
        Arena_F5        : out    vl_logic;
        Arena_F6        : out    vl_logic;
        Arena_F7        : out    vl_logic
    );
end Arena_3to8Decoder;
