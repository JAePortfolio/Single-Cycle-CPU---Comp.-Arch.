library verilog;
use verilog.vl_types.all;
entity Arena_Control_vlg_check_tst is
    port(
        Arena_aluOP     : in     vl_logic_vector(1 downto 0);
        Arena_controlLines: in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_Control_vlg_check_tst;
