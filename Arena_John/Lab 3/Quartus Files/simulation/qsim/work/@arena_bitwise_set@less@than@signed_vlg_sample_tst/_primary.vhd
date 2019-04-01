library verilog;
use verilog.vl_types.all;
entity Arena_bitwise_setLessThanSigned_vlg_sample_tst is
    port(
        Arena_a_sltIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_sltIN   : in     vl_logic_vector(5 downto 0);
        Arena_sltSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitwise_setLessThanSigned_vlg_sample_tst;
