library verilog;
use verilog.vl_types.all;
entity Arena_Shift_Left_32bit_vlg_check_tst is
    port(
        Arena_32bit_IMMEDIATE_OUT: in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_Shift_Left_32bit_vlg_check_tst;
