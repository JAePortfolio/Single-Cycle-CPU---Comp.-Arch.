library verilog;
use verilog.vl_types.all;
entity Arena_4bit_arrayMultipler_vlg_check_tst is
    port(
        Arena_4bitOUT   : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_4bit_arrayMultipler_vlg_check_tst;
