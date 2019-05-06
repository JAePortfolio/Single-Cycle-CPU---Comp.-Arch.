library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator_withSegmentDisplay_vlg_sample_tst is
    port(
        Arena_Bin_32bit : in     vl_logic;
        Arena_button    : in     vl_logic_vector(1 downto 0);
        Arena_Cin_32bit : in     vl_logic;
        Arena_clk       : in     vl_logic;
        Arena_octalBits : in     vl_logic_vector(7 downto 0);
        Arena_octalOpcode: in     vl_logic;
        Arena_reset     : in     vl_logic;
        Arena_sub_add   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_32bitAccumulator_withSegmentDisplay_vlg_sample_tst;
