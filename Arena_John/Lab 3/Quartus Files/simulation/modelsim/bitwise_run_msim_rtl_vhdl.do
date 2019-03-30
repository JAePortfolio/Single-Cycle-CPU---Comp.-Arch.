transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 3/Quartus Files/Arena_bitwiseOperation_decoder.vhd}

