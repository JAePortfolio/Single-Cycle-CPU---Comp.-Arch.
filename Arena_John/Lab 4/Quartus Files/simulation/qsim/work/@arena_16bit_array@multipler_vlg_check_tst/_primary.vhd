library verilog;
use verilog.vl_types.all;
entity Arena_16bit_arrayMultipler_vlg_check_tst is
    port(
        Arena_32bitOUT  : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_16bit_arrayMultipler_vlg_check_tst;
