-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_16bit_arrayMultipler.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_16bit_arrayMultipler is 
	port(
		Arena_16bitIN_A, Arena_16bitIN_B: in std_logic_vector(15 downto 0);
		Arena_32bitOUT: out std_logic_vector(31 downto 0)
	);
end Arena_16bit_arrayMultipler;

architecture Arena_16bit_arrayMultipler_arch of Arena_16bit_arrayMultipler is
signal Arena_andGate : std_logic_vector(255 downto 0);
signal Arena_Cout_vec : std_logic_vector(255 downto 0);
signal Arena_Sum_vec : std_logic_vector (255 downto 0);


	component Arena_fullAdder -- Using Full Adder Component
	port(
		Arena_A_fa, Arena_B_fa, Arena_Cin_fa: in std_logic;
		Arena_Sum_fa, Arena_Cout_fa : out std_logic
		);
	end component;
	
begin
--	process(Arena_andGate, Arena_16bitIN_A, Arena_16bitIN_B)
--	variable countA : integer := 0;
--	variable countB: integer := 0;
--		begin
--		for I in 0 to 255 loop 
--			if (countA < 16) then
--				Arena_andGate(I) <= Arena_16bitIN_A(countA) and Arena_16bitIN_B(countB);
--				countA := countA + 1;
--			else
--				countA := 0;
--				countB := countB + 1;
--			end if;
--		end loop;
--	end process;

	Arena_andGate(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(0);
	Arena_andGate(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(0);
	Arena_andGate(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(0);
	Arena_andGate(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(0);
	Arena_andGate(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(0);
	Arena_andGate(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(0);
	Arena_andGate(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(0);
	Arena_andGate(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(0);
	Arena_andGate(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(0);
	Arena_andGate(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(0);
	Arena_andGate(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(0);
	Arena_andGate(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(0);
	Arena_andGate(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(0);
	Arena_andGate(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(0);
	Arena_andGate(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(0);
	Arena_andGate(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(0);

	Arena_andGate(16) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(1);
	Arena_andGate(17) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(1);
	Arena_andGate(18) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(1);
	Arena_andGate(19) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(1);
	Arena_andGate(20) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(1);
	Arena_andGate(21) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(1);
	Arena_andGate(22) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(1);
	Arena_andGate(23) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(1);
	Arena_andGate(24) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(1);
	Arena_andGate(25) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(1);
	Arena_andGate(26) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(1);
	Arena_andGate(27) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(1);
	Arena_andGate(28) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(1);
	Arena_andGate(29) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(1);
	Arena_andGate(30) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(1);
	Arena_andGate(31) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(1);

	Arena_andGate(32) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(2);
	Arena_andGate(33) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(2);
	Arena_andGate(34) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(2);
	Arena_andGate(35) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(2);
	Arena_andGate(36) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(2);
	Arena_andGate(37) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(2);
	Arena_andGate(38) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(2);
	Arena_andGate(39) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(2);
	Arena_andGate(40) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(2);
	Arena_andGate(41) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(2);
	Arena_andGate(42) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(2);
	Arena_andGate(43) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(2);
	Arena_andGate(44) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(2);
	Arena_andGate(45) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(2);
	Arena_andGate(46) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(2);
	Arena_andGate(47) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(2);

	Arena_andGate(48) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(3);
	Arena_andGate(49) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(3);
	Arena_andGate(50) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(3);
	Arena_andGate(51) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(3);
	Arena_andGate(52) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(3);
	Arena_andGate(53) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(3);
	Arena_andGate(54) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(3);
	Arena_andGate(55) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(3);
	Arena_andGate(56) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(3);
	Arena_andGate(57) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(3);
	Arena_andGate(58) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(3);
	Arena_andGate(59) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(3);
	Arena_andGate(60) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(3);
	Arena_andGate(61) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(3);
	Arena_andGate(62) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(3);
	Arena_andGate(63) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(3);

	Arena_andGate(64) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(4);
	Arena_andGate(65) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(4);
	Arena_andGate(66) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(4);
	Arena_andGate(67) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(4);
	Arena_andGate(68) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(4);
	Arena_andGate(69) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(4);
	Arena_andGate(70) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(4);
	Arena_andGate(71) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(4);
	Arena_andGate(72) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(4);
	Arena_andGate(73) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(4);
	Arena_andGate(74) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(4);
	Arena_andGate(75) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(4);
	Arena_andGate(76) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(4);
	Arena_andGate(77) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(4);
	Arena_andGate(78) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(4);
	Arena_andGate(79) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(4);

	Arena_andGate(80) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(5);
	Arena_andGate(81) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(5);
	Arena_andGate(82) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(5);
	Arena_andGate(83) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(5);
	Arena_andGate(84) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(5);
	Arena_andGate(85) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(5);
	Arena_andGate(86) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(5);
	Arena_andGate(87) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(5);
	Arena_andGate(88) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(5);
	Arena_andGate(89) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(5);
	Arena_andGate(90) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(5);
	Arena_andGate(91) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(5);
	Arena_andGate(92) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(5);
	Arena_andGate(93) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(5);
	Arena_andGate(94) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(5);
	Arena_andGate(95) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(5);

	Arena_andGate(96) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(6);
	Arena_andGate(97) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(6);
	Arena_andGate(98) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(6);
	Arena_andGate(99) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(6);
	Arena_andGate(100) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(6);
	Arena_andGate(101) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(6);
	Arena_andGate(102) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(6);
	Arena_andGate(103) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(6);
	Arena_andGate(104) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(6);
	Arena_andGate(105) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(6);
	Arena_andGate(106) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(6);
	Arena_andGate(107) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(6);
	Arena_andGate(108) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(6);
	Arena_andGate(109) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(6);
	Arena_andGate(110) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(6);
	Arena_andGate(111) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(6);

	Arena_andGate(112) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(7);
	Arena_andGate(113) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(7);
	Arena_andGate(114) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(7);
	Arena_andGate(115) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(7);
	Arena_andGate(116) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(7);
	Arena_andGate(117) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(7);
	Arena_andGate(118) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(7);
	Arena_andGate(119) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(7);
	Arena_andGate(120) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(7);
	Arena_andGate(121) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(7);
	Arena_andGate(122) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(7);
	Arena_andGate(123) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(7);
	Arena_andGate(124) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(7);
	Arena_andGate(125) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(7);
	Arena_andGate(126) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(7);
	Arena_andGate(127) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(7);

	Arena_andGate(128) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(8);
	Arena_andGate(129) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(8);
	Arena_andGate(130) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(8);
	Arena_andGate(131) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(8);
	Arena_andGate(132) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(8);
	Arena_andGate(133) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(8);
	Arena_andGate(134) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(8);
	Arena_andGate(135) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(8);
	Arena_andGate(136) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(8);
	Arena_andGate(137) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(8);
	Arena_andGate(138) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(8);
	Arena_andGate(139) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(8);
	Arena_andGate(140) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(8);
	Arena_andGate(141) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(8);
	Arena_andGate(142) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(8);
	Arena_andGate(143) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(8);

	Arena_andGate(144) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(9);
	Arena_andGate(145) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(9);
	Arena_andGate(146) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(9);
	Arena_andGate(147) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(9);
	Arena_andGate(148) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(9);
	Arena_andGate(149) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(9);
	Arena_andGate(150) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(9);
	Arena_andGate(151) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(9);
	Arena_andGate(152) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(9);
	Arena_andGate(153) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(9);
	Arena_andGate(154) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(9);
	Arena_andGate(155) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(9);
	Arena_andGate(156) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(9);
	Arena_andGate(157) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(9);
	Arena_andGate(158) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(9);
	Arena_andGate(159) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(9);
	
	Arena_andGate(160) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(10);
	Arena_andGate(161) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(10);
	Arena_andGate(162) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(10);
	Arena_andGate(163) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(10);
	Arena_andGate(164) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(10);
	Arena_andGate(165) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(10);
	Arena_andGate(166) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(10);
	Arena_andGate(167) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(10);
	Arena_andGate(168) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(10);
	Arena_andGate(169) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(10);
	Arena_andGate(170) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(10);
	Arena_andGate(171) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(10);
	Arena_andGate(172) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(10);
	Arena_andGate(173) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(10);
	Arena_andGate(174) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(10);
	Arena_andGate(175) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(10);
	
	Arena_andGate(176) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(11);
	Arena_andGate(177) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(11);
	Arena_andGate(178) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(11);
	Arena_andGate(179) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(11);
	Arena_andGate(180) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(11);
	Arena_andGate(181) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(11);
	Arena_andGate(182) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(11);
	Arena_andGate(183) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(11);
	Arena_andGate(184) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(11);
	Arena_andGate(185) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(11);
	Arena_andGate(186) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(11);
	Arena_andGate(187) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(11);
	Arena_andGate(188) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(11);
	Arena_andGate(189) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(11);
	Arena_andGate(190) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(11);
	Arena_andGate(191) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(11);
	
	Arena_andGate(192) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(12);
	Arena_andGate(193) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(12);
	Arena_andGate(194) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(12);
	Arena_andGate(195) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(12);
	Arena_andGate(196) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(12);
	Arena_andGate(197) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(12);
	Arena_andGate(198) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(12);
	Arena_andGate(199) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(12);
	Arena_andGate(200) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(12);
	Arena_andGate(201) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(12);
	Arena_andGate(202) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(12);
	Arena_andGate(203) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(12);
	Arena_andGate(204) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(12);
	Arena_andGate(205) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(12);
	Arena_andGate(206) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(12);
	Arena_andGate(207) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(12);
	
	Arena_andGate(208) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(13);
	Arena_andGate(209) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(13);
	Arena_andGate(210) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(13);
	Arena_andGate(211) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(13);
	Arena_andGate(212) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(13);
	Arena_andGate(213) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(13);
	Arena_andGate(214) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(13);
	Arena_andGate(215) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(13);
	Arena_andGate(216) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(13);
	Arena_andGate(217) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(13);
	Arena_andGate(218) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(13);
	Arena_andGate(219) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(13);
	Arena_andGate(220) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(13);
	Arena_andGate(221) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(13);
	Arena_andGate(222) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(13);
	Arena_andGate(223) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(13);
	
	Arena_andGate(224) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(14);
	Arena_andGate(225) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(14);
	Arena_andGate(226) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(14);
	Arena_andGate(227) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(14);
	Arena_andGate(228) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(14);
	Arena_andGate(229) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(14);
	Arena_andGate(230) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(14);
	Arena_andGate(231) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(14);
	Arena_andGate(232) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(14);
	Arena_andGate(233) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(14);
	Arena_andGate(234) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(14);
	Arena_andGate(235) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(14);
	Arena_andGate(236) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(14);
	Arena_andGate(237) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(14);
	Arena_andGate(238) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(14);
	Arena_andGate(239) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(14);
	
	Arena_andGate(240) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(15);
	Arena_andGate(241) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(15);
	Arena_andGate(242) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(15);
	Arena_andGate(243) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(15);
	Arena_andGate(244) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(15);
	Arena_andGate(245) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(15);
	Arena_andGate(246) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(15);
	Arena_andGate(247) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(15);
	Arena_andGate(248) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(15);
	Arena_andGate(249) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(15);
	Arena_andGate(250) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(15);
	Arena_andGate(251) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(15);
	Arena_andGate(252) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(15);
	Arena_andGate(253) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(15);
	Arena_andGate(254) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(15);
	Arena_andGate(255) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(15);
	
	-- Full Adders 0-15 (comp -> signal)
	FA0: Arena_fullAdder port map(Arena_A_fa => Arena_andGate(1), Arena_B_fa => Arena_andGate(16),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(0), Arena_Cout_fa => Arena_Cout_vec(0));
	
	GEN_FA_L0:
	for I in 1 to 14 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_andGate(I+1), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L0;
	
	FA15: Arena_fullAdder port map(Arena_A_fa => '0', Arena_B_fa => Arena_andGate(31),
	Arena_Cin_fa => Arena_Cout_vec(14), Arena_Sum_fa => Arena_Sum_vec(15), Arena_Cout_fa => Arena_Cout_vec(15));
		
	--------------------------------- Full Adders 16-31 (comp -> signal)-------------------------------------------
	FA16: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(1), Arena_B_fa => Arena_andGate(32),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(16), Arena_Cout_fa => Arena_Cout_vec(16));
	
	GEN_FA_L1:
	for I in 17 to 30 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L1;
	
	FA31: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(15), Arena_B_fa => Arena_andGate(47),
	Arena_Cin_fa => Arena_Cout_vec(30), Arena_Sum_fa => Arena_Sum_vec(31), Arena_Cout_fa => Arena_Cout_vec(31));
		
	--------------------------------- Full Adders 32-47 (comp -> signal)------------------------------------------
	FA32: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(17), Arena_B_fa => Arena_andGate(48),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(32), Arena_Cout_fa => Arena_Cout_vec(32));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L2:
	for I in 33 to 46 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L2;
	
	FA47: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(31), Arena_B_fa => Arena_andGate(63),
	Arena_Cin_fa => Arena_Cout_vec(46), Arena_Sum_fa => Arena_Sum_vec(47), Arena_Cout_fa => Arena_Cout_vec(47));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA

	--------------------------------- Full Adders 48-63 (comp -> signal)------------------------------------------
	FA48: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(33), Arena_B_fa => Arena_andGate(64),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(48), Arena_Cout_fa => Arena_Cout_vec(48));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L3:
	for I in 49 to 62 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L3;

	FA63: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(47), Arena_B_fa => Arena_andGate(79),
	Arena_Cin_fa => Arena_Cout_vec(62), Arena_Sum_fa => Arena_Sum_vec(63), Arena_Cout_fa => Arena_Cout_vec(63));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA
		
	--------------------------------- Full Adders 64-79 (comp -> signal)------------------------------------------
	FA64: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(49), Arena_B_fa => Arena_andGate(80),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(64), Arena_Cout_fa => Arena_Cout_vec(64));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L4:
	for I in 65 to 78 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L4;

	FA79: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(63), Arena_B_fa => Arena_andGate(95),
	Arena_Cin_fa => Arena_Cout_vec(78), Arena_Sum_fa => Arena_Sum_vec(79), Arena_Cout_fa => Arena_Cout_vec(79));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA	
		
	--------------------------------- Full Adders 80-95 (comp -> signal)------------------------------------------
	FA80: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(65), Arena_B_fa => Arena_andGate(96),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(80), Arena_Cout_fa => Arena_Cout_vec(80));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L5:
	for I in 81 to 94 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L5;

	FA95: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(79), Arena_B_fa => Arena_andGate(111),
	Arena_Cin_fa => Arena_Cout_vec(94), Arena_Sum_fa => Arena_Sum_vec(95), Arena_Cout_fa => Arena_Cout_vec(95));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA	
		
	--------------------------------- Full Adders 96-111 (comp -> signal)------------------------------------------
	FA96: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(81), Arena_B_fa => Arena_andGate(112),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(96), Arena_Cout_fa => Arena_Cout_vec(96));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L6:
	for I in 97 to 110 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L6;

	FA111: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(95), Arena_B_fa => Arena_andGate(127),
	Arena_Cin_fa => Arena_Cout_vec(110), Arena_Sum_fa => Arena_Sum_vec(111), Arena_Cout_fa => Arena_Cout_vec(111));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA	
		
	--------------------------------- Full Adders 112-127 (comp -> signal)------------------------------------------
	FA112: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(97), Arena_B_fa => Arena_andGate(128),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(112), Arena_Cout_fa => Arena_Cout_vec(112));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L7:
	for I in 113 to 126 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L7;

	FA127: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(111), Arena_B_fa => Arena_andGate(143),
	Arena_Cin_fa => Arena_Cout_vec(126), Arena_Sum_fa => Arena_Sum_vec(127), Arena_Cout_fa => Arena_Cout_vec(127));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA

		
	--------------------------------- Full Adders 128-143 (comp -> signal)------------------------------------------
	FA128: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(113), Arena_B_fa => Arena_andGate(144),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(128), Arena_Cout_fa => Arena_Cout_vec(128));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L8:
	for I in 129 to 142 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L8;

	FA143: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(127), Arena_B_fa => Arena_andGate(159),
	Arena_Cin_fa => Arena_Cout_vec(142), Arena_Sum_fa => Arena_Sum_vec(143), Arena_Cout_fa => Arena_Cout_vec(143));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 144-159 (comp -> signal)------------------------------------------
	FA144: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(129), Arena_B_fa => Arena_andGate(160),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(144), Arena_Cout_fa => Arena_Cout_vec(144));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L9:
	for I in 145 to 158 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L9;

	FA159: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(143), Arena_B_fa => Arena_andGate(175),
	Arena_Cin_fa => Arena_Cout_vec(158), Arena_Sum_fa => Arena_Sum_vec(159), Arena_Cout_fa => Arena_Cout_vec(159));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 160-175 (comp -> signal)------------------------------------------
	FA160: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(145), Arena_B_fa => Arena_andGate(176),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(160), Arena_Cout_fa => Arena_Cout_vec(160));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L10:
	for I in 161 to 174 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L10;

	FA175: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(159), Arena_B_fa => Arena_andGate(191),
	Arena_Cin_fa => Arena_Cout_vec(174), Arena_Sum_fa => Arena_Sum_vec(175), Arena_Cout_fa => Arena_Cout_vec(175));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 176-191 (comp -> signal)------------------------------------------
	FA176: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(161), Arena_B_fa => Arena_andGate(192),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(176), Arena_Cout_fa => Arena_Cout_vec(176));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L11:
	for I in 177 to 190 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L11;

	FA191: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(175), Arena_B_fa => Arena_andGate(207),
	Arena_Cin_fa => Arena_Cout_vec(190), Arena_Sum_fa => Arena_Sum_vec(191), Arena_Cout_fa => Arena_Cout_vec(191));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 192-207 (comp -> signal)------------------------------------------
	FA192: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(177), Arena_B_fa => Arena_andGate(208),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(192), Arena_Cout_fa => Arena_Cout_vec(192));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L12:
	for I in 193 to 206 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L12;

	FA207: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(191), Arena_B_fa => Arena_andGate(223),
	Arena_Cin_fa => Arena_Cout_vec(206), Arena_Sum_fa => Arena_Sum_vec(207), Arena_Cout_fa => Arena_Cout_vec(207));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 208-223 (comp -> signal)------------------------------------------
	FA208: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(193), Arena_B_fa => Arena_andGate(224),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(208), Arena_Cout_fa => Arena_Cout_vec(208));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L13:
	for I in 209 to 222 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L13;

	FA223: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(207), Arena_B_fa => Arena_andGate(239),
	Arena_Cin_fa => Arena_Cout_vec(222), Arena_Sum_fa => Arena_Sum_vec(223), Arena_Cout_fa => Arena_Cout_vec(223));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
	--------------------------------- Full Adders 224-239 (comp -> signal)------------------------------------------
	FA224: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(209), Arena_B_fa => Arena_andGate(240),
	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(224), Arena_Cout_fa => Arena_Cout_vec(224));
	-- 1) FA-15 2)FA+16 3)FA 4)FA
	GEN_FA_L14:
	for I in 225 to 238 generate 
		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
	end generate GEN_FA_L14;

	FA239: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(223), Arena_B_fa => Arena_andGate(255),
	Arena_Cin_fa => Arena_Cout_vec(238), Arena_Sum_fa => Arena_Sum_vec(239), Arena_Cout_fa => Arena_Cout_vec(239));
	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		
		
