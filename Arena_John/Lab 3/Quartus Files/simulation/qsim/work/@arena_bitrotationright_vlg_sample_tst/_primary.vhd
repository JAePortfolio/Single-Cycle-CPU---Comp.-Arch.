library verilog;
use verilog.vl_types.all;
entity Arena_bitrotationright_vlg_sample_tst is
    port(
        Arena_a_brrIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_rramt_brrIN: in     vl_logic_vector(5 downto 0);
        Arena_brrSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitrotationright_vlg_sample_tst;
