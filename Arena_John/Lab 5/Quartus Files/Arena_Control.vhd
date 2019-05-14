-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_Control.vhd

library ieee;
use ieee.std_logic_1164.all;


entity Arena_Control is
	port(
		Arena_opCode: in std_logic_vector(5 downto 0); -- 6 bits from top 6 bits of Instruction, denoted OPCODE
		Arena_controlLines: out std_logic_vector(6 downto 0); -- 7 control lines
		-- CL6: RegWrite, CL5: ALUSrc, CL4: MemWrite, CL3: MemtoReg, CL2: MemRead, CL1: Branch, CL0: RegDst  -- 
		Arena_aluOP: out std_logic_vector(2 downto 0) -- opcode to be sent to ALU for correct operation 
		);
end Arena_Control;

architecture Arena_Control_arch of Arena_Control is
begin
	process (Arena_opCode)
	begin 
		case Arena_opCode is
			when "000000" => -- R Type Instruction, ex add, sub
			Arena_controlLines <= "1000001"; -- RegDst, RegWrite
			Arena_aluOP <= "010";
			when "100011" => -- I Type instruction, load word
			Arena_controlLines <= "1101100"; -- RegWrite, ALUSrc, MemToReg, MemRead
			Arena_aluOP <= "000";
			when "101011" => -- I type instruction, save word 
			Arena_controlLines <= "0110000"; -- ALUSrc, MemWrite
			Arena_aluOP <= "000";
			when "000100" => -- I type instruction, branch on equal
			Arena_controlLines <= "0000010";
			Arena_aluOP <= "001";
			when "001101" => -- I type instruction ,ORI (used for things such as load immediate)
			Arena_controlLines <= "1100000"; -- RegWrite, ALUSrc
			Arena_aluOP <= "111"; --"111"
			when others =>
			null;
		end case;
	end process;
end Arena_Control_arch;