library verilog;
use verilog.vl_types.all;
entity Arena_DLatch is
    port(
        Arena_Q         : out    vl_logic;
        Arena_D         : in     vl_logic;
        Arena_C         : in     vl_logic;
        Arena_Q_NOT     : out    vl_logic
    );
end Arena_DLatch;
