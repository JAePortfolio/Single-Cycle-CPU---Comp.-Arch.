-- megafunction wizard: %LPM_MUX%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_MUX 

-- ============================================================
-- File Name: Mux16to4.vhd
-- Megafunction Name(s):
-- 			LPM_MUX
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 13.0.1 Build 232 06/12/2013 SP 1 SJ Web Edition
-- ************************************************************


--Copyright (C) 1991-2013 Altera Corporation
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, Altera MegaCore Function License 
--Agreement, or other applicable license agreement, including, 
--without limitation, that your use is for the sole purpose of 
--programming logic devices manufactured by Altera and sold by 
--Altera or its authorized distributors.  Please refer to the 
--applicable agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY Mux16to4 IS
	PORT
	(
		data0x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data10x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data11x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data12x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data13x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data14x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data15x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data1x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data2x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data3x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data4x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data5x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data6x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data7x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data8x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		data9x		: IN STD_LOGIC_VECTOR (5 DOWNTO 0);
		sel		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (5 DOWNTO 0)
	);
END Mux16to4;


ARCHITECTURE SYN OF mux16to4 IS

--	type STD_LOGIC_2D is array (NATURAL RANGE <>, NATURAL RANGE <>) of STD_LOGIC;

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire2	: STD_LOGIC_2D (15 DOWNTO 0, 5 DOWNTO 0);
	SIGNAL sub_wire3	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire4	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire5	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire6	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire7	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire8	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire9	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire10	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire11	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire12	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire13	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire14	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire15	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire16	: STD_LOGIC_VECTOR (5 DOWNTO 0);
	SIGNAL sub_wire17	: STD_LOGIC_VECTOR (5 DOWNTO 0);

