library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseand_vlg_check_tst is
    port(
        Arena_result_andOUT: in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_bitwiseand_vlg_check_tst;
