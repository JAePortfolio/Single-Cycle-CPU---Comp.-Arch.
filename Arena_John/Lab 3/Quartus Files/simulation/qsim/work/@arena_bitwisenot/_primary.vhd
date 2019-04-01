library verilog;
use verilog.vl_types.all;
entity Arena_bitwisenot is
    port(
        Arena_a_notIN   : in     vl_logic_vector(5 downto 0);
        Arena_result_notOUT: out    vl_logic_vector(5 downto 0);
        Arena_notSelect : in     vl_logic
    );
end Arena_bitwisenot;
