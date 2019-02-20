library verilog;
use verilog.vl_types.all;
entity Arena_muxLPM_vlg_sample_tst is
    port(
        Arena_data0     : in     vl_logic;
        Arena_data1     : in     vl_logic;
        Arena_sel       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_muxLPM_vlg_sample_tst;
