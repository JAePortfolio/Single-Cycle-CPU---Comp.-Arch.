library verilog;
use verilog.vl_types.all;
entity Arena_32bitInput_vlg_check_tst is
    port(
        Arena_32bitOutput: in     vl_logic_vector(31 downto 0);
        Arena_octet0    : in     vl_logic_vector(15 downto 0);
        Arena_octet1    : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end Arena_32bitInput_vlg_check_tst;
