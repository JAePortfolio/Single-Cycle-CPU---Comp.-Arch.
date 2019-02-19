-- (First, Last) John Arena - CSC 342/343 - Lab 1 - Spring 2019 Due: 2/20/19
-- Arena_mux2to1_tb.vhd

library ieee;
use ieee.std_logic_1164.all;

Entity Arena_mux2to1_tb is 
end Arena_mux2to1_tb;

Architecture Arena_Arch_mux2to1_tb of Arena_mux2to1_tb is
	signal Arena_X, Arena_Y, Arena_S : std_logic;
	signal Arena_M : std_logic;
	
    -- declare record type
    type test_vector is record
        Arena_X, Arena_Y, Arena_S : std_logic;
        Arena_M : std_logic;
    end record; 

    type test_vector_array is array (natural range <>) of test_vector;
    constant test_vectors : test_vector_array := (
        -- Arena_X, Arena_Y, Arena_S, Arena_M   -- positional method is used below
        ('0', '0', '0', '0'), -- or (X => '0', Y => '0', S => '0', M => '0')
        ('0', '0', '1', '0'),
        ('0', '1', '0', '0'),
        ('0', '1', '1', '1'),
        ('1', '0', '0', '1'),
        ('1', '0', '1', '0'),
        ('1', '1', '0', '1'),
        ('1', '1', '1', '1')

        );

begin
	UUT: entity work.Arena_mux2to1 port map (Arena_X => Arena_X, Arena_Y => Arena_Y, Arena_S => Arena_S, Arena_M => Arena_M);
	
		tb1: process
		begin
			for i in test_vectors'range loop
            Arena_X <= test_vectors(i).Arena_X;  -- signal a = i^th-row-value of test_vector's a
            Arena_Y <= test_vectors(i).Arena_Y; -- row left to right
				Arena_S <= test_vectors(i).Arena_S;
				Arena_M <= test_vectors(i).Arena_M;
            wait for 20 ns;

            assert ( 
                        (Arena_X = test_vectors(i).Arena_X) and 
                        (Arena_Y = test_vectors(i).Arena_Y) and 
                        (Arena_S = test_vectors(i).Arena_S) and 
                        (Arena_M = test_vectors(i).Arena_M) 
                    )

            -- image is used for string-representation of integer etc.
            report  "test_vector " & integer'image(i) & " failed " &  --T'image(x) is a string represesntation of x of type T
                    " for input Arena_X = " & std_logic'image(Arena_X) & 
                    " and Arena_Y = " & std_logic'image(Arena_Y) & 
                    " and Arena_S = " & std_logic'image(Arena_S) & 
                    " for output Arena_M = " & std_logic'image(Arena_M)
                    severity error;
        end loop;
        wait;
    end process; 
end Arena_Arch_mux2to1_tb;