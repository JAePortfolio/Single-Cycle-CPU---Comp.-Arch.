transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 4/Quartus Files/Arena_32bitRegister.vhd}
vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 4/Quartus Files/Arena_32bitAdder.vhd}
vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 4/Quartus Files/Arena_D_FlipFlop.vhd}
