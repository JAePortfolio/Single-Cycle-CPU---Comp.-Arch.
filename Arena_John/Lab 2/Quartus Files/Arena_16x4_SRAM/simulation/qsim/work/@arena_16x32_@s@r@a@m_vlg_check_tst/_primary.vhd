library verilog;
use verilog.vl_types.all;
entity Arena_16x32_SRAM_vlg_check_tst is
    port(
        Arena_OUT       : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_16x32_SRAM_vlg_check_tst;
