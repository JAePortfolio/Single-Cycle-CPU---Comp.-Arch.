-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_32bit_arrayMultipler_with_16bitFullAdders.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_32bit_arrayMultipler_with_16bitFullAdders is 
	port(
		Arena_16bitIN_A, Arena_16bitIN_B: in std_logic_vector(15 downto 0);
		Arena_32bitOUT: out std_logic_vector(31 downto 0)
	);
end Arena_32bit_arrayMultipler_with_16bitFullAdders;

architecture Arena_32bit_arrayMultipler_with_16bitFullAdders_arch of Arena_32bit_arrayMultipler_with_16bitFullAdders is
--signal Arena_andGate : std_logic_vector(255 downto 0);
signal Arena_Cout_vec : std_logic_vector(255 downto 0);
--signal Arena_Sum_vec : std_logic_vector (255 downto 0);

type Arena_andGateArray is array (15 downto 0) of std_logic_vector(15 downto 0);
--type Arena_Cout_vecArray is array (15 downto 0) of std_logic_vector(15 downto 0);
type Arena_Sum_vecArray is array (15 downto 0) of std_logic_vector(15 downto 0);
signal Arena_andGate : Arena_andGateArray;
--signal Arena_Cout_vec : Arena_Cout_vecArray;
signal Arena_Sum_vec : Arena_Sum_vecArray;
	component Arena_16bitFullAdder -- Using Full Adder Component
	port(
		Arena_16bitIN_A_fa, Arena_16bitIN_B_fa: in std_logic_vector(15 downto 0);
		Arena_16bitIN_Cin_fa : in std_logic;
		Arena_16bitOUT_Sum_fa : out std_logic_vector(15 downto 0);
		Arena_16bitOUT_Cout_fa : out std_logic
		);
	end component;
	
