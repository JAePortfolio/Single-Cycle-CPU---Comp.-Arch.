library verilog;
use verilog.vl_types.all;
entity Arena_4bit_arrayMultipler is
    port(
        Arena_4bitIN_A  : in     vl_logic_vector(3 downto 0);
        Arena_4bitIN_B  : in     vl_logic_vector(3 downto 0);
        Arena_4bitOUT   : out    vl_logic_vector(7 downto 0)
    );
end Arena_4bit_arrayMultipler;
