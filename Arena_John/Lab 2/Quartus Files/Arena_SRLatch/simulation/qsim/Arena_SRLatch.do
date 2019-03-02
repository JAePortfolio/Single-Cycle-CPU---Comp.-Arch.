onerror {quit -f}
vlib work
vlog -work work Arena_SRLatch.vo
vlog -work work Arena_SRLatch.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_SRLatch_vlg_vec_tst
vcd file -direction Arena_SRLatch.msim.vcd
vcd add -internal Arena_SRLatch_vlg_vec_tst/*
vcd add -internal Arena_SRLatch_vlg_vec_tst/i1/*
add wave /*
run -all
