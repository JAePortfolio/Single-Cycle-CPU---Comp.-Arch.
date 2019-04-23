library verilog;
use verilog.vl_types.all;
entity Arena_4bit_arrayMultipler_vlg_sample_tst is
    port(
        Arena_4bitIN_A  : in     vl_logic_vector(3 downto 0);
        Arena_4bitIN_B  : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_4bit_arrayMultipler_vlg_sample_tst;
