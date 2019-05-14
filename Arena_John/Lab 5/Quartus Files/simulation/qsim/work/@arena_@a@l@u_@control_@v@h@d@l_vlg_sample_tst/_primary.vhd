library verilog;
use verilog.vl_types.all;
entity Arena_ALU_Control_VHDL_vlg_sample_tst is
    port(
        Arena_ALUop     : in     vl_logic_vector(2 downto 0);
        Arena_func      : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_ALU_Control_VHDL_vlg_sample_tst;
