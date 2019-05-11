library verilog;
use verilog.vl_types.all;
entity Arena_ProgramCounter_32bit_vlg_sample_tst is
    port(
        Arena_button    : in     vl_logic;
        Arena_octalBits : in     vl_logic_vector(7 downto 0);
        Arena_octalOpcode: in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Arena_ProgramCounter_32bit_vlg_sample_tst;
