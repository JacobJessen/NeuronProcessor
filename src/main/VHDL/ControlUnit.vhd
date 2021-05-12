library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.constants_record_pkg.all;

entity ControlUnit is
	generic (
		coreID          : integer
	);
	port (
		io_clk			: in std_logic;
		io_reset		: in std_logic;
		-- evaluation memories
		io_addr			: out unsigned(integer(EVALMEMADDRWIDTH)-1 downto 0);
		io_wr			: out boolean; -- false: read, true: write
		io_ena			: out boolean;
		-- neuron evaluators
		io_spikeIndi	: in bool_array;
		io_refracIndi	: in bool_array;
		io_cntrSels		: out nbool_array;
		io_evalEnable 	: out boolean;
		-- axon system
		io_inOut		: out boolean;
		io_spikeCnt		: in unsigned(integer(AXONIDWIDTH)-1 downto 0);
		io_aAddr		: out unsigned(integer(AXONIDWIDTH)-1 downto 0);
		io_aEna			: out boolean;
		io_aData		: in unsigned(integer(AXONIDWIDTH)-1 downto 0);
		-- spike transmission
		io_n 			: out unsigned(integer(N)-1 downto 0);
		io_spikes 		: out bool_array
	);
end entity ControlUnit;

architecture behaviour of ControlUnit is
	type SM_Main is (idle, rRefrac, rPot, rDecay, rWeight1, rWeight2, rBias, rThresh, rRefracSet, wRefrac, rPotSet, wPot);
	signal stateReg, stateNext 		: SM_Main;

	-- delivers spike pulses to transmission
	signal spikePulse		: bool_array := (others => false);
	-- counts time step cycle down to 0	
	signal tsCycleCnt		: unsigned(16 downto 0);
	-- time-division multiplexing evaluation counter
	signal n 				: unsigned(8 downto 0);
	-- axon system addr counter
	signal a 				: unsigned(integer(AXONIDWIDTH)-1 downto 0);
	-- register that stores sample of axon's incoming spike counter
	signal spikeCnt 		: unsigned(integer(AXONIDWIDTH)-1 downto 0) := (others => '0');
	-- informs spike system of new time step
	signal sigInOut 		: boolean := false;
	-- decides if an evaluation unit has evaluated all mapped neurons
	signal evalUnitActive 	: bool_array := (others => false);
	-- cntrSels used to decide memory address to read or write from
	signal localCntrSels 	: nbool_array;
	-- total number of neurons in the core
	constant nrNeuMapped	: unsigned(8 downto 0) := neuronsInCore(coreID);

	signal spikePulseNext		: bool_array;
	signal tsCycleCntNext		: unsigned(16 downto 0);
	signal nNext				: unsigned(8 downto 0);
	signal aNext				: unsigned(integer(AXONIDWIDTH)-1 downto 0);
	signal spikeCntNext			: unsigned(integer(AXONIDWIDTH)-1 downto 0);
	signal sigInOutNext			: boolean;
	signal evalUnitActiveNext 	: bool_array;
	
