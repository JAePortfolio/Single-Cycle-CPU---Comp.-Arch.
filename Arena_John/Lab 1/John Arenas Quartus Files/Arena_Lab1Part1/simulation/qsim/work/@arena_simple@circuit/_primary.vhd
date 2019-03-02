library verilog;
use verilog.vl_types.all;
entity Arena_simpleCircuit is
    port(
        Arena_F         : out    vl_logic;
        Arena_A         : in     vl_logic;
        Arena_B         : in     vl_logic
    );
end Arena_simpleCircuit;
