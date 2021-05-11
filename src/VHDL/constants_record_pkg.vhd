library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.math_real.all;

package constants_record_pkg is

	function sel(Cond: BOOLEAN; If_True, If_False: integer) return integer;

	constant FREQ			: integer	:= 80000000;	-- in Hz
	constant BAUDRATE		: integer	:= 115200;
	constant TIMESTEP		: real 		:= 0.001; 		-- in seconds
	constant CYCLESPRSTEP	: integer 	:= integer(real(FREQ) * TIMESTEP);
	constant MEMCHEAT		: boolean	:= true;		-- make memories smaller to fit Kintex-7
	constant NEUDATAWIDTH	: integer	:= 17;
	constant AXONNR			: integer	:= 1024;
	constant AXONNRCHEAT	: integer	:= 256 * 3;
	constant AXONIDWIDTH	: real		:= round(log2(real(AXONNR)));
	constant TMNEURONS		: integer	:= 32;
	constant N 				: real		:= round(log2(real(TMNEURONS)));
	constant EVALUNITS		: integer	:= 8;
	constant EVALMEMSIZE	: integer;
	constant EVALMEMADDRWIDTH:	real;
	
	-- offsets
	constant OSREFRAC		: integer	:= 0;
	constant OSPOTENTIAL	: integer 	:= TMNEURONS;
	constant OSWEIGHT 		: integer 	:= 2 * TMNEURONS;
	constant OSBIAS			: integer;	
	constant OSDECAY		: integer;	
	constant OSTHRESH		: integer;	
	constant OSREFRACSET	: integer;
	constant OSPOTSET		: integer;
	
	type bool_array is array(0 to EVALUNITS-1) of boolean;
	
	type t_EvalCntrSigs is record 
		potSel		: unsigned(1 downto 0); -- 0: dataIn, 1: sum, 2: potReg
		spikeSel	: unsigned(1 downto 0); -- 0: >thres, 1: reset, 2-3: keep
		refracSel	: unsigned(0 downto 0); -- 0: dataIn, 1: refracReg
		decaySel	: boolean;				-- 1: subtract decay, 0: otherwise
		writeDataSel: unsigned(1 downto 0); -- 0: dataIn, 1: potential, 2: refracCount
	end record t_EvalCntrSigs;

	type nbool_array is array(0 to EVALUNITS-1) of t_EvalCntrSigs;

	constant c_EvalCntrSigs_init 	: t_EvalCntrSigs := (potSel 		=> "10",
														spikeSel 		=> "10",
														refracSel 		=> "1",
														writeDataSel 	=> "00",
														decaySel 		=> false); 

	type neuron_array is array(0 to 4) of unsigned(8 downto 0);
	-- Neurons mapped to each core, in/outcores don't matter as they are used for controlunit in neuron core
	constant neuronsInCore	: neuron_array := ("100000000", "011100100", "011001000", "011001000", "011001000");
	
end package constants_record_pkg;

package body constants_record_pkg is

    function sel(Cond: BOOLEAN; If_True, If_False: integer) return integer is
	begin
		if (Cond = TRUE) then
			return(If_True);
		else
			return(If_False);
		end if;
	end function sel;

	constant EVALMEMSIZE	: integer	:= sel(MEMCHEAT, (7 * TMNEURONS + TMNEURONS * 768), (7 * TMNEURONS + TMNEURONS * AXONNR));
	constant EVALMEMADDRWIDTH:	real 	:= round(log2(real(EVALMEMSIZE)));
	constant OSBIAS			: integer 	:= sel(MEMCHEAT, (2 * TMNEURONS + TMNEURONS * AXONNRCHEAT), (2 * TMNEURONS + TMNEURONS * AXONNR));
	constant OSDECAY		: integer 	:= sel(MEMCHEAT, (3 * TMNEURONS + TMNEURONS * AXONNRCHEAT), (3 * TMNEURONS + TMNEURONS * AXONNR));
	constant OSTHRESH		: integer 	:= sel(MEMCHEAT, (4 * TMNEURONS + TMNEURONS * AXONNRCHEAT), (4 * TMNEURONS + TMNEURONS * AXONNR));
	constant OSREFRACSET	: integer 	:= sel(MEMCHEAT, (5 * TMNEURONS + TMNEURONS * AXONNRCHEAT), (5 * TMNEURONS + TMNEURONS * AXONNR));
	constant OSPOTSET		: integer 	:= sel(MEMCHEAT, (6 * TMNEURONS + TMNEURONS * AXONNRCHEAT), (6 * TMNEURONS + TMNEURONS * AXONNR));
	
end package body constants_record_pkg;