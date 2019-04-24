library verilog;
use verilog.vl_types.all;
entity Arena_16bitFullAdder_vlg_sample_tst is
    port(
        Arena_16bitIN_A_fa: in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_B_fa: in     vl_logic_vector(15 downto 0);
        Arena_16bitIN_Cin_fa: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_16bitFullAdder_vlg_sample_tst;
