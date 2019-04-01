library verilog;
use verilog.vl_types.all;
entity Arena_bitshiftright_vlg_sample_tst is
    port(
        Arena_a_bsrIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_sramt_bsrIN: in     vl_logic_vector(5 downto 0);
        Arena_bsrSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitshiftright_vlg_sample_tst;
