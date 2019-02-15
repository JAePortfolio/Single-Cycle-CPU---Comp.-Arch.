onerror {quit -f}
vlib work
vlog -work work Arena_Lab1Part1.vo
vlog -work work Arena_Lab1Part1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_simpleCircuit_vlg_vec_tst
vcd file -direction Arena_Lab1Part1.msim.vcd
vcd add -internal Arena_simpleCircuit_vlg_vec_tst/*
vcd add -internal Arena_simpleCircuit_vlg_vec_tst/i1/*
add wave /*
run -all
