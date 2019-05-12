-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_Mem_Access_2.vhd
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--MAKE SURE YOU GUYS DELETE THESE COMMENTS AND CUSTOMIZE THE NAMING A BIT. Make it your own file! 

Entity Arena_Mem_Access_2 is
generic(
	WIDE: natural := 32
);
port(
	Arena_INPUT_ADDR : in std_logic_vector(WIDE-1 downto 0);
	Arena_SRAM_ADDR : out std_logic_vector(17 downto 0);
	Arena_INPUT_WE : in std_logic; --Signal to Arena_INPUT_WE
	Arena_start_READ : in std_logic; -- Signal to Read
	Arena_INPUT_DATA_IN : in std_logic_vector(31 downto 0); -- Arena_INPUT_DATA_IN to Arena_INPUT_WE Into Instruction Ram
	Arena_SRAM_DQ : inout std_logic_vector(31 downto 0);
	Arena_SRAM_OE_N : out std_logic;
	Arena_SRAM_WE_N : out std_logic;
	Arena_SRAM_CE_N : out std_logic;
	Arena_SRAM_LB_N : out std_logic;
	Arena_SRAM_UB_N : out std_logic;
	Arena_RAM_Instruction : out std_logic_vector(31 downto 0) := (others=>'0')
);

end Arena_Mem_Access_2;

Architecture Arena_Mem_Access_2_arch of Arena_Mem_Access_2 is

type instr_lower_array is array (0 to 299) of std_logic_vector(15 downto 0); --1000 Instruction limit!
signal instr_lower : instr_lower_array; -- Holds lower half of instruction Since SRAM has only 16 bit output 
signal buff : std_logic_vector(31 downto 0):=(others=>'0'); -- buff for full instruction 

begin 
	Arena_SRAM_ADDR <= Arena_INPUT_ADDR(17 downto 0); -- Use only 18 bits of address since SRAM only has 18 bit Input Address
	Arena_SRAM_DQ(15 downto 0) <= Arena_INPUT_DATA_IN(15 downto 0) when Arena_INPUT_WE = '0' else (others=>'Z'); -- lower half of instruction from SRAM
	Arena_SRAM_DQ(31 downto 16) <= Arena_INPUT_DATA_IN(31 downto 16) when Arena_INPUT_WE = '0' else instr_lower(to_integer(unsigned(Arena_INPUT_ADDR))); -- Get other half from instruction Array
	instr_lower(to_integer(unsigned(Arena_INPUT_ADDR))) <= Arena_SRAM_DQ(31 downto 16); -- Save Arena_INPUT_DATA_IN into Instruction Array
	buff<= Arena_SRAM_DQ when Arena_start_READ ='0' else buff; -- Set the buff for output
	Arena_RAM_Instruction <= buff;
	Arena_SRAM_WE_N <= Arena_INPUT_WE; --SRAM signals for Arena_INPUT_WE and reading
	Arena_SRAM_OE_N <= Arena_start_READ;
	Arena_SRAM_CE_N <= '0';-- active low
	Arena_SRAM_LB_N <= '0'; 
	Arena_SRAM_UB_N <= '0';
	
end Arena_Mem_Access_2_arch;