begin


	Arena_andGate(0)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(0);
	Arena_andGate(0)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(0);
	Arena_andGate(0)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(0);
	Arena_andGate(0)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(0);
	Arena_andGate(0)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(0);
	Arena_andGate(0)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(0);
	Arena_andGate(0)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(0);
	Arena_andGate(0)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(0);
	Arena_andGate(0)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(0);
	Arena_andGate(0)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(0);
	Arena_andGate(0)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(0);
	Arena_andGate(0)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(0);
	Arena_andGate(0)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(0);
	Arena_andGate(0)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(0);
	Arena_andGate(0)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(0);
	Arena_andGate(0)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(0);

	Arena_andGate(1)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(1);
	Arena_andGate(1)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(1);
	Arena_andGate(1)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(1);
	Arena_andGate(1)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(1);
	Arena_andGate(1)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(1);
	Arena_andGate(1)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(1);
	Arena_andGate(1)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(1);
	Arena_andGate(1)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(1);
	Arena_andGate(1)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(1);
	Arena_andGate(1)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(1);
	Arena_andGate(1)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(1);
	Arena_andGate(1)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(1);
	Arena_andGate(1)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(1);
	Arena_andGate(1)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(1);
	Arena_andGate(1)(14)<= Arena_16bitIN_A(14) and Arena_16bitIN_B(1);
	Arena_andGate(1)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(1);

	Arena_andGate(2)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(2);
	Arena_andGate(2)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(2);
	Arena_andGate(2)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(2);
	Arena_andGate(2)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(2);
	Arena_andGate(2)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(2);
	Arena_andGate(2)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(2);
	Arena_andGate(2)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(2);
	Arena_andGate(2)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(2);
	Arena_andGate(2)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(2);
	Arena_andGate(2)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(2);
	Arena_andGate(2)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(2);
	Arena_andGate(2)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(2);
	Arena_andGate(2)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(2);
	Arena_andGate(2)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(2);
	Arena_andGate(2)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(2);
	Arena_andGate(2)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(2);

	Arena_andGate(3)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(3);
	Arena_andGate(3)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(3);
	Arena_andGate(3)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(3);
	Arena_andGate(3)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(3);
	Arena_andGate(3)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(3);
	Arena_andGate(3)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(3);
	Arena_andGate(3)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(3);
	Arena_andGate(3)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(3);
	Arena_andGate(3)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(3);
	Arena_andGate(3)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(3);
	Arena_andGate(3)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(3);
	Arena_andGate(3)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(3);
	Arena_andGate(3)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(3);
	Arena_andGate(3)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(3);
	Arena_andGate(3)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(3);
	Arena_andGate(3)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(3);

	Arena_andGate(4)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(4);
	Arena_andGate(4)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(4);
	Arena_andGate(4)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(4);
	Arena_andGate(4)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(4);
	Arena_andGate(4)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(4);
	Arena_andGate(4)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(4);
	Arena_andGate(4)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(4);
	Arena_andGate(4)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(4);
	Arena_andGate(4)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(4);
	Arena_andGate(4)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(4);
	Arena_andGate(4)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(4);
	Arena_andGate(4)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(4);
	Arena_andGate(4)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(4);
	Arena_andGate(4)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(4);
	Arena_andGate(4)(14)<= Arena_16bitIN_A(14) and Arena_16bitIN_B(4);
	Arena_andGate(4)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(4);

	Arena_andGate(5)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(5);
	Arena_andGate(5)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(5);
	Arena_andGate(5)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(5);
	Arena_andGate(5)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(5);
	Arena_andGate(5)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(5);
	Arena_andGate(5)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(5);
	Arena_andGate(5)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(5);
	Arena_andGate(5)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(5);
	Arena_andGate(5)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(5);
	Arena_andGate(5)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(5);
	Arena_andGate(5)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(5);
	Arena_andGate(5)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(5);
	Arena_andGate(5)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(5);
	Arena_andGate(5)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(5);
	Arena_andGate(5)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(5);
	Arena_andGate(5)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(5);

	Arena_andGate(6)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(6);
	Arena_andGate(6)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(6);
	Arena_andGate(6)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(6);
	Arena_andGate(6)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(6);
	Arena_andGate(6)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(6);
	Arena_andGate(6)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(6);
	Arena_andGate(6)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(6);
	Arena_andGate(6)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(6);
	Arena_andGate(6)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(6);
	Arena_andGate(6)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(6);
	Arena_andGate(6)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(6);
	Arena_andGate(6)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(6);
	Arena_andGate(6)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(6);
	Arena_andGate(6)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(6);
	Arena_andGate(6)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(6);
	Arena_andGate(6)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(6);

	Arena_andGate(7)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(7);
	Arena_andGate(7)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(7);
	Arena_andGate(7)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(7);
	Arena_andGate(7)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(7);
	Arena_andGate(7)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(7);
	Arena_andGate(7)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(7);
	Arena_andGate(7)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(7);
	Arena_andGate(7)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(7);
	Arena_andGate(7)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(7);
	Arena_andGate(7)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(7);
	Arena_andGate(7)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(7);
	Arena_andGate(7)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(7);
	Arena_andGate(7)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(7);
	Arena_andGate(7)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(7);
	Arena_andGate(7)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(7);
	Arena_andGate(7)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(7);

	Arena_andGate(8)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(8);
	Arena_andGate(8)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(8);
	Arena_andGate(8)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(8);
	Arena_andGate(8)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(8);
	Arena_andGate(8)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(8);
	Arena_andGate(8)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(8);
	Arena_andGate(8)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(8);
	Arena_andGate(8)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(8);
	Arena_andGate(8)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(8);
	Arena_andGate(8)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(8);
	Arena_andGate(8)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(8);
	Arena_andGate(8)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(8);
	Arena_andGate(8)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(8);
	Arena_andGate(8)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(8);
	Arena_andGate(8)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(8);
	Arena_andGate(8)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(8);

	Arena_andGate(9)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(9);
	Arena_andGate(9)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(9);
	Arena_andGate(9)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(9);
	Arena_andGate(9)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(9);
	Arena_andGate(9)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(9);
	Arena_andGate(9)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(9);
	Arena_andGate(9)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(9);
	Arena_andGate(9)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(9);
	Arena_andGate(9)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(9);
	Arena_andGate(9)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(9);
	Arena_andGate(9)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(9);
	Arena_andGate(9)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(9);
	Arena_andGate(9)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(9);
	Arena_andGate(9)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(9);
	Arena_andGate(9)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(9);
	Arena_andGate(9)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(9);
	
	Arena_andGate(10)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(10);
	Arena_andGate(10)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(10);
	Arena_andGate(10)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(10);
	Arena_andGate(10)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(10);
	Arena_andGate(10)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(10);
	Arena_andGate(10)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(10);
	Arena_andGate(10)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(10);
	Arena_andGate(10)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(10);
	Arena_andGate(10)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(10);
	Arena_andGate(10)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(10);
	Arena_andGate(10)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(10);
	Arena_andGate(10)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(10);
	Arena_andGate(10)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(10);
	Arena_andGate(10)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(10);
	Arena_andGate(10)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(10);
	Arena_andGate(10)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(10);
	
	Arena_andGate(11)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(11);
	Arena_andGate(11)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(11);
	Arena_andGate(11)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(11);
	Arena_andGate(11)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(11);
	Arena_andGate(11)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(11);
	Arena_andGate(11)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(11);
	Arena_andGate(11)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(11);
	Arena_andGate(11)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(11);
	Arena_andGate(11)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(11);
	Arena_andGate(11)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(11);
	Arena_andGate(11)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(11);
	Arena_andGate(11)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(11);
	Arena_andGate(11)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(11);
	Arena_andGate(11)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(11);
	Arena_andGate(11)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(11);
	Arena_andGate(11)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(11);
	
	Arena_andGate(12)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(12);
	Arena_andGate(12)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(12);
	Arena_andGate(12)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(12);
	Arena_andGate(12)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(12);
	Arena_andGate(12)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(12);
	Arena_andGate(12)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(12);
	Arena_andGate(12)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(12);
	Arena_andGate(12)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(12);
	Arena_andGate(12)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(12);
	Arena_andGate(12)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(12);
	Arena_andGate(12)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(12);
	Arena_andGate(12)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(12);
	Arena_andGate(12)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(12);
	Arena_andGate(12)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(12);
	Arena_andGate(12)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(12);
	Arena_andGate(12)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(12);
	
	Arena_andGate(13)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(13);
	Arena_andGate(13)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(13);
	Arena_andGate(13)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(13);
	Arena_andGate(13)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(13);
	Arena_andGate(13)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(13);
	Arena_andGate(13)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(13);
	Arena_andGate(13)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(13);
	Arena_andGate(13)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(13);
	Arena_andGate(13)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(13);
	Arena_andGate(13)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(13);
	Arena_andGate(13)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(13);
	Arena_andGate(13)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(13);
	Arena_andGate(13)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(13);
	Arena_andGate(13)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(13);
	Arena_andGate(13)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(13);
	Arena_andGate(13)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(13);
	
	Arena_andGate(14)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(14);
	Arena_andGate(14)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(14);
	Arena_andGate(14)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(14);
	Arena_andGate(14)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(14);
	Arena_andGate(14)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(14);
	Arena_andGate(14)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(14);
	Arena_andGate(14)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(14);
	Arena_andGate(14)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(14);
	Arena_andGate(14)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(14);
	Arena_andGate(14)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(14);
	Arena_andGate(14)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(14);
	Arena_andGate(14)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(14);
	Arena_andGate(14)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(14);
	Arena_andGate(14)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(14);
	Arena_andGate(14)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(14);
	Arena_andGate(14)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(14);
	
	Arena_andGate(15)(0) <= Arena_16bitIN_A(0) and Arena_16bitIN_B(15);
	Arena_andGate(15)(1) <= Arena_16bitIN_A(1) and Arena_16bitIN_B(15);
	Arena_andGate(15)(2) <= Arena_16bitIN_A(2) and Arena_16bitIN_B(15);
	Arena_andGate(15)(3) <= Arena_16bitIN_A(3) and Arena_16bitIN_B(15);
	Arena_andGate(15)(4) <= Arena_16bitIN_A(4) and Arena_16bitIN_B(15);
	Arena_andGate(15)(5) <= Arena_16bitIN_A(5) and Arena_16bitIN_B(15);
	Arena_andGate(15)(6) <= Arena_16bitIN_A(6) and Arena_16bitIN_B(15);
	Arena_andGate(15)(7) <= Arena_16bitIN_A(7) and Arena_16bitIN_B(15);
	Arena_andGate(15)(8) <= Arena_16bitIN_A(8) and Arena_16bitIN_B(15);
	Arena_andGate(15)(9) <= Arena_16bitIN_A(9) and Arena_16bitIN_B(15);
	Arena_andGate(15)(10) <= Arena_16bitIN_A(10) and Arena_16bitIN_B(15);
	Arena_andGate(15)(11) <= Arena_16bitIN_A(11) and Arena_16bitIN_B(15);
	Arena_andGate(15)(12) <= Arena_16bitIN_A(12) and Arena_16bitIN_B(15);
	Arena_andGate(15)(13) <= Arena_16bitIN_A(13) and Arena_16bitIN_B(15);
	Arena_andGate(15)(14) <= Arena_16bitIN_A(14) and Arena_16bitIN_B(15);
	Arena_andGate(15)(15) <= Arena_16bitIN_A(15) and Arena_16bitIN_B(15);
	
		----------------------------------------- Full Adder 0 (comp -> signal) --------------------------------------------------
	nbitFA_L0:
	for I in 0 to 14 generate
		nbitFA0: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_andGate(0)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(1)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(0)(I));
	end generate nbitFA_L0;
	
	nbitFA0: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => '0', Arena_16bitIN_B_fa(15) => Arena_andGate(1)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(0)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(0));
	-- FA+15, FA+15, FA+31, '0', FA+15, FA+15, FA
	
	----------------------------------------- Full Adder 1 (comp -> signal) --------------------------------------------------
	nbitFA_L1:
	for I in 0 to 14 generate
		nbitFA1: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(0)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(2)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(1)(I));
	end generate nbitFA_L1;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA1: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(0), Arena_16bitIN_B_fa(15) => Arena_andGate(2)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(1)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(1));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
	
	----------------------------------------- Full Adder 2 (comp -> signal) --------------------------------------------------
	nbitFA_L2:
	for I in 0 to 14 generate
		nbitFA2: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(1)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(3)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(2)(I));
	end generate nbitFA_L2;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA2: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(1), Arena_16bitIN_B_fa(15) => Arena_andGate(3)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(2)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(2));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
		
	----------------------------------------- Full Adder 3 (comp -> signal) --------------------------------------------------
	nbitFA_L3:
	for I in 0 to 14 generate
		nbitFA3: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(2)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(4)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(3)(I));
	end generate nbitFA_L3;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA3: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(2), Arena_16bitIN_B_fa(15) => Arena_andGate(4)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(3)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(3));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
	
	----------------------------------------- Full Adder 4 (comp -> signal) --------------------------------------------------
	nbitFA_L4:
	for I in 0 to 14 generate
		nbitFA4: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(3)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(5)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(4)(I));
	end generate nbitFA_L4;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA4: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(3), Arena_16bitIN_B_fa(15) => Arena_andGate(5)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(4)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(4));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
		
	----------------------------------------- Full Adder 5 (comp -> signal) --------------------------------------------------
	nbitFA_L5:
	for I in 0 to 14 generate
		nbitFA5: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(4)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(6)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(5)(I));
	end generate nbitFA_L5;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA5: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(4), Arena_16bitIN_B_fa(15) => Arena_andGate(6)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(5)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(5));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
		
	----------------------------------------- Full Adder 6 (comp -> signal) --------------------------------------------------
	nbitFA_L6:
	for I in 0 to 14 generate
		nbitFA6: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(5)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(7)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(6)(I));
	end generate nbitFA_L6;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA6: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(5), Arena_16bitIN_B_fa(15) => Arena_andGate(7)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(6)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(6));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA	
			
	----------------------------------------- Full Adder 7 (comp -> signal) --------------------------------------------------
	nbitFA_L7:
	for I in 0 to 14 generate
		nbitFA7: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(6)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(8)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(7)(I));
	end generate nbitFA_L7;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA7: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(6), Arena_16bitIN_B_fa(15) => Arena_andGate(8)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(7)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(7));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA		
			
	----------------------------------------- Full Adder 8 (comp -> signal) --------------------------------------------------
	nbitFA_L8:
	for I in 0 to 14 generate
		nbitFA8: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(7)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(9)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(8)(I));
	end generate nbitFA_L8;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA8: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(7), Arena_16bitIN_B_fa(15) => Arena_andGate(9)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(8)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(8));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA			
			
	----------------------------------------- Full Adder 9 (comp -> signal) --------------------------------------------------
	nbitFA_L9:
	for I in 0 to 14 generate
		nbitFA9: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(8)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(10)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(9)(I));
	end generate nbitFA_L9;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA9: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(8), Arena_16bitIN_B_fa(15) => Arena_andGate(10)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(9)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(9));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
			
	----------------------------------------- Full Adder 10 (comp -> signal) --------------------------------------------------
	nbitFA_L10:
	for I in 0 to 14 generate
		nbitFA10: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(9)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(11)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(10)(I));
	end generate nbitFA_L10;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA10: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(9), Arena_16bitIN_B_fa(15) => Arena_andGate(11)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(10)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(10));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
			
	----------------------------------------- Full Adder 11 (comp -> signal) --------------------------------------------------
	nbitFA_L11:
	for I in 0 to 14 generate
		nbitFA11: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(10)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(12)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(11)(I));
	end generate nbitFA_L11;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA11: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(10), Arena_16bitIN_B_fa(15) => Arena_andGate(12)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(11)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(11));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
			
	----------------------------------------- Full Adder 12 (comp -> signal) --------------------------------------------------
	nbitFA_L12:
	for I in 0 to 14 generate
		nbitFA12: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(11)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(13)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(12)(I));
	end generate nbitFA_L12;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA12: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(11), Arena_16bitIN_B_fa(15) => Arena_andGate(13)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(12)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(12));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
			
	----------------------------------------- Full Adder 13 (comp -> signal) --------------------------------------------------
	nbitFA_L13:
	for I in 0 to 14 generate
		nbitFA13: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(12)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(14)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(13)(I));
	end generate nbitFA_L13;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA13: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(12), Arena_16bitIN_B_fa(15) => Arena_andGate(14)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(13)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(13));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA					
			
	----------------------------------------- Full Adder 14 (comp -> signal) --------------------------------------------------
	nbitFA_L14:
	for I in 0 to 14 generate
		nbitFA14: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(13)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(15)(I),
		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(14)(I));
	end generate nbitFA_L14;
	-- I, +16, +16, '0', Last+16, FA
	nbitFA14: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(13), Arena_16bitIN_B_fa(15) => Arena_andGate(15)(15),
	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(14)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(14));
	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA	
	
	
	
	
	
	
	
