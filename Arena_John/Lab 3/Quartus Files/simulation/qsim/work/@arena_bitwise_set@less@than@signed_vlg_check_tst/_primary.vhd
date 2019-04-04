library verilog;
use verilog.vl_types.all;
entity Arena_bitwise_setLessThanSigned_vlg_check_tst is
    port(
        Arena_result_sltOUT: in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_bitwise_setLessThanSigned_vlg_check_tst;
