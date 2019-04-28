library verilog;
use verilog.vl_types.all;
entity Arena_32bit_arrayMultipler_with_16bitFullAdders_vlg_check_tst is
    port(
        Arena_32bitOUT  : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bit_arrayMultipler_with_16bitFullAdders_vlg_check_tst;
