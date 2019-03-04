onerror {quit -f}
vlib work
vlog -work work Arena_16x4_SRAM.vo
vlog -work work Arena_16x4_SRAM.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_16x32_SRAM_vlg_vec_tst
vcd file -direction Arena_16x4_SRAM.msim.vcd
vcd add -internal Arena_16x32_SRAM_vlg_vec_tst/*
vcd add -internal Arena_16x32_SRAM_vlg_vec_tst/i1/*
add wave /*
run -all
