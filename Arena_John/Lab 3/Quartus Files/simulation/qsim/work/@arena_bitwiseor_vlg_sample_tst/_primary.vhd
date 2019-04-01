library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseor_vlg_sample_tst is
    port(
        Arena_a_orIN    : in     vl_logic_vector(5 downto 0);
        Arena_b_orIN    : in     vl_logic_vector(5 downto 0);
        Arena_orSelect  : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitwiseor_vlg_sample_tst;
