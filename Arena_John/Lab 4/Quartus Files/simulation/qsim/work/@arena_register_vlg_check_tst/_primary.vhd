library verilog;
use verilog.vl_types.all;
entity Arena_register_vlg_check_tst is
    port(
        Arena_Q         : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_register_vlg_check_tst;
