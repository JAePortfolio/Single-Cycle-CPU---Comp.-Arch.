library verilog;
use verilog.vl_types.all;
entity Arena_4bit_divider is
    port(
        Arena_Quotient  : out    vl_logic_vector(3 downto 0);
        Arena_Divisor   : in     vl_logic_vector(3 downto 0);
        Arena_Dividend  : in     vl_logic_vector(3 downto 0);
        Arena_Remainder : out    vl_logic_vector(3 downto 0)
    );
end Arena_4bit_divider;
