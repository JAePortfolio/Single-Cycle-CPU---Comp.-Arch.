library verilog;
use verilog.vl_types.all;
entity Arena_32bit_arrayMultiplier_vlg_check_tst is
    port(
        Arena_Product_Out: in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bit_arrayMultiplier_vlg_check_tst;
