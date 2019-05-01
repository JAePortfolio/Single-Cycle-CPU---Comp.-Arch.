library verilog;
use verilog.vl_types.all;
entity Arena_16bitMultiplier_using_registers_v1_vlg_check_tst is
    port(
        Arena_32bitMultiplier_Out: in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_16bitMultiplier_using_registers_v1_vlg_check_tst;
