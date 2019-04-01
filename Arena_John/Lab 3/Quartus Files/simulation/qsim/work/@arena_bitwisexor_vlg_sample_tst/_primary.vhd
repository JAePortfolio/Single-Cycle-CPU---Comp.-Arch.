library verilog;
use verilog.vl_types.all;
entity Arena_bitwisexor_vlg_sample_tst is
    port(
        Arena_a_xorIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_xorIN   : in     vl_logic_vector(5 downto 0);
        Arena_xorSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitwisexor_vlg_sample_tst;
