onerror {quit -f}
vlib work
vlog -work work Single_Cycle_CPU.vo
vlog -work work Single_Cycle_CPU.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Single_Cycle_CPU_vlg_vec_tst
vcd file -direction Single_Cycle_CPU.msim.vcd
vcd add -internal Single_Cycle_CPU_vlg_vec_tst/*
vcd add -internal Single_Cycle_CPU_vlg_vec_tst/i1/*
add wave /*
run -all
