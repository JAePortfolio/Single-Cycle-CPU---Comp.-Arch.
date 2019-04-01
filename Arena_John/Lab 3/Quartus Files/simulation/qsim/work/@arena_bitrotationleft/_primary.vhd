library verilog;
use verilog.vl_types.all;
entity Arena_bitrotationleft is
    port(
        Arena_a_brlIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_rlamt_brrIN: in     vl_logic_vector(5 downto 0);
        Arena_result_brlOUT: out    vl_logic_vector(5 downto 0);
        Arena_brlSelect : in     vl_logic
    );
end Arena_bitrotationleft;
