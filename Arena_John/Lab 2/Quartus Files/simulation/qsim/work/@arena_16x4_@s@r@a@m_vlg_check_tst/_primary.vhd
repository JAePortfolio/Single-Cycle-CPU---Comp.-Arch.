library verilog;
use verilog.vl_types.all;
entity Arena_16x4_SRAM_vlg_check_tst is
    port(
        Arena_OUT       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_16x4_SRAM_vlg_check_tst;
