library verilog;
use verilog.vl_types.all;
entity Arena_bitshiftleft_vlg_sample_tst is
    port(
        Arena_a_bslIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_slamt_bslIN: in     vl_logic_vector(5 downto 0);
        Arena_bslSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitshiftleft_vlg_sample_tst;
