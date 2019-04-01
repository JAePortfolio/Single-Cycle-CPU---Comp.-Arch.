library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseor is
    port(
        Arena_a_orIN    : in     vl_logic_vector(5 downto 0);
        Arena_b_orIN    : in     vl_logic_vector(5 downto 0);
        Arena_result_orOUT: out    vl_logic_vector(5 downto 0);
        Arena_orSelect  : in     vl_logic
    );
end Arena_bitwiseor;
