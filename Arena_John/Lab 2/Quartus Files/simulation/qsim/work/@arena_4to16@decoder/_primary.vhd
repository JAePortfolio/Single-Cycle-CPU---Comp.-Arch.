library verilog;
use verilog.vl_types.all;
entity Arena_4to16Decoder is
    port(
        Arena_In        : in     vl_logic_vector(3 downto 0);
        Arena_Dec       : out    vl_logic_vector(15 downto 0)
    );
end Arena_4to16Decoder;