BEGIN
	sub_wire17    <= data0x(5 DOWNTO 0);
	sub_wire16    <= data1x(5 DOWNTO 0);
	sub_wire15    <= data2x(5 DOWNTO 0);
	sub_wire14    <= data3x(5 DOWNTO 0);
	sub_wire13    <= data4x(5 DOWNTO 0);
	sub_wire12    <= data5x(5 DOWNTO 0);
	sub_wire11    <= data6x(5 DOWNTO 0);
	sub_wire10    <= data7x(5 DOWNTO 0);
	sub_wire9    <= data8x(5 DOWNTO 0);
	sub_wire8    <= data9x(5 DOWNTO 0);
	sub_wire7    <= data10x(5 DOWNTO 0);
	sub_wire6    <= data11x(5 DOWNTO 0);
	sub_wire5    <= data12x(5 DOWNTO 0);
	sub_wire4    <= data13x(5 DOWNTO 0);
	sub_wire3    <= data14x(5 DOWNTO 0);
	result    <= sub_wire0(5 DOWNTO 0);
	sub_wire1    <= data15x(5 DOWNTO 0);
	sub_wire2(15, 0)    <= sub_wire1(0);
	sub_wire2(15, 1)    <= sub_wire1(1);
	sub_wire2(15, 2)    <= sub_wire1(2);
	sub_wire2(15, 3)    <= sub_wire1(3);
	sub_wire2(15, 4)    <= sub_wire1(4);
	sub_wire2(15, 5)    <= sub_wire1(5);
	sub_wire2(14, 0)    <= sub_wire3(0);
	sub_wire2(14, 1)    <= sub_wire3(1);
	sub_wire2(14, 2)    <= sub_wire3(2);
	sub_wire2(14, 3)    <= sub_wire3(3);
	sub_wire2(14, 4)    <= sub_wire3(4);
	sub_wire2(14, 5)    <= sub_wire3(5);
	sub_wire2(13, 0)    <= sub_wire4(0);
	sub_wire2(13, 1)    <= sub_wire4(1);
	sub_wire2(13, 2)    <= sub_wire4(2);
	sub_wire2(13, 3)    <= sub_wire4(3);
	sub_wire2(13, 4)    <= sub_wire4(4);
	sub_wire2(13, 5)    <= sub_wire4(5);
	sub_wire2(12, 0)    <= sub_wire5(0);
	sub_wire2(12, 1)    <= sub_wire5(1);
	sub_wire2(12, 2)    <= sub_wire5(2);
	sub_wire2(12, 3)    <= sub_wire5(3);
	sub_wire2(12, 4)    <= sub_wire5(4);
	sub_wire2(12, 5)    <= sub_wire5(5);
	sub_wire2(11, 0)    <= sub_wire6(0);
	sub_wire2(11, 1)    <= sub_wire6(1);
	sub_wire2(11, 2)    <= sub_wire6(2);
	sub_wire2(11, 3)    <= sub_wire6(3);
	sub_wire2(11, 4)    <= sub_wire6(4);
	sub_wire2(11, 5)    <= sub_wire6(5);
	sub_wire2(10, 0)    <= sub_wire7(0);
	sub_wire2(10, 1)    <= sub_wire7(1);
	sub_wire2(10, 2)    <= sub_wire7(2);
	sub_wire2(10, 3)    <= sub_wire7(3);
	sub_wire2(10, 4)    <= sub_wire7(4);
	sub_wire2(10, 5)    <= sub_wire7(5);
	sub_wire2(9, 0)    <= sub_wire8(0);
	sub_wire2(9, 1)    <= sub_wire8(1);
	sub_wire2(9, 2)    <= sub_wire8(2);
	sub_wire2(9, 3)    <= sub_wire8(3);
	sub_wire2(9, 4)    <= sub_wire8(4);
	sub_wire2(9, 5)    <= sub_wire8(5);
	sub_wire2(8, 0)    <= sub_wire9(0);
	sub_wire2(8, 1)    <= sub_wire9(1);
	sub_wire2(8, 2)    <= sub_wire9(2);
	sub_wire2(8, 3)    <= sub_wire9(3);
	sub_wire2(8, 4)    <= sub_wire9(4);
	sub_wire2(8, 5)    <= sub_wire9(5);
	sub_wire2(7, 0)    <= sub_wire10(0);
	sub_wire2(7, 1)    <= sub_wire10(1);
	sub_wire2(7, 2)    <= sub_wire10(2);
	sub_wire2(7, 3)    <= sub_wire10(3);
	sub_wire2(7, 4)    <= sub_wire10(4);
	sub_wire2(7, 5)    <= sub_wire10(5);
	sub_wire2(6, 0)    <= sub_wire11(0);
	sub_wire2(6, 1)    <= sub_wire11(1);
	sub_wire2(6, 2)    <= sub_wire11(2);
	sub_wire2(6, 3)    <= sub_wire11(3);
	sub_wire2(6, 4)    <= sub_wire11(4);
	sub_wire2(6, 5)    <= sub_wire11(5);
	sub_wire2(5, 0)    <= sub_wire12(0);
	sub_wire2(5, 1)    <= sub_wire12(1);
	sub_wire2(5, 2)    <= sub_wire12(2);
	sub_wire2(5, 3)    <= sub_wire12(3);
	sub_wire2(5, 4)    <= sub_wire12(4);
	sub_wire2(5, 5)    <= sub_wire12(5);
	sub_wire2(4, 0)    <= sub_wire13(0);
	sub_wire2(4, 1)    <= sub_wire13(1);
	sub_wire2(4, 2)    <= sub_wire13(2);
	sub_wire2(4, 3)    <= sub_wire13(3);
	sub_wire2(4, 4)    <= sub_wire13(4);
	sub_wire2(4, 5)    <= sub_wire13(5);
	sub_wire2(3, 0)    <= sub_wire14(0);
	sub_wire2(3, 1)    <= sub_wire14(1);
	sub_wire2(3, 2)    <= sub_wire14(2);
	sub_wire2(3, 3)    <= sub_wire14(3);
	sub_wire2(3, 4)    <= sub_wire14(4);
	sub_wire2(3, 5)    <= sub_wire14(5);
	sub_wire2(2, 0)    <= sub_wire15(0);
	sub_wire2(2, 1)    <= sub_wire15(1);
	sub_wire2(2, 2)    <= sub_wire15(2);
	sub_wire2(2, 3)    <= sub_wire15(3);
	sub_wire2(2, 4)    <= sub_wire15(4);
	sub_wire2(2, 5)    <= sub_wire15(5);
	sub_wire2(1, 0)    <= sub_wire16(0);
	sub_wire2(1, 1)    <= sub_wire16(1);
	sub_wire2(1, 2)    <= sub_wire16(2);
	sub_wire2(1, 3)    <= sub_wire16(3);
	sub_wire2(1, 4)    <= sub_wire16(4);
	sub_wire2(1, 5)    <= sub_wire16(5);
	sub_wire2(0, 0)    <= sub_wire17(0);
	sub_wire2(0, 1)    <= sub_wire17(1);
	sub_wire2(0, 2)    <= sub_wire17(2);
	sub_wire2(0, 3)    <= sub_wire17(3);
	sub_wire2(0, 4)    <= sub_wire17(4);
	sub_wire2(0, 5)    <= sub_wire17(5);

	LPM_MUX_component : LPM_MUX
	GENERIC MAP (
		lpm_size => 16,
		lpm_type => "LPM_MUX",
		lpm_width => 6,
		lpm_widths => 4
	)
	PORT MAP (
		data => sub_wire2,
		sel => sel,
		result => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone II"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_SIZE NUMERIC "16"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_MUX"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "6"
-- Retrieval info: CONSTANT: LPM_WIDTHS NUMERIC "4"
-- Retrieval info: USED_PORT: data0x 0 0 6 0 INPUT NODEFVAL "data0x[5..0]"
-- Retrieval info: USED_PORT: data10x 0 0 6 0 INPUT NODEFVAL "data10x[5..0]"
-- Retrieval info: USED_PORT: data11x 0 0 6 0 INPUT NODEFVAL "data11x[5..0]"
-- Retrieval info: USED_PORT: data12x 0 0 6 0 INPUT NODEFVAL "data12x[5..0]"
-- Retrieval info: USED_PORT: data13x 0 0 6 0 INPUT NODEFVAL "data13x[5..0]"
-- Retrieval info: USED_PORT: data14x 0 0 6 0 INPUT NODEFVAL "data14x[5..0]"
-- Retrieval info: USED_PORT: data15x 0 0 6 0 INPUT NODEFVAL "data15x[5..0]"
-- Retrieval info: USED_PORT: data1x 0 0 6 0 INPUT NODEFVAL "data1x[5..0]"
-- Retrieval info: USED_PORT: data2x 0 0 6 0 INPUT NODEFVAL "data2x[5..0]"
-- Retrieval info: USED_PORT: data3x 0 0 6 0 INPUT NODEFVAL "data3x[5..0]"
-- Retrieval info: USED_PORT: data4x 0 0 6 0 INPUT NODEFVAL "data4x[5..0]"
-- Retrieval info: USED_PORT: data5x 0 0 6 0 INPUT NODEFVAL "data5x[5..0]"
-- Retrieval info: USED_PORT: data6x 0 0 6 0 INPUT NODEFVAL "data6x[5..0]"
-- Retrieval info: USED_PORT: data7x 0 0 6 0 INPUT NODEFVAL "data7x[5..0]"
-- Retrieval info: USED_PORT: data8x 0 0 6 0 INPUT NODEFVAL "data8x[5..0]"
-- Retrieval info: USED_PORT: data9x 0 0 6 0 INPUT NODEFVAL "data9x[5..0]"
-- Retrieval info: USED_PORT: result 0 0 6 0 OUTPUT NODEFVAL "result[5..0]"
-- Retrieval info: USED_PORT: sel 0 0 4 0 INPUT NODEFVAL "sel[3..0]"
-- Retrieval info: CONNECT: @data 1 0 6 0 data0x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 10 6 0 data10x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 11 6 0 data11x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 12 6 0 data12x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 13 6 0 data13x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 14 6 0 data14x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 15 6 0 data15x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 1 6 0 data1x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 2 6 0 data2x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 3 6 0 data3x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 4 6 0 data4x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 5 6 0 data5x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 6 6 0 data6x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 7 6 0 data7x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 8 6 0 data8x 0 0 6 0
-- Retrieval info: CONNECT: @data 1 9 6 0 data9x 0 0 6 0
-- Retrieval info: CONNECT: @sel 0 0 4 0 sel 0 0 4 0
-- Retrieval info: CONNECT: result 0 0 6 0 @result 0 0 6 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL Mux16to4.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Mux16to4.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Mux16to4.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Mux16to4.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL Mux16to4_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
