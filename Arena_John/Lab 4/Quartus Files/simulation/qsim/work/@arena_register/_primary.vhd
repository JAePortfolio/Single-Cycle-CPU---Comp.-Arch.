library verilog;
use verilog.vl_types.all;
entity Arena_register is
    port(
        Arena_R         : in     vl_logic_vector(31 downto 0);
        Arena_Q         : out    vl_logic_vector(31 downto 0);
        Arena_clk       : in     vl_logic
    );
end Arena_register;
