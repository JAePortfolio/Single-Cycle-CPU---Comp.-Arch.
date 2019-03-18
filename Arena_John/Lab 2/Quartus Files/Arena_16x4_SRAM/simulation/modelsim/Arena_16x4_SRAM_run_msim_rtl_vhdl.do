transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 2/Quartus Files/Arena_4to16Decoder/Arena_4to16Decoder.vhd}
vcom -93 -work work {C:/Users/John2/Documents/Spring 2019/CSC 342 - Organization/Labs/Arena_John/Lab 2/Quartus Files/Arena_4to7Decoder/Arena_Dec_To_Hex_Signed.vhd}

