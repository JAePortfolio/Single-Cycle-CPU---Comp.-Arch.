library verilog;
use verilog.vl_types.all;
entity Arena_Control is
    port(
        Arena_opCode    : in     vl_logic_vector(5 downto 0);
        Arena_controlLines: out    vl_logic_vector(6 downto 0);
        Arena_aluOP     : out    vl_logic_vector(1 downto 0)
    );
end Arena_Control;
