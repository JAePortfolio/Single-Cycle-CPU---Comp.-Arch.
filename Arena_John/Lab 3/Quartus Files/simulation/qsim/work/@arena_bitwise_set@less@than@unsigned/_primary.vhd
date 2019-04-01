library verilog;
use verilog.vl_types.all;
entity Arena_bitwise_setLessThanUnsigned is
    port(
        Arena_a_sltuIN  : in     vl_logic_vector(5 downto 0);
        Arena_b_sltuIN  : in     vl_logic_vector(5 downto 0);
        Arena_result_sltuOUT: out    vl_logic;
        Arena_sltuSelect: in     vl_logic
    );
end Arena_bitwise_setLessThanUnsigned;
