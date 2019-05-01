library verilog;
use verilog.vl_types.all;
entity Arena_16bitMultiplier_using_registers_v1 is
    port(
        Arena_32bitMultiplier_Out: out    vl_logic_vector(31 downto 0);
        Arena_clk       : in     vl_logic;
        Arena_16bitIN_A : in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_B : in     vl_logic_vector(15 downto 0)
    );
end Arena_16bitMultiplier_using_registers_v1;
