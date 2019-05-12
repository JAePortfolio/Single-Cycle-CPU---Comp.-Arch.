library verilog;
use verilog.vl_types.all;
entity Arena_DataMemory_vlg_sample_tst is
    port(
        Arena_address   : in     vl_logic_vector(7 downto 0);
        Arena_memRead   : in     vl_logic;
        Arena_memWrite  : in     vl_logic;
        Arena_writeData : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_DataMemory_vlg_sample_tst;
