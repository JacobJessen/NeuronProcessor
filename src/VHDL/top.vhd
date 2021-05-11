library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

use work.constants_record_pkg.all;

entity neuron_top is
	generic (
		io_coreID 			: integer
	);
	port (
		clock 			: in std_logic;
		reset 			: in std_logic;
		-- axon system
		io_aData		: in unsigned(integer(AXONIDWIDTH)-1 downto 0); --unsigned
		io_spikeCnt		: in unsigned(integer(AXONIDWIDTH)-1 downto 0);	--unsigned
		io_aAddr		: out unsigned(integer(AXONIDWIDTH)-1 downto 0); --unsigned
		io_aEna			: out boolean;
		io_inOut		: out boolean;
		-- spike transmission
		io_n 			: out unsigned(integer(N)-1 downto 0); --unsigned
		io_spikes_0		: out boolean;
		io_spikes_1		: out boolean;
		io_spikes_2		: out boolean;
		io_spikes_3		: out boolean;
		io_spikes_4		: out boolean;
		io_spikes_5		: out boolean;
		io_spikes_6		: out boolean;
		io_spikes_7		: out boolean
	);
end entity neuron_top;

architecture struct of neuron_top is

--------------------------------------------------------------------------------
-- Control Unit component
--------------------------------------------------------------------------------
	component ControlUnit is
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
	end component ControlUnit;

--------------------------------------------------------------------------------
-- Neuron Evaluator component
--------------------------------------------------------------------------------
	component NeuronEvaluator is
		port (
			io_clk 			: in std_logic;
			io_reset		: in std_logic;
			-- control unit
			io_cntrSels		: in t_EvalCntrSigs;
			io_evalEnable	: in boolean;
			io_spikeIndi	: out boolean;
			io_refracIndi	: out boolean;
			-- evaluation memory
			io_dataIn		: in std_logic_vector(NEUDATAWIDTH-1 downto 0); --signed
			io_dataOut		: out std_logic_vector(NEUDATAWIDTH-1 downto 0) --signed
		);
	end component NeuronEvaluator;

