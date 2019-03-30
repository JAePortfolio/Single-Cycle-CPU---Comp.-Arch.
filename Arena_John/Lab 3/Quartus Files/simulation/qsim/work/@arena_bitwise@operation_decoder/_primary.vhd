library verilog;
use verilog.vl_types.all;
entity Arena_bitwiseOperation_decoder is
    port(
        Arena_opcode    : in     vl_logic_vector(2 downto 0);
        Arena_opSelect  : out    vl_logic_vector(7 downto 0)
    );
end Arena_bitwiseOperation_decoder;
