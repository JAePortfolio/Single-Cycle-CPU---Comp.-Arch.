library verilog;
use verilog.vl_types.all;
entity Arena_bitrotationleft_vlg_sample_tst is
    port(
        Arena_a_brlIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_rlamt_brrIN: in     vl_logic_vector(5 downto 0);
        Arena_brlSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitrotationleft_vlg_sample_tst;
