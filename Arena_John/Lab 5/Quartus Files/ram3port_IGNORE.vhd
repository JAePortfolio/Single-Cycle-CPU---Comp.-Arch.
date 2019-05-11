-- (First, Last) John Arena - CSC 342/343 - Lab 5 - FINAL LAB - Spring 2019 Due: 5/15/19
-- ram3port.vhd

library ieee;
use ieee.std_logic_1164.all;
library altera_mf;
use altera_mf.all;

entity ram3port is
	port(
		clock: in std_logic;
		data: in std_logic_vector(4 downto 0);
		rdaddress_a: in std_logic_vector(4 downto 0);
		rdaddress_b: in std_logic_vector(4 downto 0);
		wraddress: in std_logic_vector(4 downto 0); -- write/dest register
		wren: in std_logic := '1';
		qa: out std_logic_vector(31 downto 0);
		qb: out std_logic_vector(31 downto 0)
		);
end ram3port;

architecture syn of ram3port is
	signal sub_wire0 : std_logic_vector(31 downto 0);
	signal sub_wire1: std_logic_vector(31 downto 0);
	component alt3pram
		generic(
			indata_aclr : string;
			indata_reg : string;
			intended_device_family : string;
			lpm_type : string;
			outdata_aclr_a: string;
			outdata_aclr_b : string;
			outdata_reg_a : string;
			outdata_reg_b: string;
			rdaddress_aclr_a : string;
			rdaddress_aclr_b : string;
			rdaddress_reg_a : string;
			rdaddress_reg_b : string;
			rdcontrol_aclr_a: string;
			rdcontrol_aclr_b: string;
			rdcontrol_reg_a : string;
			rdcontrol_reg_b : string;
			width : natural;
			widthad : natural;
			write_aclr : string;
			write_reg : string
		);
		port(
			qa : out std_logic_vector(31 downto 0);
			outclock : in std_logic;
			qb : out std_logic_vector(31 downto 0);
			wren : in std_logic;
			inclock : in std_logic;
			data : in std_logic_vector(31 downto 0);
			rdaddress_a : in std_logic_vector(4 downto 0);
			rdaddress_b : in std_logic_vector(4 downto 0);
			wraddress : in std_logic_vector(4 downto 0)
			);
	end component;
	
	begin 
		qa <= sub_wire0(31 downto 0);
		qb <= sub_wire1(31 downto 0);
	alt3pram_component : alt3pram
	
	generic map(
		indata_aclr => "OFF", indata_reg => "INCLOCK",
		intended_device_family => "Stratix II", 
		lpm_type =>"alt3pram",
		outdata_aclr_a => "OFF", outdata_aclr_b=> "OFF", 
		outdata_reg_a=>"OUTCLOCK",
		outdata_reg_b => "OUTCLOCK",
		rdaddress_aclr_a => "OFF",
		rdaddress_aclr_b => "OFF",
		rdaddress_reg_a => "INCLOCK",
		rdaddress_reg_b => "INCLOCK",
		rdcontrol_aclr_a => "OFF",
		rdcontrol_aclr_b => "OFF",
		rdcontrol_reg_a => "UNREGISTERED",
		rdcontrol_reg_b => "UNREGISTERED", 
		width => 32,
		widthad => 5,
		write_aclr => "OFF",
		write_reg => "INCLOCK"
		);
		PORT MAP(
			outclock => clock,
			wren => wren,
			inclock => clock,
			data => data,
			rdaddress_a => rdaddress_a,
			wraddress => wraddress,
			rdaddress_b => rdaddress_b,
			qa => sub_wire0,
			qb => sub_wire1
		);
end syn;
	