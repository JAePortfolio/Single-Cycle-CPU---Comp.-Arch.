library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseand is
    port(
        Arena_a_andIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_andIN   : in     vl_logic_vector(5 downto 0);
        Arena_result_andOUT: out    vl_logic_vector(5 downto 0);
        Arena_andSelect : in     vl_logic
    );
end Arena_bitwiseand;
