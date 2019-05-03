onerror {quit -f}
vlib work
vlog -work work Add_Sub_Mul_Div_Accum_Lab4.vo
vlog -work work Add_Sub_Mul_Div_Accum_Lab4.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Arena_4bit_divider_vlg_vec_tst
vcd file -direction Add_Sub_Mul_Div_Accum_Lab4.msim.vcd
vcd add -internal Arena_4bit_divider_vlg_vec_tst/*
vcd add -internal Arena_4bit_divider_vlg_vec_tst/i1/*
add wave /*
run -all
