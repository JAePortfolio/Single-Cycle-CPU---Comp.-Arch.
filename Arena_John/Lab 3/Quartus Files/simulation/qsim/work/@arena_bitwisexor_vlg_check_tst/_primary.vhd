library verilog;
use verilog.vl_types.all;
entity Arena_bitwisexor_vlg_check_tst is
    port(
        Arena_result_xorOUT: in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_bitwisexor_vlg_check_tst;
