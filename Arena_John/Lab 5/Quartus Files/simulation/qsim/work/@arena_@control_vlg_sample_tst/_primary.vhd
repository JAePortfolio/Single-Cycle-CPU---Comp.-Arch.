library verilog;
use verilog.vl_types.all;
entity Arena_Control_vlg_sample_tst is
    port(
        Arena_opCode    : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_Control_vlg_sample_tst;
