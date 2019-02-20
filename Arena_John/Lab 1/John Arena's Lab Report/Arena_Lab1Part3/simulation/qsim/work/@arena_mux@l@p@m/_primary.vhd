library verilog;
use verilog.vl_types.all;
entity Arena_muxLPM is
    port(
        Arena_data0     : in     vl_logic;
        Arena_data1     : in     vl_logic;
        Arena_sel       : in     vl_logic;
        Arena_result    : out    vl_logic
    );
end Arena_muxLPM;
