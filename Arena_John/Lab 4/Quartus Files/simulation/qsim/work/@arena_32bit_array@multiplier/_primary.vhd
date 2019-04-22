library verilog;
use verilog.vl_types.all;
entity Arena_32bit_arrayMultiplier is
    port(
        Arena_Product_Out: out    vl_logic_vector(7 downto 0);
        Arena_buttonSelect_one: in     vl_logic;
        Arena_buttonSelect_two: in     vl_logic;
        Arena_A_In      : in     vl_logic_vector(15 downto 0);
        Arena_B_In      : in     vl_logic_vector(15 downto 0)
    );
end Arena_32bit_arrayMultiplier;
