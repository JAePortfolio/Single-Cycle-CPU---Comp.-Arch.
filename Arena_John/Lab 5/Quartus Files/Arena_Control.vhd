-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- Arena_Control.vhd

library ieee;
use ieee.std_logic_1164.all;


entity Arena_Control is
	port(
		Arena_opCode: in std_logic_vector(5 downto 0); -- 6 bits from top 6 bits of Instruction, denoted OPCODE
		Arena_controlLines: out std_logic_vector(6 downto 0); -- 7 control lines
		-- CL6: RegWrite, CL5: ALUSrc, CL4: MemWrite, CL3: MemtoReg, CL2: MemRead, CL1: Branch, CL0: RegDst  -- 
		Arena_aluOP: out std_logic_vector(1 downto 0) -- opcode to be sent to ALU for correct operation 
		);
end Arena_Control;

architecture Arena_Control_arch of Arena_Control is
begin
	process (Arena_opCode)
	begin 
		case Arena_opCode is
			when "000000" => -- R Type Instruction
			Arena_controlLines <= "1000001"; -- RegDst, RegWrite
			when others =>
			null;
		end case;
	end process;
end Arena_Control_arch;