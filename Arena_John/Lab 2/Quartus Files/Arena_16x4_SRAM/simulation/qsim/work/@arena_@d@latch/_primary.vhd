library verilog;
use verilog.vl_types.all;
entity Arena_DLatch is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        auto_stp_external_clock_0: in     vl_logic;
        Arena_Q         : out    vl_logic;
        Arena_D         : in     vl_logic;
        Arena_C         : in     vl_logic;
        Arena_Q_NOT     : out    vl_logic
    );
end Arena_DLatch;