--	--------------------------------- Full Adders 240-255 (comp -> signal)------------------------------------------
--	FA240: Arena_fullAdder port map(Arena_A_fa => Arena_Sum_vec(225), Arena_B_fa => Arena_andGate(256),
--	Arena_Cin_fa => '0', Arena_Sum_fa => Arena_Sum_vec(240), Arena_Cout_fa => Arena_Cout_vec(240));
--	-- 1) FA-15 2)FA+16 3)FA 4)FA
--	GEN_FA_L15:
--	for I in 241 to 254 generate 
--		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_Sum_vec(I-15), Arena_B_fa => Arena_andGate(I+16),
--		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
--	end generate GEN_FA_L15;
--
--	FA255: Arena_fullAdder port map(Arena_A_fa => Arena_Cout_vec(239), Arena_B_fa => Arena_andGate(271),
--	Arena_Cin_fa => Arena_Cout_vec(254), Arena_Sum_fa => Arena_Sum_vec(255), Arena_Cout_fa => Arena_Cout_vec(255));
--	-- 1) FA-16 2)FA+16 3) FA-1 4)FA 5)FA		

	-- Result
	Arena_32bitOUT(0) <= Arena_andGate(0);
	Arena_32bitOUT(1) <= Arena_Sum_vec(0);
	Arena_32bitOUT(2) <= Arena_Sum_vec(16);
	Arena_32bitOUT(3) <= Arena_Sum_vec(32);
	Arena_32bitOUT(4) <= Arena_Sum_vec(48);
	Arena_32bitOUT(5) <= Arena_Sum_vec(64);
	Arena_32bitOUT(6) <= Arena_Sum_vec(80);
	Arena_32bitOUT(7) <= Arena_Sum_vec(96);
	Arena_32bitOUT(8) <= Arena_Sum_vec(112);
	Arena_32bitOUT(9) <= Arena_Sum_vec(128);
	Arena_32bitOUT(10) <= Arena_Sum_vec(144);
	Arena_32bitOUT(11) <= Arena_Sum_vec(160);
	Arena_32bitOUT(12) <= Arena_Sum_vec(176);
	Arena_32bitOUT(13) <= Arena_Sum_vec(192);
	Arena_32bitOUT(14) <= Arena_Sum_vec(208);
	Arena_32bitOUT(15) <= Arena_Sum_vec(224);
	Arena_32bitOUT(16) <= Arena_Sum_vec(225);
	Arena_32bitOUT(17) <= Arena_Sum_vec(226);
	Arena_32bitOUT(18) <= Arena_Sum_vec(227);
	Arena_32bitOUT(19) <= Arena_Sum_vec(228);
	Arena_32bitOUT(20) <= Arena_Sum_vec(229);
	Arena_32bitOUT(21) <= Arena_Sum_vec(230);
	Arena_32bitOUT(22) <= Arena_Sum_vec(231);
	Arena_32bitOUT(23) <= Arena_Sum_vec(232);
	Arena_32bitOUT(24) <= Arena_Sum_vec(233);
	Arena_32bitOUT(25) <= Arena_Sum_vec(234);
	Arena_32bitOUT(26) <= Arena_Sum_vec(235);
	Arena_32bitOUT(27) <= Arena_Sum_vec(236);
	Arena_32bitOUT(28) <= Arena_Sum_vec(237);
	Arena_32bitOUT(29) <= Arena_Sum_vec(238);
	Arena_32bitOUT(30) <= Arena_Sum_vec(239);
	Arena_32bitOUT(31) <= Arena_Cout_vec(239);


end Arena_16bit_arrayMultipler_arch;