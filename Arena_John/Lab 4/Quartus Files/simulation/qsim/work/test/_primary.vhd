library verilog;
use verilog.vl_types.all;
entity test is
    port(
        Arena_16bitIN_A : in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_B : in     vl_logic_vector(15 downto 0);
        Arena_32bitOUT  : out    vl_logic_vector(31 downto 0)
    );
end test;