begin

	process(all) begin
		--default assignments
		stateNext 			<= stateReg;
		tsCycleCntNext  	<= tsCycleCnt;
		spikeCntNext 		<= spikeCnt;
		sigInOutNext 		<= sigInOut;
		nNext 				<= n;
		aNext 				<= a;
		for i in 0 to EVALUNITS-1 loop
			spikePulseNext(i) 		<= spikePulse(i);
			evalUnitActiveNext(i)	<= evalUnitActive(i);
		end loop;
		
		io_addr 		<= (others => '0');
		io_wr			<= false;
		io_ena 			<= false;
		io_evalEnable	<= true;
		io_inOut 		<= sigInOut;
		io_aAddr 		<= a;
		io_aEna 		<= false;
		io_n 			<= n(4 downto 0);
		

		for i in 0 to EVALUNITS-1 loop
			spikePulseNext(i)				<= false;
			localCntrSels(i).potSel       	<= "10";
    		localCntrSels(i).spikeSel     	<= "10";
    		localCntrSels(i).refracSel    	<= "1";
    		localCntrSels(i).writeDataSel 	<= "00";
    		localCntrSels(i).decaySel     	<= false;

    		if (evalUnitActive(i) = true) then -- ensures that eval unit cntrSels don't reset until all neurons have been updated
				io_cntrSels(i).potSel		<= localCntrSels(i).potSel;
				io_cntrSels(i).spikeSel		<= localCntrSels(i).spikeSel;
				io_cntrSels(i).refracSel	<= localCntrSels(i).refracSel;
				io_cntrSels(i).writeDataSel	<= localCntrSels(i).writeDataSel;
				io_cntrSels(i).decaySel		<= localCntrSels(i).decaySel;
			else
				io_cntrSels(i).potSel		<= "10";
				io_cntrSels(i).spikeSel		<= "10";
				io_cntrSels(i).refracSel	<= "1";
				io_cntrSels(i).writeDataSel	<= "00";
				io_cntrSels(i).decaySel		<= false;
			end if;
			io_spikes(i)					<= spikePulse(i);
		end loop;
		

		




		
		-- time step cycle counter
		tsCycleCntNext <= tsCycleCnt - 1;
		if (tsCycleCnt = 0) then
			tsCycleCntNext <= to_unsigned(CYCLESPRSTEP,tsCycleCnt'length);
		else
			null;
		end if;

		-- sets evaluation units' active state while neurons are being updated
		for i in 0 to EVALUNITS-1 loop
			if (nrNeuMapped > (shift_left(n, 3) + i))  then
				evalUnitActiveNext(i) <= true;
			else
				evalUnitActiveNext(i) <= false;
			end if;
		end loop;


		-- fsm runs through all states of a neuron (n) in all NEUs before incrementing n
		case (stateReg) is
			when idle => 		-- wait until new time-step
				nNext			<= (others => '0');  -- reset # of neurons evaluated
				aNext			<= (others => '0');  -- reset # of axons evaluated
				io_evalEnable	<= false;			 -- enable signal for NEUs
				if (tsCycleCnt = 0) then
					spikeCntNext 	<= io_spikeCnt;  -- receive # of spikes from axon system
					sigInOutNext	<= not sigInOut; -- inform axon system of new time-step
					stateNext 		<= rRefrac;
				else
					null;
				end if;

			when rRefrac =>		-- read refractory counter from memory
				io_ena 			<= true; -- enable read/write in memory
				io_wr 			<= false; -- read from memory
				io_addr 		<= to_unsigned(OSREFRAC,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop -- set to reset spike indicator in NEUs
					localCntrSels(i).spikeSel <= "01"; 
				end loop;
				stateNext		<= rPot;

			when rPot => 		-- read the neuron membrane potential from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSPOTENTIAL,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop -- set to sample dataIn in refrac register in NEUs
					localCntrSels(i).refracSel <= "0"; 
				end loop;
				stateNext		<= rDecay;

			when rDecay =>		-- read decay factor selector from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSDECAY,io_addr'length) + n(4 downto 0);
				aNext 			<= a + 1; -- next axonID will be ready for weight2
				io_aEna 		<= true;
				for i in 0 to EVALUNITS-1 loop -- set to sample dataIn in the potential register in NEUs
					localCntrSels(i).potSel <= "00"; 
				end loop;
				if (spikeCnt = 0) then -- no spikes to evaluate
					stateNext 	<= rBias;
				else
					stateNext	<= rWeight1;
				end if;

			when rWeight1 =>	-- read weight of axon from memory
				io_ena 			<= true;
				io_wr 			<= false;
				if (MEMCHEAT = true) then -- 'true' is for modified network size
					io_addr 	<= to_unsigned(OSWEIGHT,io_addr'length) + (to_unsigned((to_integer(n) * (3 * 256)) + to_integer(unsigned(io_aData)),io_addr'length));
				else
					io_addr	<= to_unsigned(OSWEIGHT,io_addr'length) + (n(4 downto 0) & unsigned(io_aData));
				end if;
				io_aEna 		<= true;
				aNext			<= a + 1;
				for i in 0 to EVALUNITS-1 loop -- set to subtract decay value from membrane potential
					if (io_refracIndi(i) = true) then 
						localCntrSels(i).potSel 	<= "01";
						localCntrSels(i).decaySel	<= true;
					else
						null;
					end if;
				end loop;
				if (spikeCnt = a) then -- 1 spike to evaluate
					stateNext 	<= rBias;
				else
					stateNext	<= rWeight2;
				end if;

			when rWeight2 =>	-- read weight of more axons from memory
				io_ena 			<= true;
				io_wr 			<= false;
				if (MEMCHEAT = true) then
					io_addr 	<= to_unsigned(OSWEIGHT,io_addr'length) + (to_unsigned((to_integer(n) * (3 * 256)) + to_integer(unsigned(io_aData)),io_addr'length));
				else
					io_addr 	<= to_unsigned(OSWEIGHT,io_addr'length) + (n(4 downto 0) & unsigned(io_aData));
				end if;
				io_aEna 		<= true;
				aNext			<= a + 1;
				for i in 0 to EVALUNITS-1 loop -- set to add weight to membrane potential
					if (io_refracIndi(i) = true) then 
						localCntrSels(i).potSel <= "01";
					else
						null;
					end if;
				end loop;
				if (spikeCnt = a - 1) then -- 2 or more spikes to evaluate
					stateNext 	<= rBias;
				else
					stateNext	<= rWeight2;
				end if;

			when rBias =>		-- read bias from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSBIAS,io_addr'length) + n(4 downto 0);
				if (spikeCnt = 0) then -- no spikes to evaluate, so subtract decay from potential
					for i in 0 to EVALUNITS-1 loop
						if (io_refracIndi(i) = true) then
							localCntrSels(i).potSel 	<= "01";
							localCntrSels(i).decaySel	<= true;
						else
							null;
						end if;
					end loop;
				else 				   -- 1 or more spikes to evaluate, so add weight to potential
					for i in 0 to EVALUNITS-1 loop
						if (io_refracIndi(i) = true) then
							localCntrSels(i).potSel <= "01";
						else
							null;
						end if;
					end loop;
				end if;
				stateNext 		<= rThresh;

			when rThresh =>		-- read the membrane threshold from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSTHRESH,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop -- set to add bias to potential
					if (io_refracIndi(i) = true) then
						localCntrSels(i).potSel <= "01"; 
					else
						null;
					end if;
				end loop;
				stateNext 		<= rRefracSet;

			when rRefracSet =>	-- read default refractory value from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSREFRACSET,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop -- set to update spike indicator register
					localCntrSels(i).spikeSel <= "00"; 
				end loop;
				stateNext 		<= wRefrac;

			when wRefrac =>		-- write updated refractory counter to memory
				io_ena 			<= true;
				io_wr 			<= true; -- write to memory
				io_addr 		<= to_unsigned(OSREFRAC,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop  -- set to write refractory value to memory
					localCntrSels(i).writeDataSel 	<= "10";
					spikePulseNext(i) 				<= io_spikeIndi(i);
				end loop;
				stateNext 		<= rPotSet;

			when rPotSet =>		-- read default membrane potential from memory
				io_ena 			<= true;
				io_wr 			<= false;
				io_addr 		<= to_unsigned(OSPOTSET,io_addr'length) + n(4 downto 0);
				stateNext 		<= wPot;

			when wPot =>		-- write updated membrane potential to memory
				io_ena 			<= true;
				io_wr 			<= true; -- write to memory
				io_addr 		<= to_unsigned(OSPOTENTIAL,io_addr'length) + n(4 downto 0);
				for i in 0 to EVALUNITS-1 loop -- set to write membrane potential to memory
					localCntrSels(i).writeDataSel 	<= "01";
				end loop;
				aNext 			<= (others => '0');
				nNext 			<= n + 1; -- increment neuron by 1
				if (shift_left(nNext,3) >= nrNeuMapped) then -- all neurons in core evaluated?
					stateNext 	<= idle;
				else
					stateNext 	<= rRefrac;
				end if;
		end case;

		
	end process;



	p_clocking		: process(io_clk) begin
		if rising_edge(io_clk) then
			if (io_reset = '1') then
				stateReg 		<= idle;				
				tsCycleCnt  	<= to_unsigned(CYCLESPRSTEP,tsCycleCnt'length);
				spikeCnt 		<= (others => '0');
				sigInOut 		<= false;
				for i in 0 to EVALUNITS-1 loop
					spikePulse(i) 		<= false;
					evalUnitActive(i) 	<= false;
				end loop;

			else
				stateReg 	<= stateNext;
				tsCycleCnt 	<= tsCycleCntNext;
				n 			<= nNext;
				a 			<= aNext;
				spikeCnt 	<= spikeCntNext;
				sigInOut 	<= sigInOutNext;
				for i in 0 to EVALUNITS-1 loop
					spikePulse(i) 					<= spikePulseNext(i);
					evalUnitActive(i) 				<= evalUnitActiveNext(i);
				end loop;

			end if;
		end if;
	end process p_clocking;
	
end architecture behaviour;