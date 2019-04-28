library verilog;
use verilog.vl_types.all;
entity Arena_32bit_arrayMultipler_with_16bitFullAdders_vlg_sample_tst is
    port(
        Arena_16bitIN_A : in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_B : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_32bit_arrayMultipler_with_16bitFullAdders_vlg_sample_tst;
