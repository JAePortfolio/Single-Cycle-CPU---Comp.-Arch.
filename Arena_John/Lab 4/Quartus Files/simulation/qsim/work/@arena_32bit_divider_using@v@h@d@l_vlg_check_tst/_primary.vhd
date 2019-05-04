library verilog;
use verilog.vl_types.all;
entity Arena_32bit_divider_usingVHDL_vlg_check_tst is
    port(
        Arena_Quotient  : in     vl_logic_vector(31 downto 0);
        Arena_Remainder : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bit_divider_usingVHDL_vlg_check_tst;
