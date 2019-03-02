library verilog;
use verilog.vl_types.all;
entity Arena_SRLatch is
    port(
        Arena_Q         : out    vl_logic;
        Arena_S         : in     vl_logic;
        Arena_R         : in     vl_logic;
        Arena_Q_NOT     : out    vl_logic
    );
end Arena_SRLatch;
