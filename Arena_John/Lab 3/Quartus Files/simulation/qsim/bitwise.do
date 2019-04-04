onerror {quit -f}
vlib work
vlog -work work bitwise.vo
vlog -work work bitwise.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_bitwise_vlg_vec_tst
vcd file -direction bitwise.msim.vcd
vcd add -internal Arena_bitwise_vlg_vec_tst/*
vcd add -internal Arena_bitwise_vlg_vec_tst/i1/*
add wave /*
run -all
