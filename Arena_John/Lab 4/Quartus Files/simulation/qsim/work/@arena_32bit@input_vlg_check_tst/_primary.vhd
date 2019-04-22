library verilog;
use verilog.vl_types.all;
entity Arena_32bitInput_vlg_check_tst is
    port(
        Arena_A_out     : in     vl_logic_vector(15 downto 0);
        Arena_B_out     : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bitInput_vlg_check_tst;
