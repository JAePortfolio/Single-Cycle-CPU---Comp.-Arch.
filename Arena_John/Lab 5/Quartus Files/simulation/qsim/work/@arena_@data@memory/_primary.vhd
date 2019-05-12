library verilog;
use verilog.vl_types.all;
entity Arena_DataMemory is
    port(
        Arena_memWrite  : in     vl_logic;
        Arena_memRead   : in     vl_logic;
        Arena_address   : in     vl_logic_vector(7 downto 0);
        Arena_writeData : in     vl_logic_vector(31 downto 0);
        Arena_readData  : out    vl_logic_vector(31 downto 0)
    );
end Arena_DataMemory;