--	----------------------------------------- Full Adder 0 (comp -> signal) --------------------------------------------------
--	nbitFA_L0:
--	for I in 0 to 14 generate
--		nbitFA0: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_andGate(0)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(0)(I+16),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(0)(I));
--	end generate nbitFA_L0;
--	
--	nbitFA0: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => '0', Arena_16bitIN_B_fa(15) => Arena_andGate(0)(31),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(0)(15), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(0));
--	-- FA+15, FA+15, FA+31, '0', FA+15, FA+15, FA
--	
--	----------------------------------------- Full Adder 1 (comp -> signal) --------------------------------------------------
--	nbitFA_L1:
--	for I in 0 to 14 generate
--		nbitFA1: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(1)(I+1), Arena_16bitIN_B_fa(I) => Arena_andGate(1)(I+32),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(1)(I+16));
--	end generate nbitFA_L1;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA1: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(0), Arena_16bitIN_B_fa(15) => Arena_andGate(1)(47),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(1)(31), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(1));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
--	
--	----------------------------------------- Full Adder 2 (comp -> signal) --------------------------------------------------
--	nbitFA_L2:
--	for I in 0 to 14 generate
--		nbitFA2: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(2)(I+17), Arena_16bitIN_B_fa(I) => Arena_andGate(2)(I+48),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+32));
--	end generate nbitFA_L2;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA2: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(1), Arena_16bitIN_B_fa(15) => Arena_andGate(2)(63),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(2)(47), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(2));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
--		
--	----------------------------------------- Full Adder 3 (comp -> signal) --------------------------------------------------
--	nbitFA_L3:
--	for I in 0 to 14 generate
--		nbitFA3: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(3)(I+33), Arena_16bitIN_B_fa(I) => Arena_andGate(3)(I+64),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+48));
--	end generate nbitFA_L3;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA3: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(2), Arena_16bitIN_B_fa(15) => Arena_andGate(3)(79),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(3)(63), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(3));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
--	
--	----------------------------------------- Full Adder 4 (comp -> signal) --------------------------------------------------
--	nbitFA_L4:
--	for I in 0 to 14 generate
--		nbitFA4: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(4)(I+49), Arena_16bitIN_B_fa(I) => Arena_andGate(4)(I+80),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+54));
--	end generate nbitFA_L4;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA4: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(3), Arena_16bitIN_B_fa(15) => Arena_andGate(4)(95),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(4)(79), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(4));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
--		
--	----------------------------------------- Full Adder 5 (comp -> signal) --------------------------------------------------
--	nbitFA_L5:
--	for I in 0 to 14 generate
--		nbitFA5: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(5)(I+65), Arena_16bitIN_B_fa(I) => Arena_andGate(5)(I+96),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+70));
--	end generate nbitFA_L5;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA5: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(4), Arena_16bitIN_B_fa(15) => Arena_andGate(5)(111),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(5)(95), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(5));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA
--		
--	----------------------------------------- Full Adder 6 (comp -> signal) --------------------------------------------------
--	nbitFA_L6:
--	for I in 0 to 14 generate
--		nbitFA6: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(6)(I+81), Arena_16bitIN_B_fa(I) => Arena_andGate(6)(I+112),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+86));
--	end generate nbitFA_L6;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA6: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(5), Arena_16bitIN_B_fa(15) => Arena_andGate(6)(127),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(6)(111), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(6));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA	
--			
--	----------------------------------------- Full Adder 7 (comp -> signal) --------------------------------------------------
--	nbitFA_L7:
--	for I in 0 to 14 generate
--		nbitFA7: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(7)(I+97), Arena_16bitIN_B_fa(I) => Arena_andGate(7)(I+128),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+102));
--	end generate nbitFA_L7;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA7: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(6), Arena_16bitIN_B_fa(15) => Arena_andGate(7)(143),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(7)(127), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(7));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA		
--			
--	----------------------------------------- Full Adder 8 (comp -> signal) --------------------------------------------------
--	nbitFA_L8:
--	for I in 0 to 14 generate
--		nbitFA8: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(8)(I+113), Arena_16bitIN_B_fa(I) => Arena_andGate(8)(I+144),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+118));
--	end generate nbitFA_L8;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA8: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(7), Arena_16bitIN_B_fa(15) => Arena_andGate(8)(159),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(8)(143), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(8));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA			
--			
--	----------------------------------------- Full Adder 9 (comp -> signal) --------------------------------------------------
--	nbitFA_L9:
--	for I in 0 to 14 generate
--		nbitFA9: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(9)(I+129), Arena_16bitIN_B_fa(I) => Arena_andGate(9)(I+160),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+134));
--	end generate nbitFA_L9;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA9: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(8), Arena_16bitIN_B_fa(15) => Arena_andGate(9)(175),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(9)(159), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(9));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
--			
--	----------------------------------------- Full Adder 10 (comp -> signal) --------------------------------------------------
--	nbitFA_L10:
--	for I in 0 to 14 generate
--		nbitFA10: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(10)(I+145), Arena_16bitIN_B_fa(I) => Arena_andGate(10)(I+176),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(10)(I+150));
--	end generate nbitFA_L10;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA10: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(9), Arena_16bitIN_B_fa(15) => Arena_andGate(10)(191),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(10)(175), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(10));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
--			
--	----------------------------------------- Full Adder 11 (comp -> signal) --------------------------------------------------
--	nbitFA_L11:
--	for I in 0 to 14 generate
--		nbitFA11: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(11)(I+161), Arena_16bitIN_B_fa(I) => Arena_andGate(11)(I+192),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+166));
--	end generate nbitFA_L11;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA11: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(10), Arena_16bitIN_B_fa(15) => Arena_andGate(11)(207),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(11)(191), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(11));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
--			
--	----------------------------------------- Full Adder 12 (comp -> signal) --------------------------------------------------
--	nbitFA_L12:
--	for I in 0 to 14 generate
--		nbitFA12: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(12)(I+177), Arena_16bitIN_B_fa(I) => Arena_andGate(12)(I+208),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+182));
--	end generate nbitFA_L12;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA12: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(11), Arena_16bitIN_B_fa(15) => Arena_andGate(12)(223),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(12)(207), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(12));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA				
--			
--	----------------------------------------- Full Adder 13 (comp -> signal) --------------------------------------------------
--	nbitFA_L13:
--	for I in 0 to 14 generate
--		nbitFA13: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(13)(I+193), Arena_16bitIN_B_fa(I) => Arena_andGate(13)(I+224),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+196));
--	end generate nbitFA_L13;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA13: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(12), Arena_16bitIN_B_fa(15) => Arena_andGate(13)(239),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(13)(223), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(13));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA					
--			
--	----------------------------------------- Full Adder 14 (comp -> signal) --------------------------------------------------
--	nbitFA_L14:
--	for I in 0 to 14 generate
--		nbitFA14: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(I) => Arena_Sum_vec(14)(I+209), Arena_16bitIN_B_fa(I) => Arena_andGate(14)(I+240),
--		Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(I) => Arena_Sum_vec(I+212));
--	end generate nbitFA_L14;
--	-- I, +16, +16, '0', Last+16, FA
--	nbitFA14: Arena_16bitFullAdder port map(Arena_16bitIN_A_fa(15) => Arena_Cout_vec(13), Arena_16bitIN_B_fa(15) => Arena_andGate(14)(255),
--	Arena_16bitIN_Cin_fa => '0', Arena_16bitOUT_Sum_fa(15) => Arena_Sum_vec(14)(239), Arena_16bitOUT_Cout_fa => Arena_Cout_vec(14));
--	-- 15, Last-1 15, Last+16, '0', 15, FA+16, FA	
	
	-- Results-----------
	Arena_32bitOUT(0) <= Arena_andGate(0)(0);
	Arena_32bitOUT(1) <= Arena_Sum_vec(0)(0);
	Arena_32bitOUT(2) <= Arena_Sum_vec(1)(0);
	Arena_32bitOUT(3) <= Arena_Sum_vec(2)(0);
	Arena_32bitOUT(4) <= Arena_Sum_vec(3)(0);
	Arena_32bitOUT(5) <= Arena_Sum_vec(4)(0);
	Arena_32bitOUT(6) <= Arena_Sum_vec(5)(0);
	Arena_32bitOUT(7) <= Arena_Sum_vec(6)(0);
	Arena_32bitOUT(8) <= Arena_Sum_vec(7)(0);
	Arena_32bitOUT(9) <= Arena_Sum_vec(8)(0);
	Arena_32bitOUT(10) <= Arena_Sum_vec(9)(0);
	Arena_32bitOUT(11) <= Arena_Sum_vec(10)(0);
	Arena_32bitOUT(12) <= Arena_Sum_vec(11)(0);
	Arena_32bitOUT(13) <= Arena_Sum_vec(12)(0);
	Arena_32bitOUT(14) <= Arena_Sum_vec(13)(0);
	Arena_32bitOUT(15) <= Arena_Sum_vec(14)(0);
	Arena_32bitOUT(16) <= Arena_Sum_vec(14)(1);
	Arena_32bitOUT(17) <= Arena_Sum_vec(14)(2);
	Arena_32bitOUT(18) <= Arena_Sum_vec(14)(3);
	Arena_32bitOUT(19) <= Arena_Sum_vec(14)(4);
	Arena_32bitOUT(20) <= Arena_Sum_vec(14)(5);
	Arena_32bitOUT(21) <= Arena_Sum_vec(14)(6);
	Arena_32bitOUT(22) <= Arena_Sum_vec(14)(7);
	Arena_32bitOUT(23) <= Arena_Sum_vec(14)(8);
	Arena_32bitOUT(24) <= Arena_Sum_vec(14)(9);
	Arena_32bitOUT(25) <= Arena_Sum_vec(14)(10);
	Arena_32bitOUT(26) <= Arena_Sum_vec(14)(11);
	Arena_32bitOUT(27) <= Arena_Sum_vec(14)(12);
	Arena_32bitOUT(28) <= Arena_Sum_vec(14)(13);
	Arena_32bitOUT(29) <= Arena_Sum_vec(14)(14);
	Arena_32bitOUT(30) <= Arena_Sum_vec(14)(15);
	Arena_32bitOUT(31) <= Arena_Cout_vec(14);
	
	
	
--	
--	GEN_FA_L0:
--	for I in 1 to 14 generate 
--		FAX : Arena_fullAdder port map (Arena_A_fa => Arena_andGate(I+1), Arena_B_fa => Arena_andGate(I+16),
--		Arena_Cin_fa => Arena_Cout_vec(I-1), Arena_Sum_fa => Arena_Sum_vec(I), Arena_Cout_fa => Arena_Cout_vec(I));
--	end generate GEN_FA_L0;
--	
--	FA15: Arena_fullAdder port map(Arena_A_fa => '0', Arena_B_fa => Arena_andGate(31),
--	Arena_Cin_fa => Arena_Cout_vec(14), Arena_Sum_fa => Arena_Sum_vec(15), Arena_Cout_fa => Arena_Cout_vec(15));
--		
--	


end Arena_32bit_arrayMultipler_with_16bitFullAdders_arch;