library verilog;
use verilog.vl_types.all;
entity Arena_DataMemory_vlg_check_tst is
    port(
        Arena_readData  : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_DataMemory_vlg_check_tst;
