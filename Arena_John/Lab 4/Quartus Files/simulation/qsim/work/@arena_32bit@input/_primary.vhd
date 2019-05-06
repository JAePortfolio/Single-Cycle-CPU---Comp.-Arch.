library verilog;
use verilog.vl_types.all;
entity Arena_32bitInput is
    port(
        Arena_button    : in     vl_logic;
        Arena_octalBits : in     vl_logic_vector(7 downto 0);
        Arena_octalOpcode: in     vl_logic_vector(1 downto 0);
        Arena_octet0    : out    vl_logic_vector(15 downto 0);
        Arena_octet1    : out    vl_logic_vector(15 downto 0);
        Arena_32bitOutput: out    vl_logic_vector(31 downto 0)
    );
end Arena_32bitInput;
