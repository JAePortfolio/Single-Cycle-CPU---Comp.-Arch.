library verilog;
use verilog.vl_types.all;
entity Arena_16x32_SRAM is
    port(
        Arena_OUT       : out    vl_logic_vector(31 downto 0);
        Arena_WE        : in     vl_logic;
        Arena_CS        : in     vl_logic;
        Arena_DataIn    : in     vl_logic_vector(31 downto 0);
        Arena_Address   : in     vl_logic_vector(3 downto 0);
        Arena_OE        : in     vl_logic
    );
end Arena_16x32_SRAM;