--------------------------------------------------------------------------------
-- Evaluation Memory component
--------------------------------------------------------------------------------
	component EvaluationMemory is
		generic(
			filename 		: string
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
	end component EvaluationMemory;

	
	type ena_bool_array is array(2 to 3) of boolean;
	type data_array is array(0 to EVALUNITS-1) of std_logic_vector(NEUDATAWIDTH-1 downto 0);
	type potSel_array is array(0 to EVALUNITS-1) of unsigned(1 downto 0);
	type spikeSel_array is array(0 to EVALUNITS-1) of unsigned(1 downto 0);
	type refracSel_array is array(0 to EVALUNITS-1) of unsigned(0 downto 0);
	type decaySel_array is array(0 to EVALUNITS-1) of boolean;
	type writeDataSel_array is array(0 to EVALUNITS-1) of unsigned(1 downto 0);

	--ControlUnit & EvalMem
	signal addr_evalMem			: unsigned(integer(EVALMEMADDRWIDTH)-1 downto 0); --unsigned
	signal wr_evalMem			: boolean;
	signal ena_evalMem			: boolean;

	--EvalUnit & EvalMem
	signal readData_evalMem		: data_array;
	signal writeData_evalMem 	: data_array;

	--ControlUnit & EvalUnit
	signal spikeIndi_evalUnit 	: bool_array;
	signal refracIndi_evalUnit 	: bool_array;
	signal cntrSels_potSel 		: potSel_array;
	signal cntrSels_spikeSel	: spikeSel_array;
	signal cntrSels_refracSel 	: refracSel_array;
	signal cntrSels_decaySel 	: decaySel_array;
	signal cntrSels_writeDataSel: writeDataSel_array;
	signal evalEnable_evalUnit 	: ena_bool_array;

	constant fileDirectory     : string := "Y:/home/jacob/myDrive/test_postSynth/NeuromorphicProcessor/mapping/";
	
begin

--------------------------------------------------------------------------------
-- Control Unit
--------------------------------------------------------------------------------
	cntrUnit : ControlUnit 
		generic map(
			coreID 						=> io_coreID
		)
		port map (
			--to Top
			io_clk    					=> clock,
			io_reset    				=> reset,
			io_inOut					=> io_inOut,
			io_spikeCnt 				=> io_spikeCnt,
			io_aAddr 					=> io_aAddr,
			io_aEna 					=> io_aEna,
			io_aData 					=> io_aData,
			io_n 						=> io_n,
			io_spikes(0)				=> io_spikes_0,
			io_spikes(1)				=> io_spikes_1,
			io_spikes(2)				=> io_spikes_2,
			io_spikes(3)				=> io_spikes_3,
			io_spikes(4)				=> io_spikes_4,
			io_spikes(5)				=> io_spikes_5,
			io_spikes(6)				=> io_spikes_6,
			io_spikes(7)				=> io_spikes_7,

			--to EvalMems
			io_addr    					=> addr_evalMem,
			io_wr  						=> wr_evalMem,
			io_ena 						=> ena_evalMem,
			
			--to EvalUnits
			io_spikeIndi(0) 			=> spikeIndi_evalUnit(0),
			io_spikeIndi(1) 			=> spikeIndi_evalUnit(1),
			io_spikeIndi(2) 			=> spikeIndi_evalUnit(2),
			io_spikeIndi(3) 			=> spikeIndi_evalUnit(3),
			io_spikeIndi(4) 			=> spikeIndi_evalUnit(4),
			io_spikeIndi(5) 			=> spikeIndi_evalUnit(5),
			io_spikeIndi(6) 			=> spikeIndi_evalUnit(6),
			io_spikeIndi(7) 			=> spikeIndi_evalUnit(7),
			io_refracIndi(0)  			=> refracIndi_evalUnit(0),
			io_refracIndi(1)  			=> refracIndi_evalUnit(1),
			io_refracIndi(2)  			=> refracIndi_evalUnit(2),
			io_refracIndi(3)  			=> refracIndi_evalUnit(3),
			io_refracIndi(4)  			=> refracIndi_evalUnit(4),
			io_refracIndi(5)  			=> refracIndi_evalUnit(5),
			io_refracIndi(6)  			=> refracIndi_evalUnit(6),
			io_refracIndi(7)  			=> refracIndi_evalUnit(7),
			io_cntrSels(0).potSel  		=> cntrSels_potSel(0),
			io_cntrSels(1).potSel  		=> cntrSels_potSel(1),
			io_cntrSels(2).potSel  		=> cntrSels_potSel(2),
			io_cntrSels(3).potSel  		=> cntrSels_potSel(3),
			io_cntrSels(4).potSel  		=> cntrSels_potSel(4),
			io_cntrSels(5).potSel  		=> cntrSels_potSel(5),
			io_cntrSels(6).potSel  		=> cntrSels_potSel(6),
			io_cntrSels(7).potSel  		=> cntrSels_potSel(7),
			io_cntrSels(0).spikeSel 	=> cntrSels_spikeSel(0),
			io_cntrSels(1).spikeSel 	=> cntrSels_spikeSel(1),
			io_cntrSels(2).spikeSel 	=> cntrSels_spikeSel(2),
			io_cntrSels(3).spikeSel 	=> cntrSels_spikeSel(3),
			io_cntrSels(4).spikeSel 	=> cntrSels_spikeSel(4),
			io_cntrSels(5).spikeSel 	=> cntrSels_spikeSel(5),
			io_cntrSels(6).spikeSel 	=> cntrSels_spikeSel(6),
			io_cntrSels(7).spikeSel 	=> cntrSels_spikeSel(7),
			io_cntrSels(0).refracSel 	=> cntrSels_refracSel(0),
			io_cntrSels(1).refracSel 	=> cntrSels_refracSel(1),
			io_cntrSels(2).refracSel 	=> cntrSels_refracSel(2),
			io_cntrSels(3).refracSel 	=> cntrSels_refracSel(3),
			io_cntrSels(4).refracSel 	=> cntrSels_refracSel(4),
			io_cntrSels(5).refracSel 	=> cntrSels_refracSel(5),
			io_cntrSels(6).refracSel 	=> cntrSels_refracSel(6),
			io_cntrSels(7).refracSel 	=> cntrSels_refracSel(7),
			io_cntrSels(0).decaySel 	=> cntrSels_decaySel(0),
			io_cntrSels(1).decaySel 	=> cntrSels_decaySel(1),
			io_cntrSels(2).decaySel 	=> cntrSels_decaySel(2),
			io_cntrSels(3).decaySel 	=> cntrSels_decaySel(3),
			io_cntrSels(4).decaySel 	=> cntrSels_decaySel(4),
			io_cntrSels(5).decaySel 	=> cntrSels_decaySel(5),
			io_cntrSels(6).decaySel 	=> cntrSels_decaySel(6),
			io_cntrSels(7).decaySel 	=> cntrSels_decaySel(7),
			io_cntrSels(0).writeDataSel => cntrSels_writeDataSel(0),
			io_cntrSels(1).writeDataSel => cntrSels_writeDataSel(1),
			io_cntrSels(2).writeDataSel => cntrSels_writeDataSel(2),
			io_cntrSels(3).writeDataSel => cntrSels_writeDataSel(3),
			io_cntrSels(4).writeDataSel => cntrSels_writeDataSel(4),
			io_cntrSels(5).writeDataSel => cntrSels_writeDataSel(5),
			io_cntrSels(6).writeDataSel => cntrSels_writeDataSel(6),
			io_cntrSels(7).writeDataSel => cntrSels_writeDataSel(7),
			io_evalEnable  				=> evalEnable_evalUnit(io_coreID)
		);

--------------------------------------------------------------------------------
-- Neuron Evaluator
--------------------------------------------------------------------------------
	NEU_gen : for i in 0 to 7 generate
	begin
		neu0 : if (i = 0) generate
		begin		
			neu0 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu0;
		
		neu1 : if (i = 1) generate
		begin	
			neu1 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu1;
		
		neu2 : if (i = 2) generate
		begin	
			neu2 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu2;
		
		neu3 : if (i = 3) generate
		begin	
			neu3 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu3;
		
		neu4 : if (i = 4) generate
		begin	
			neu4 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(4),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(4),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(4),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(4),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(4),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(4),
					io_dataOut					=> writeData_evalMem(4),
					io_spikeIndi				=> spikeIndi_evalUnit(4),
					io_refracIndi 				=> refracIndi_evalUnit(4)
				);
		end generate neu4;
		
		neu5 : if (i = 5) generate
		begin	
			neu5 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu5;
		
		neu6 : if (i = 6) generate
		begin	
			neu6 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu6;
		
		neu7 : if (i = 7) generate
		begin	
			neu7 : NeuronEvaluator 
				port map (
					io_clk 						=> clock,
					io_reset 					=> reset,
					io_cntrSels.potSel 			=> cntrSels_potSel(i),
					io_cntrSels.spikeSel 		=> cntrSels_spikeSel(i),
					io_cntrSels.refracSel 		=> cntrSels_refracSel(i),
					io_cntrSels.decaySel 		=> cntrSels_decaySel(i),
					io_cntrSels.writeDataSel 	=> cntrSels_writeDataSel(i),
					io_evalEnable 				=> evalEnable_evalUnit(io_coreID),
					io_dataIn 					=> readData_evalMem(i),
					io_dataOut					=> writeData_evalMem(i),
					io_spikeIndi				=> spikeIndi_evalUnit(i),
					io_refracIndi 				=> refracIndi_evalUnit(i)
				);
		end generate neu7;
	end generate NEU_gen;
	
