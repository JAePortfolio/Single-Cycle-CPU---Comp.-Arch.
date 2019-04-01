library verilog;
use verilog.vl_types.all;
entity Arena_bitwise_setLessThanUnsigned_vlg_sample_tst is
    port(
        Arena_a_sltuIN  : in     vl_logic_vector(5 downto 0);
        Arena_b_sltuIN  : in     vl_logic_vector(5 downto 0);
        Arena_sltuSelect: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitwise_setLessThanUnsigned_vlg_sample_tst;
