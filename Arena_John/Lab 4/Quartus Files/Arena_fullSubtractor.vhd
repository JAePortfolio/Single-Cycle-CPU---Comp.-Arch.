-- (First, Last) John Arena - CSC 342/343 - Lab 4 - Spring 2019 Due: 4/17/19
-- Arena_fullSubtractor.vhd

library ieee;
use ieee.std_logic_1164.all;

entity Arena_fullSubtractor is 
	port(
		Arena_S_fs, Arena_M_fs, Arena_Bin_fs : in std_logic; -- Subtrahend, Minuend, BorrowIn
		Arena_Difference_fs, Arena_Bout_fs : out std_logic -- Difference, Borrow Out
	);
end Arena_fullSubtractor;
-- Minuend-Subtrahend = Difference
architecture Arena_fullSubtractor_arch of Arena_fullSubtractor is

begin
	Arena_Difference_fs <= Arena_M_fs xor Arena_S_fs
	xor Arena_Bin_fs;
					
	Arena_Bout_fs <= ((not Arena_M_fs) and Arena_Bin_fs) 
	or ((not Arena_M_fs) and Arena_S_fs) or (Arena_Bin_fs and Arena_S_fs);
end Arena_fullSubtractor_arch;