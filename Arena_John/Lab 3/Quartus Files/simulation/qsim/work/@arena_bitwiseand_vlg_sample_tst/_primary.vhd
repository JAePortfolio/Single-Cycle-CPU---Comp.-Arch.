library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseand_vlg_sample_tst is
    port(
        Arena_a_andIN   : in     vl_logic_vector(5 downto 0);
        Arena_andSelect : in     vl_logic;
        Arena_b_andIN   : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_bitwiseand_vlg_sample_tst;
