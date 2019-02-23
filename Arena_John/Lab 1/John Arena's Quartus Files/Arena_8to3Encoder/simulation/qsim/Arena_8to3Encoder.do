onerror {quit -f}
vlib work
vlog -work work Arena_8to3Encoder.vo
vlog -work work Arena_8to3Encoder.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_8to3Encoder_vlg_vec_tst
vcd file -direction Arena_8to3Encoder.msim.vcd
vcd add -internal Arena_8to3Encoder_vlg_vec_tst/*
vcd add -internal Arena_8to3Encoder_vlg_vec_tst/i1/*
add wave /*
run -all
