library verilog;
use verilog.vl_types.all;
entity Arena_bitwise_setLessThanSigned is
    port(
        Arena_a_sltIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_sltIN   : in     vl_logic_vector(5 downto 0);
        Arena_result_sltOUT: out    vl_logic_vector(5 downto 0);
        Arena_sltSelect : in     vl_logic
    );
end Arena_bitwise_setLessThanSigned;
