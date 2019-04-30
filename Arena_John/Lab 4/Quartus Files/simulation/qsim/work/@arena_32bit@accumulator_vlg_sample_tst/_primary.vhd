library verilog;
use verilog.vl_types.all;
entity Arena_32bitAccumulator_vlg_sample_tst is
    port(
        Arena_A_32bit   : in     vl_logic_vector(31 downto 0);
        Arena_Bin_32bit : in     vl_logic;
        Arena_Cin_32bit : in     vl_logic;
        Arena_clk       : in     vl_logic;
        Arena_sub_add   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_32bitAccumulator_vlg_sample_tst;
