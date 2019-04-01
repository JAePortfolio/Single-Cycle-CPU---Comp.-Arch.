library verilog;
use verilog.vl_types.all;
entity Arena_bitrotationright is
    port(
        Arena_a_brrIN   : in     vl_logic_vector(5 downto 0);
        Arena_b_rramt_brrIN: in     vl_logic_vector(5 downto 0);
        Arena_result_brrOUT: out    vl_logic_vector(5 downto 0);
        Arena_brrSelect : in     vl_logic
    );
end Arena_bitrotationright;
