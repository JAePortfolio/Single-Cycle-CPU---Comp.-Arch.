library verilog;
use verilog.vl_types.all;
entity Arena_ALU_Control_VHDL is
    port(
        Arena_ALUop     : in     vl_logic_vector(2 downto 0);
        Arena_func      : in     vl_logic_vector(5 downto 0);
        Arena_operation : out    vl_logic_vector(3 downto 0)
    );
end Arena_ALU_Control_VHDL;
