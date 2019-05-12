-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_DataMemory.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Arena_DataMemory is
	port(
		Arena_memWrite, Arena_memRead: in std_logic; -- Control Line inputs
		Arena_address: in std_logic_vector(7 downto 0); -- 10 bit address
		Arena_writeData: in std_logic_vector(31 downto 0); -- 32 bit address, 32 bit input data
		Arena_readData: out std_logic_vector(31 downto 0) -- Read data (out) 32 bits
	);
end Arena_DataMemory;
 
architecture Arena_DataMemory_arch of Arena_DataMemory is
type dataMem_loc_array is array(0 to 255) of std_logic_vector(31 downto 0); -- 256 locations of 32 bit data
signal dataMem_loc : dataMem_loc_array;
begin
process(Arena_memWrite, Arena_memRead)
begin
	if(Arena_memWrite = '1') then -- If memWrite enabled
		dataMem_loc(to_integer(unsigned(Arena_address))) <= Arena_writeData; -- Write data
	else
		null;
	end if;
	if(Arena_memRead = '1') then -- if memRead enabled
		Arena_readData <= dataMem_loc(to_integer(unsigned(Arena_address)));
	else
		null;
	end if;
end process;
end Arena_DataMemory_arch;