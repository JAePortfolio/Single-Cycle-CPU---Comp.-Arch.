library verilog;
use verilog.vl_types.all;
entity Arena_bitshiftleft_vlg_check_tst is
    port(
        Arena_result_bslOUT: in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_bitshiftleft_vlg_check_tst;