--------------------------------------------------------------------------------
-- Evaluation Memory
--------------------------------------------------------------------------------
	evalMem_gen : for i in 0 to 7 generate
	begin
		eMem0 : if (i = 0) generate
		begin
			eMem0 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem0;
		
		eMem1 : if (i = 1) generate
		begin
			eMem1 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem1;
		
		eMem2 : if (i = 2) generate
		begin
			eMem2 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem2;
		
		eMem3 : if (i = 3) generate
		begin
			eMem3 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem3;
		
		eMem4 : if (i = 4) generate
		begin
			eMem4 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem4;
		eMem5 : if (i = 5) generate
		begin
			eMem5 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem5;
		
		eMem6 : if (i = 6) generate
		begin
			eMem6 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem6;
		
		eMem7 : if (i = 7) generate
		begin
			eMem7 : EvaluationMemory 
				generic map(
					filename 		=> fileDirectory & "evaldatac" & integer'image(io_coreID) & "e" & integer'image(i) & ".mem")
				port map(
					io_clk 			=> clock,
					io_wr 			=> wr_evalMem,
					io_ena 			=> ena_evalMem,
					io_addr 		=> addr_evalMem,
					io_writeData 	=> writeData_evalMem(i),
					io_readData 	=> readData_evalMem(i)
				);
		end generate eMem7;	
	end generate evalMem_gen;

end architecture struct;