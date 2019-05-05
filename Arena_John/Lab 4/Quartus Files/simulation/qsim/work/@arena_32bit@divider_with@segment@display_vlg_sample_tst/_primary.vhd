library verilog;
use verilog.vl_types.all;
entity Arena_32bitDivider_withSegmentDisplay_vlg_sample_tst is
    port(
        Arena_button    : in     vl_logic_vector(3 downto 0);
        Arena_octalBits : in     vl_logic_vector(15 downto 0);
        Arena_startDivision: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_32bitDivider_withSegmentDisplay_vlg_sample_tst;
