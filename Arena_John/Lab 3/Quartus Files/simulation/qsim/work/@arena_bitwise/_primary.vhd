library verilog;
use verilog.vl_types.all;
entity Arena_bitwise is
    port(
        Arena_a_bitwiseIN: in     vl_logic_vector(5 downto 0);
        Arena_b_bitwiseIN: in     vl_logic_vector(5 downto 0);
        Arena_result_bitwiseOUT: out    vl_logic_vector(5 downto 0);
        Arena_opcode    : in     vl_logic_vector(3 downto 0);
        Arena_buttonStart: in     vl_logic
    );
end Arena_bitwise;
