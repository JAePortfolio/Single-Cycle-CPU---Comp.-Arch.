library verilog;
use verilog.vl_types.all;
entity Arena_32bit_divider_usingVHDL is
    port(
        Arena_Dividend  : in     vl_logic_vector(31 downto 0);
        Arena_Divisor   : in     vl_logic_vector(31 downto 0);
        Arena_Quotient  : out    vl_logic_vector(31 downto 0);
        Arena_Remainder : out    vl_logic_vector(31 downto 0)
    );
end Arena_32bit_divider_usingVHDL;
