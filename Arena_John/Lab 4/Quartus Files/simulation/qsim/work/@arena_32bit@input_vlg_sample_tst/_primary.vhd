library verilog;
use verilog.vl_types.all;
entity Arena_32bitInput_vlg_sample_tst is
    port(
        Arena_A_In      : in     vl_logic_vector(15 downto 0);
        Arena_B_In      : in     vl_logic_vector(15 downto 0);
        Arena_buttonSelect_one: in     vl_logic;
        Arena_buttonSelect_two: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Arena_32bitInput_vlg_sample_tst;
