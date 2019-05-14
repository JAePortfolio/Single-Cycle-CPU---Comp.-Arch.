library verilog;
use verilog.vl_types.all;
entity Arena_ALU_Control_vlg_sample_tst is
    port(
        Arena_ALUOp     : in     vl_logic_vector(1 downto 0);
        Arena_funct     : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_ALU_Control_vlg_sample_tst;
