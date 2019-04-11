library verilog;
use verilog.vl_types.all;
entity Arena_register_vlg_sample_tst is
    port(
        Arena_clk       : in     vl_logic;
        Arena_R         : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_register_vlg_sample_tst;
