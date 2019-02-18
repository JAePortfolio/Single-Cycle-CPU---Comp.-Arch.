transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/John/Documents/College/Spring 2019/CSC 342 - Organization/Labs/Arena_Lab1/Arena_3to8Decoder/Arena_3to8Decoder.vhd}

