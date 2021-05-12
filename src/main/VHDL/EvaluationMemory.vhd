library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.constants_record_pkg.all;

entity EvaluationMemory is
	generic(
        filename      : string -- initializing Block RAM from external data file
    );
	port(
		io_clk			: in std_logic;
		-- control unit
		io_wr 			: in boolean; -- false: read, true: write
		io_ena 			: in boolean;
		io_addr 		: in unsigned(integer(EVALMEMADDRWIDTH)-1 downto 0); --unsigned
		-- neuron evaluators
		io_writeData 	: in std_logic_vector(NEUDATAWIDTH-1 downto 0);		 --signed
		io_readData 	: out std_logic_vector(NEUDATAWIDTH-1 downto 0)		 --signed
	);
end EvaluationMemory;

architecture syn of EvaluationMemory is
	type RamType is array (0 to EVALMEMSIZE-1) of std_logic_vector(NEUDATAWIDTH-1 downto 0);

	impure function initRamFromFile return RamType is
		file RamFile : text open read_mode is filename;
		variable RamFileLine : line;
		variable RAM : RamType;
	begin
		for I in RamType'range loop
			readline(RamFile, RamFileLine);
			bread(RamFileLine, RAM(I));
		end loop;
		return RAM;
	end function;
	
	signal RAM : RamType := InitRamFromFile;

begin
	process(io_clk)
	begin
		if rising_edge(io_clk) then
 			if (io_ena = true) then
 				if (io_wr = true) then
 					RAM(to_integer(io_addr)) <= io_writeData;
 				else
 					io_readData <= RAM(to_integer(io_addr));
 				end if;
 			end if;
		end if;
	end process;
end syn;