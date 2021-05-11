library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

use work.constants_record_pkg.all;

entity NeuronEvaluator is
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
end entity NeuronEvaluator;

architecture behaviour of NeuronEvaluator is
	signal sum				: signed(NEUDATAWIDTH downto 0);
	signal sumSat			: signed(NEUDATAWIDTH-1 downto 0);
	signal sumIn1			: signed(NEUDATAWIDTH downto 0);
	signal sumIn2			: signed(NEUDATAWIDTH downto 0);
	signal potDecay 		: signed(NEUDATAWIDTH-1 downto 0);
	signal membPotReg 		: signed(NEUDATAWIDTH-1 downto 0)	:= (others => '0');
	signal refracCntReg		: signed(NEUDATAWIDTH-1 downto 0);
	signal spikeIndiReg 	: boolean							:= false;

	signal membPotRegNext	: signed(NEUDATAWIDTH-1 downto 0);
	signal refracRegNext	: signed(NEUDATAWIDTH-1 downto 0);
	signal spikeIndiRegNext	: boolean;
	

begin
	
	process(all) begin
		--default assignment
		io_dataOut			<= io_dataIn;

		membPotRegNext		<= membPotReg;
		refracRegNext 		<= refracCntReg;
		spikeIndiRegNext	<= spikeIndiReg;


		sumIn1 	<= resize(membPotReg,sumIn1'length);
		if (io_cntrSels.decaySel = true) then
			sumIn2 <= resize(-potDecay,sumIn2'length);
		else
			sumIn2 <= resize(signed(io_dataIn),sumIn2'length);
		end if;
		sum <= sumIn1 + sumIn2;

		-- saturating sum to fit
		sumSat <= sum(NEUDATAWIDTH-1 downto 0); 
		if (sum 	< signed(0 - shift_left(to_unsigned(1,sum'length),NEUDATAWIDTH-1))) then
			sumSat 	<= signed(0 - shift_left(to_unsigned(1,sumSat'length),NEUDATAWIDTH-1));
		elsif (sum 	> signed(shift_left(to_unsigned(1,sum'length),NEUDATAWIDTH-1) - 1)) then
			sumSat 	<= signed(shift_left(to_unsigned(1,sumSat'length),NEUDATAWIDTH-1) - 1);
		else
			null;
		end if;

		case (io_cntrSels.potSel) is -- set membrane potential depending on state
			when "00" =>
				membPotRegNext 	<= signed(io_dataIn); 	-- from memory
			when "01" =>
				membPotRegNext	<= sumSat;				-- result of addition/subtraction
			when "10" =>
				membPotRegNext	<= membPotReg;			-- unchanged
			when others =>
				null;
		end case;

		potDecay <= membPotReg;

		case (io_dataIn(2 downto 0)) is -- set decay factor for membrane potential
			when "001" =>
				potDecay <= shift_right(membPotReg,1); 	-- 50%
			when "010" =>
				potDecay <= shift_right(membPotReg,2); 	-- 25%
			when "011" =>
				potDecay <= shift_right(membPotReg,3); 	-- 12.5%
			when "100" =>
				potDecay <= shift_right(membPotReg,4); 	-- 6.25%
			when "101" =>
				potDecay <= shift_right(membPotReg,5); 	-- 3.125%
			when "110" =>
				potDecay <= shift_right(membPotReg,6); 	-- 1.563%
			when "111" =>
				potDecay <= shift_right(membPotReg,7); 	-- 0.781%
			when others =>
				null;
		end case;

		if (io_cntrSels.refracSel = "0") then -- set refractory value depending on state
			refracRegNext	<= signed(io_dataIn);		-- from memory
		else
			refracRegNext	<= refracCntReg; 			-- unchanged
		end if;

		case (io_cntrSels.spikeSel) is -- set spike indicator depending on state
			when "00" =>
				if (membPotReg > signed(io_dataIn)) then -- if spike
					spikeIndiRegNext <= true;
				else
					spikeIndiRegNext <= false;
				end if;
			when "01" =>
				spikeIndiRegNext <= false;				-- reset spike indicator
			when others =>
				null;									-- unchanged
		end case;

		case (io_cntrSels.writeDataSel) is -- set write data depending on state
			when "00" =>
				io_dataOut 			<= io_dataIn; 		-- default refrac or potential
			when "01" => 
				if (spikeIndiReg = false) then			-- depending on the spike indicator
					io_dataOut		<= std_logic_vector(membPotReg);
				else
					io_dataOut 		<= io_dataIn;
				end if;
			when "10" =>
				if (io_refracIndi = true) then			-- depending on the refractory indicator
					if (spikeIndiReg = true) then
						io_dataOut 	<= io_dataIn;
					else
						io_dataOut 	<= std_logic_vector(refracCntReg);
					end if;
				else
					io_dataOut		<= std_logic_vector(refracCntReg - 1);
				end if;
			when others =>
				null;
		end case;

		if (refracRegNext = 0) then
			io_refracIndi <= true;
		else
			io_refracIndi <= false;
		end if;

		io_spikeIndi 		<= spikeIndiReg;
	end process;

	p_clocking	: process(io_clk) begin
		if rising_edge(io_clk) then
			if (io_reset = '1') then
				membPotReg 		<= (others => '0');
				spikeIndiReg 	<= false;
			else
				if (io_evalEnable = true) then
					refracCntReg 	<= refracRegNext;
					membPotReg 		<= membPotRegNext;
					spikeIndiReg	<= spikeIndiRegNext;
				else
					null;
				end if;
			end if;
		end if;
	end process p_clocking;
end architecture behaviour;