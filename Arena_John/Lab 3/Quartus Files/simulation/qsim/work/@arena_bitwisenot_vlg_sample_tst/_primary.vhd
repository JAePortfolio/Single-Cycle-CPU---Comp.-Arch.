library verilog;
use verilog.vl_types.all;
entity Arena_bitwisenot_vlg_sample_tst is
    port(
        Arena_a_notIN   : in     vl_logic_vector(5 downto 0);
        Arena_notSelect : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_bitwisenot_vlg_sample_tst;
