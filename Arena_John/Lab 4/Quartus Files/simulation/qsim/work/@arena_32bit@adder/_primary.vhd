library verilog;
use verilog.vl_types.all;
entity Arena_32bitAdder is
    port(
        Arena_A_32bit   : inout  vl_logic_vector(31 downto 0);
        Arena_B_32bit   : inout  vl_logic_vector(31 downto 0);
        Arena_Cin_32bit : in     vl_logic;
        Arena_Sum_32bit : out    vl_logic_vector(31 downto 0);
        Arena_Cout_32bit: out    vl_logic
    );
end Arena_32bitAdder;
