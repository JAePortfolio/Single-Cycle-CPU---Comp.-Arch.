library verilog;
use verilog.vl_types.all;
entity Arena_ALU_Control is
    port(
        Arena_operation : out    vl_logic_vector(3 downto 0);
        Arena_ALUOp     : in     vl_logic_vector(1 downto 0);
        Arena_funct     : in     vl_logic_vector(5 downto 0)
    );
end Arena_ALU_Control;
