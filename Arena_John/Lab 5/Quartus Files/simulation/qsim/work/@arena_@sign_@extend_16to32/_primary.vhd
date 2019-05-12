library verilog;
use verilog.vl_types.all;
entity Arena_Sign_Extend_16to32 is
    port(
        Arena_16bit_IMMEDIATE_IN: in     vl_logic_vector(15 downto 0);
        Arena_32bit_IMMEDIATE_OUT: out    vl_logic_vector(31 downto 0)
    );
end Arena_Sign_Extend_16to32;
