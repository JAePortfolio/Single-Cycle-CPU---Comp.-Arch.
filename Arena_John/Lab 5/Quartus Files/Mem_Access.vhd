-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Mem_Access.vhd
Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.numeric_std.all;

Entity Mem_Access is
Port(
	INPUT_ADDR: in std_logic_vector(31 downto 0); --Address input from PC Counter - to SRAM and DRAM
	INPUT_DATA_IN : in std_logic_vector(31 downto 0); -- Data input from switches on board(32-bit instruction)
	INPUT_WE : in std_logic; -- Write Enable from Switches
	SRAM_ADDR: out std_logic_vector(17 downto 0); -- Input_ADDR_lower going to the SRAM
	SDRAM_ADDR: out std_logic_vector(11 downto 0); -- Input_ADDR_higher going to the SDRAM
	SRAM_DQ : inout std_logic_vector(15 downto 0); -- Data going and coming from the SRAM
	DRAM_DQ: inout std_logic_vector(15 downto 0); -- Data going and coming from the DRAM
	DRAM_CKE: in std_logic; -- Clock enable DRAM
	DRAM_CLK: in std_logic; -- Clock
	
	SRAM_CE_N: out std_logic; -- Chip enable/select going to the SRAM
	SRAM_OE_N: out std_logic; -- Output Enable going to the SRAM
	SRAM_WE_N: out std_logic; -- Write Enable going to the SRAM
	SRAM_UB_N: out std_logic; -- Upper Bytes enable going to the SRAM
	SRAM_LB_N : out std_logic; -- Lower Bytes enable going to the SRAM
	
	DRAM_CE_N: out std_logic; -- Chip enable/select going to the DRAM
	DRAM_OE_N: out std_logic; -- Output Enable going to the DRAM
	DRAM_WE_N: out std_logic; -- Write Enable going to the DRAM
	DRAM_LDQM: out std_logic; -- Lower bytes enable going to DRAM
	DRAM_UDQM: out std_logic; -- High bytes enable going to DRAM
	
	RAM_Instruction: out std_logic_vector(31 downto 0) -- Final 32 bit Instruction

);
End Mem_Access;

Architecture rtl of Mem_Access is
--signal A : std_logic_vector(15 downto 0);
--signal B : std_logic_vector(15 downto 0);
Begin
	SRAM_DQ(15 downto 0)<=INPUT_DATA_IN(15 downto 0) when INPUT_WE = '1' else (others=> 'Z'); -- Lower 16 bits of data - SRAM_DQ is both input and output so we can send data through it and receive data through it.
	DRAM_DQ(15 downto 0)<=INPUT_DATA_IN(31 downto 16) when INPUT_WE = '1' else (others=> 'Z'); -- Upper 16 bits of data - DRAM_DQ is both input and output so we can send data through it and receive data through it.
	
	SRAM_WE_N <= '0' when INPUT_WE = '1' else '1'; -- Since all the SRAM signals are Active Low(only enabled when '0') we write to SRAM by setting it to Zero when we input our WRITE ENABLE from the switch.
	SRAM_CE_N<='0'; -- Chip enable/select is always active since its always '0'
	SRAM_OE_N<='1' when INPUT_WE ='1' else '0'; -- Output enable is only active when our INPUT_WE(write enable switch) is low. 
	SRAM_UB_N<='0'; -- keep the same 
	SRAM_LB_N<='0'; -- keep the same 
		
	DRAM_WE_N <= '0' when INPUT_WE = '1' else '1'; -- Since all the DRAM signals are Active Low(only enabled when '0') we write to DRAM by setting it to Zero when we input our WRITE ENABLE from the switch.
	DRAM_CE_N<='0'; -- Chip enable/select is always active since its always '0'
	DRAM_OE_N<='1' when INPUT_WE ='1' else '0'; -- Output enable is only active when our INPUT_WE(write enable switch) is low. 
	DRAM_UDQM<='0'; -- keep the same 
	DRAM_LDQM<='0'; -- keep the same 
	
	SRAM_ADDR(17 downto 0)<=INPUT_ADDR(17 downto 0); -- Set the first 17 bits of the address to the INPUT_ADDR_lower. Make sure you change this portion to utilize the entire address space. 
	SDRAM_ADDR(11 downto 0)<=INPUT_ADDR(29 downto 18); -- set the remaining part of address
	
	--A <= SRAM_DQ; -- save the Data from the SRAM into Signal for later use( possible to output to the display segments)
	--B <= DRAM_DQ; -- save the data from DRAM into signal
	Ram_Instruction(15 downto 0) <= SRAM_DQ;
	Ram_Instruction(31 downto 16) <= DRAM_DQ;
