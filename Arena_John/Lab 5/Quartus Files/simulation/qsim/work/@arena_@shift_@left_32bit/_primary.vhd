library verilog;
use verilog.vl_types.all;
entity Arena_Shift_Left_32bit is
    port(
        Arena_32bit_IMMEDIATE_IN: in     vl_logic_vector(31 downto 0);
        Arena_32bit_IMMEDIATE_OUT: out    vl_logic_vector(31 downto 0)
    );
end Arena_Shift_Left_32bit;
