library verilog;
use verilog.vl_types.all;
entity Arena_16bitFullAdder is
    port(
        Arena_16bitIN_A_fa: in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_B_fa: in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_Cin_fa: in     vl_logic;
        Arena_16bitOUT_Sum_fa: out    vl_logic_vector(15 downto 0);
        Arena_16bitOUT_Cout_fa: out    vl_logic
    );
end Arena_16bitFullAdder;