End rtl;



--                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--      .                 ,     @                                              
--     +@                 @#    @                                              
--    #@@                 @@#   @                                              
--   @@@@                 @@@@  @                                              
--  @@@@@@@@@@@@@@@@@@@@@@@@@@@ @`@@` @@@  ++  @  @    `@@@  @@+               
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ SRAM_DQ
--  @@@@@@@@@@@@@@@@@@@@@@@@@@@'@ @@; @@@ `,`, +@@+    `, `,@  ..              
--   @@@@`````````........@@@@  @'. @ ; @ +@@@ ''''    `, @ #,:@               
--    #@@                 @@@   @ @@  ; `+@  +`;..;    `@@`  '@+,              
--     @@                 @#    @                  .@@@                        
--      ,                 +     @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                        .     @                                              
--                        @#    @                                              
--                        @@#   @                                              
--                        @@@@  @                                              
--    @@@@@@@@@@@@@@@@@@@@@@@@@ @ @@ @@@` @: '+ @.    @: +@@ '@@`,@@'          
--    @@@@@@@@@@@@@@@@@@@@@@@@@@@ SRAM_ADDR
--    @@@@@@@@@@@@@@@@@@@@@@@@@;@  :.@ @ ;@@ '`;`.   '@@ +  @'  @,`@           
--        ``````````......@@@@  @ @@ @ .,@  '+ @`.   @  '+@@`'@@`,` @          
--                        @@@   @                `@@@                          
--                        @#    @                                              
--                        +     @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                        @     @                                              
--                        @@    @                                              
--                        @@@`  @                                              
--    :@@@@@@@@@@@@@@@@@@#@@@@' @ @@  @@@  :;  @  @     `@: .@@@    '` @       
--    :@@@@@@@@@@@@@@@@@@@@@@@@@@;``' ; ;. @@  @..@    `@ ;;..      '@ @       
--    ;@@@@@@@@@@@@@@@@@@@@@@@@@@ SRAM_OE_N
--    ,@@@#@@#@@@@@@@@@@@@@@@@@ @+  @ ;.+ ;@@@ +@+'    .:  +..      ' @@       
--                        @@@+  @ @@; ; ;.@  @ ;;,+     @@@ .@@@    + `@       
--                        @@`   @                                              
--                        @     @                                              
--                        @     @                                              
--                        @@'   @                                              
--                        @@@@  @                                              
--    @@@@@@@@@@@@@@@@@@@@@@@@@ @ @@  @@@  :;  @  @    @ `@ @`@@@    :. @      
--    @@@@@@@@@@@@@@@@@@@@@@@@@@@;``' ; :. @@  @..@    ;`+@ @`,      :@ @      
--    @@@@@@@@@@@@@@@@@@@@@@@@@@@ SRAM_WE_N
--    @@@@@@@@@@@@@@@@@@@@@@@@+ @+  @ ;.+ ;@@@`+@++     @;`'.`,      : @@      
--                        @@@   @ @@; ; ;.@  @ ;:,'     @` @ `@@@    :  @      
--                        @@    @                                              
--                        @     @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @                                              
--                              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   

