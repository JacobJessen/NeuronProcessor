library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use std.textio.all;

use work.constants_record_pkg.all;

entity top_tb is
end entity top_tb;

architecture tb of top_tb is
    constant clock_period : time := 5 ns;
    constant sys_clk_per  : time := 12.5 ns;
    constant clk_offset   : time := 0.1 ns;
    --signal   TbSimEnded   : std_logic := '0';

    signal clk_p        : std_logic := '0';
    signal clk_n        : std_logic := '1';
    signal rst          : std_logic := '1';
    signal sigInOut     : boolean;
    signal spikeCnt     : unsigned(10-1 downto 0); --unsigned
    signal aAddr        : unsigned(10-1 downto 0); --unsigned
    signal aEna         : boolean;
    signal aData        : unsigned(10-1 downto 0); --unsigned
    signal n            : unsigned(5-1 downto 0); --unsigned
    signal spikes       : bool_array;

    component neuroTop is
        port (
            sysclk_n        : in std_logic;
            sysclk_p        : in std_logic;
            reset           : in std_logic;
            io_inOut        : out boolean;
            io_spikeCnt     : in unsigned(10-1 downto 0); --unsigned
            io_aAddr        : out unsigned(10-1 downto 0); --unsigned
            io_aEna         : out boolean;
            io_aData        : in unsigned(10-1 downto 0); --unsigned
            io_n            : out unsigned(5-1 downto 0); --unsigned
            io_spikes_0     : out boolean;
            io_spikes_1     : out boolean;
            io_spikes_2     : out boolean;
            io_spikes_3     : out boolean;
            io_spikes_4     : out boolean;
            io_spikes_5     : out boolean;
            io_spikes_6     : out boolean;
            io_spikes_7     : out boolean
        );
    end component neuroTop;
    

begin
    uut : neuroTop
        port map(
            sysclk_n    => clk_p,
            sysclk_p    => clk_n,
            reset       => rst,
            io_inOut    => sigInOut,
            io_spikeCnt => spikeCnt,
            io_aAddr    => aAddr,
            io_aEna     => aEna,
            io_aData    => aData,
            io_n        => n,
            io_spikes_0 => spikes(0),
            io_spikes_1 => spikes(1),
            io_spikes_2 => spikes(2),
            io_spikes_3 => spikes(3),
            io_spikes_4 => spikes(4),
            io_spikes_5 => spikes(5),
            io_spikes_6 => spikes(6),
            io_spikes_7 => spikes(7)
        );

    Stimuli : process begin
        -- EDIT Adapt initialization as needed
        spikeCnt    <= "0000000000";
        aData       <= "0000000000";
        
        wait for sys_clk_per*80000;

-- #09000295100
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 640042.6 * sys_clk_per; ------------------------------------------------ 
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 1 * clk_offset;
            aData <= "0000000000";      spikeCnt <= "0000000001";      wait for 2 * sys_clk_per; -- 1
			aData <= "0000000000";      spikeCnt <= "0000000010";      wait for 2 * sys_clk_per; -- 2
			aData <= "0000000000";      spikeCnt <= "0000000011";      wait for 2 * sys_clk_per; -- 3
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 2 * sys_clk_per; -- 4
			aData <= "0000000000";      spikeCnt <= "0000000101";      wait for 2 * sys_clk_per; -- 5
			aData <= "0000000000";      spikeCnt <= "0000000110";      wait for 2 * sys_clk_per; -- 6
			aData <= "0000000000";      spikeCnt <= "0000000111";      wait for 2 * sys_clk_per; -- 7
			aData <= "0000000000";      spikeCnt <= "0000001000";      wait for 8 * sys_clk_per; -- 8
			aData <= "0000000000";      spikeCnt <= "0000001001";      wait for 2 * sys_clk_per; -- 9
			aData <= "0000000000";      spikeCnt <= "0000001010";      wait for 3 * sys_clk_per; -- 10
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 2 * sys_clk_per; -- 11
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 2 * sys_clk_per; -- 12
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 2 * sys_clk_per; -- 13
			aData <= "0000000000";      spikeCnt <= "0000001110";      wait for 2 * sys_clk_per; -- 14
			aData <= "0000000000";      spikeCnt <= "0000001111";      wait for 9 * sys_clk_per; -- 15
			aData <= "0000000000";      spikeCnt <= "0000010000";      wait for 2 * sys_clk_per; -- 16
			aData <= "0000000000";      spikeCnt <= "0000010001";      wait for 3 * sys_clk_per; -- 17
			aData <= "0000000000";      spikeCnt <= "0000010010";      wait for 2 * sys_clk_per; -- 18
			aData <= "0000000000";      spikeCnt <= "0000010011";      wait for 2 * sys_clk_per; -- 19
			aData <= "0000000000";      spikeCnt <= "0000010100";      wait for 2 * sys_clk_per; -- 20
			aData <= "0000000000";      spikeCnt <= "0000010101";      wait for 12 * sys_clk_per; -- 21
			aData <= "0000000000";      spikeCnt <= "0000010110";      wait for 2 * sys_clk_per; -- 22
			aData <= "0000000000";      spikeCnt <= "0000010111";      wait for 19 * sys_clk_per; -- 23
			aData <= "0000000000";      spikeCnt <= "0000011000";      wait for 110 * sys_clk_per; -- 24
			aData <= "0000000000";      spikeCnt <= "0000011001";      wait for 2 * sys_clk_per; -- 25
			aData <= "0000000000";      spikeCnt <= "0000011010";      wait for 16 * sys_clk_per; -- 26
			aData <= "0000000000";      spikeCnt <= "0000011011";      wait for 2 * sys_clk_per; -- 27
			aData <= "0000000000";      spikeCnt <= "0000011100";      wait for 2 * sys_clk_per; -- 28
			aData <= "0000000000";      spikeCnt <= "0000011101";      wait for 2 * sys_clk_per; -- 29
			aData <= "0000000000";      spikeCnt <= "0000011110";      wait for 2 * sys_clk_per; -- 30
			aData <= "0000000000";      spikeCnt <= "0000011111";      wait for 2 * sys_clk_per; -- 31
			aData <= "0000000000";      spikeCnt <= "0000100000";      wait for 2 * sys_clk_per; -- 32
			aData <= "0000000000";      spikeCnt <= "0000100001";      wait for 2 * sys_clk_per; -- 33
			aData <= "0000000000";      spikeCnt <= "0000100010";      wait for 2 * sys_clk_per; -- 34
			aData <= "0000000000";      spikeCnt <= "0000100011";      wait for 3 * sys_clk_per; -- 35
			aData <= "0000000000";      spikeCnt <= "0000100100";      wait for 2 * sys_clk_per; -- 36
			aData <= "0000000000";      spikeCnt <= "0000100101";      wait for 2 * sys_clk_per; -- 37
			aData <= "0000000000";      spikeCnt <= "0000100110";      wait for 2 * sys_clk_per; -- 38
			aData <= "0000000000";      spikeCnt <= "0000100111";      wait for 2 * sys_clk_per; -- 39
			aData <= "0000000000";      spikeCnt <= "0000101000";      wait for 2 * sys_clk_per; -- 40
			aData <= "0000000000";      spikeCnt <= "0000101001";      wait for 3 * sys_clk_per; -- 41
			aData <= "0000000000";      spikeCnt <= "0000101010";      wait for 2 * sys_clk_per; -- 42
-- #09000545100
			aData <= "0000000000";      spikeCnt <= "0000101011";      wait for 79732 * sys_clk_per; -- 43 ------------------------------------------------ 
-- #10000307600
			aData <= "0100001110";      spikeCnt <= "0000101011";      wait for 1 * sys_clk_per;
			aData <= "0100001110";      spikeCnt <= "0000000000";      wait for 3 * sys_clk_per;
-- #10000357600
			aData <= "0100001101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000370100
			aData <= "0100010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000382600
			aData <= "0100010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000395100
			aData <= "0100010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000407600
			aData <= "0100001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000420100
			aData <= "0100010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000432600
			aData <= "0100010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000445100
			aData <= "0100100100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000457600
			aData <= "0100100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000470100
			aData <= "0100100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000482600
			aData <= "0100100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000495100
			aData <= "0100100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000507600
			aData <= "0100101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000520100
			aData <= "0100101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000532600
			aData <= "0100111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000545100
			aData <= "0100111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000557600
			aData <= "0100111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000570100
			aData <= "0100111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000582600
			aData <= "0100111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000595100
			aData <= "0100111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000607600
			aData <= "0101010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000620100
			aData <= "0101010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000632600
			aData <= "0001100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000645100
			aData <= "0011010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000657600
			aData <= "0011010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000670100---------------------------------------------------------------------------
			aData <= "0011100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000682600
			aData <= "0011100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000695100
			aData <= "0011101010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000707600
			aData <= "0011101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000720100
			aData <= "0011101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000732600
			aData <= "0011100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000745100
			aData <= "0011101101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000757600
			aData <= "0011101100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000770100
			aData <= "0011101011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000782600
			aData <= "0011111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000795100
			aData <= "0011111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #10000807600
			aData <= "0011111101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000820100
			aData <= "0011111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000832600
			aData <= "0011111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000845100
			aData <= "0011111010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000857600
			aData <= "0011111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000870100
			aData <= "0011111110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #10000882600
			aData <= "0000000000";      spikeCnt <= "0000000001";      wait for 2 * sys_clk_per; ------------------------------------------------
			aData <= "0000000000";      spikeCnt <= "0000000010";      wait for 8 * sys_clk_per; ------------------------------------------------ 
-- #10001007600
			aData <= "0100001110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001020100
			aData <= "0100001101";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001032600
			aData <= "0100010010";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001045100
			aData <= "0100010001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001057600
			aData <= "0100010000";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001070100
			aData <= "0100001111";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001082600
			aData <= "0100010100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001095100
			aData <= "0100010011";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001107600
			aData <= "0100100100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001120100
			aData <= "0100100011";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001132600
			aData <= "0100100111";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001145100
			aData <= "0100100110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001157600
			aData <= "0100100101";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001170100
			aData <= "0100101001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001182600
			aData <= "0100101000";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001195100
			aData <= "0100111010";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001207600
			aData <= "0100111001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001220100
			aData <= "0100111110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001232600
			aData <= "0100111101";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001245100
			aData <= "0100111100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001257600
			aData <= "0100111011";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001270100
			aData <= "0101010001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001282600
			aData <= "0101010000";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001295100
			aData <= "0001100101";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001307600
			aData <= "0011010100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001320100
			aData <= "0011010011";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001332600
			aData <= "0011100110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001345100
			aData <= "0011100101";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001357600
			aData <= "0011101010";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #10001370100
			aData <= "0011101001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #10001382600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #10001395100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #10001407600
			aData <= "0011101101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001420100
			aData <= "0011101100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001432600
			aData <= "0011101011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001445100
			aData <= "0011111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001457600
			aData <= "0011111000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001470100
			aData <= "0011111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001482600
			aData <= "0011111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001495100
			aData <= "0011111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001507600
			aData <= "0011111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001520100
			aData <= "0011111111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001532600
			aData <= "0011111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001545100
			aData <= "0000000000";      spikeCnt <= "0000000101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10001670100
			aData <= "0100001110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001682600
			aData <= "0100001101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001695100
			aData <= "0100010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001707600
			aData <= "0100010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001720100
			aData <= "0100010000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001732600
			aData <= "0100001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001745100
			aData <= "0100010100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001757600
			aData <= "0100010011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001770100
			aData <= "0100100100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001782600
			aData <= "0100100011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001795100
			aData <= "0100100111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001807600
			aData <= "0100100110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001820100
			aData <= "0100100101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001832600
			aData <= "0100101001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001845100
			aData <= "0100101000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001857600
			aData <= "0100111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001870100
			aData <= "0100111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001882600
			aData <= "0100111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001895100
			aData <= "0100111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001907600
			aData <= "0100111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001920100
			aData <= "0100111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001932600
			aData <= "0101010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001945100
			aData <= "0101010000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001957600
			aData <= "0001100101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001970100
			aData <= "0011010100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001982600
			aData <= "0011010011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10001995100
			aData <= "0011100110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002007600
			aData <= "0011100101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002020100
			aData <= "0011101010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002032600
			aData <= "0011101001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002045100
			aData <= "0011101000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002057600
			aData <= "0011100111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002070100
			aData <= "0011101101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002082600
			aData <= "0011101100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002095100
			aData <= "0011101011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002107600
			aData <= "0011111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002120100
			aData <= "0011111000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002132600
			aData <= "0011111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002145100
			aData <= "0011111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002157600
			aData <= "0011111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002170100
			aData <= "0011111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002182600
			aData <= "0011111111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #10002195100
			aData <= "0011111110";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002207600
			aData <= "0000000000";      spikeCnt <= "0000000110";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10002332600
			aData <= "0100001110";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002345100
			aData <= "0100001101";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002357600
			aData <= "0100010010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002370100
			aData <= "0100010001";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002382600
			aData <= "0100010000";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002395100
			aData <= "0100001111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002407600
			aData <= "0100010100";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002420100
			aData <= "0100010011";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002432600
			aData <= "0100100100";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002445100
			aData <= "0100100011";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002457600
			aData <= "0100100111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002470100
			aData <= "0100100110";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #10002482600
			aData <= "0100100101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002495100
			aData <= "0100101001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002507600
			aData <= "0100101000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002520100
			aData <= "0100111010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002532600
			aData <= "0100111001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002545100
			aData <= "0100111110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002557600
			aData <= "0100111101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002570100
			aData <= "0100111100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002582600
			aData <= "0100111011";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002595100
			aData <= "0101010001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002607600
			aData <= "0101010000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002620100
			aData <= "0001100101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002632600
			aData <= "0011010100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002645100
			aData <= "0011010011";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002657600
			aData <= "0011100110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002670100
			aData <= "0011100101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002682600
			aData <= "0011101010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002695100
			aData <= "0011101001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002707600
			aData <= "0011101000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002720100
			aData <= "0011100111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002732600
			aData <= "0011101101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #10002745100
			aData <= "0011101100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #10002757600
			aData <= "0011101011";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #10002770100
			aData <= "0011111001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002782600
			aData <= "0011111000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002795100
			aData <= "0011111101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002807600
			aData <= "0011111100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002820100
			aData <= "0011111011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002832600
			aData <= "0011111010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002845100
			aData <= "0011111111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002857600
			aData <= "0011111110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10002870100
			aData <= "0000000000";      spikeCnt <= "0000001001";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10002995100
			aData <= "0100001110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #10003007600
			aData <= "0100001101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003020100
			aData <= "0100010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003032600
			aData <= "0100010001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003045100
			aData <= "0100010000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003057600
			aData <= "0100001111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003070100
			aData <= "0100010100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003082600
			aData <= "0100010011";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003095100
			aData <= "0100100100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003107600
			aData <= "0100100011";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003120100
			aData <= "0100100111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003132600
			aData <= "0100100110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003145100
			aData <= "0100100101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003157600
			aData <= "0100101001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003170100
			aData <= "0100101000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003182600
			aData <= "0100111010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003195100
			aData <= "0100111001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003207600
			aData <= "0100111110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003220100
			aData <= "0100111101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #10003232600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003245100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003257600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003270100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003282600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003295100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003307600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003320100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003332600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003345100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003357600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003370100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003382600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003395100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003407600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003420100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003432600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003445100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003457600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003470100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003482600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003495100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003507600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003520100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003532600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10003657600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003670100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003682600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003695100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003707600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003720100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003732600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003745100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003757600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003770100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003782600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003795100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003807600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003820100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003832600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003845100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003857600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003870100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003882600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003895100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003907600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003920100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003932600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003945100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003957600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003970100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003982600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10003995100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004007600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004020100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004032600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004045100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004057600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004070100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004082600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004095100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004107600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004120100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004132600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004145100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004157600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004170100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004182600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004195100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10004320100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004332600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004345100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004357600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004370100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004382600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004395100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004407600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004420100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004432600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004445100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004457600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004470100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004482600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004495100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004507600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004520100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004532600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004545100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004557600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004570100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004582600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004595100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004607600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004620100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004632600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004645100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004657600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004670100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004682600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004695100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004707600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004720100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004732600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004745100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004757600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004770100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004782600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004795100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004807600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004820100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004832600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004845100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004857600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10004982600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10004995100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005007600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005020100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005032600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005045100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005057600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005070100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005082600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005095100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005107600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005120100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005132600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005145100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005157600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005170100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005182600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005195100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005207600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005220100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005232600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005245100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005257600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005270100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005282600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005295100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005307600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005320100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005332600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005345100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005357600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005370100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005382600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005395100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005407600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005420100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005432600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005445100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005457600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005470100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005482600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005495100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005507600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005520100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10005645100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005657600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005670100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005682600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005695100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005707600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005720100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005732600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005745100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005757600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005770100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005782600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005795100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005807600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005820100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005832600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005845100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005857600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005870100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005882600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005895100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005907600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005920100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005932600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005945100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005957600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005970100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005982600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10005995100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006007600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006020100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006032600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006045100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006057600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006070100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006082600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006095100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006107600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006120100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006132600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006145100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006157600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006170100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006182600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10006307600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006320100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006332600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006345100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006357600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006370100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006382600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006395100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006407600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006420100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006432600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006445100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006457600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006470100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006482600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006495100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006507600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006520100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006532600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006545100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006557600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006570100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006582600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006595100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006607600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006620100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006632600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006645100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006657600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006670100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006682600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006695100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006707600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006720100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006732600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006745100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006757600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006770100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006782600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006795100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006807600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006820100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006832600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006845100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10006970100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006982600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10006995100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007007600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007020100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007032600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007045100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007057600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007070100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007082600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007095100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007107600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007120100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007132600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007145100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007157600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007170100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007182600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007195100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007207600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007220100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007232600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007245100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007257600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007270100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007282600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007295100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007307600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007320100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007332600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007345100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007357600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007370100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007382600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007395100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007407600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007420100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007432600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007445100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007457600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007470100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007482600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007495100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007507600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10007632600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007645100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007657600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007670100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007682600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007695100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007707600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007720100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007732600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007745100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007757600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007770100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007782600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007795100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007807600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007820100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007832600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007845100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007857600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007870100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007882600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007895100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007907600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007920100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007932600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007945100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007957600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007970100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007982600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10007995100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008007600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008020100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008032600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008045100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008057600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008070100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008082600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008095100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008107600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008120100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008132600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008145100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008157600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008170100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10008295100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008307600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008320100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008332600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008345100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008357600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008370100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008382600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008395100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008407600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008420100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008432600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008445100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008457600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008470100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008482600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008495100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008507600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008520100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008532600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008545100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008557600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008570100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008582600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008595100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008607600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008620100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008632600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008645100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008657600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008670100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008682600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008695100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008707600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008720100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008732600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008745100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008757600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008770100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008782600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008795100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008807600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008820100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008832600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10008957600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008970100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008982600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10008995100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009007600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009020100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009032600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009045100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009057600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009070100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009082600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009095100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009107600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009120100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009132600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009145100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009157600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009170100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009182600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009195100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009207600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009220100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009232600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009245100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009257600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009270100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009282600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009295100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009307600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009320100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009332600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009345100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009357600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009370100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009382600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009395100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009407600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009420100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009432600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009445100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009457600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009470100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009482600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009495100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10009620100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009632600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009645100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009657600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009670100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009682600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009695100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009707600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009720100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009732600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009745100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009757600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009770100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009782600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009795100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009807600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009820100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009832600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009845100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009857600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009870100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009882600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009895100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009907600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009920100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009932600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009945100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009957600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009970100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009982600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10009995100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010007600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010020100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010032600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010045100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010057600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010070100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010082600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010095100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010107600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010120100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010132600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010145100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010157600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10010282600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010295100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010307600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010320100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010332600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010345100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010357600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010370100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010382600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010395100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010407600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010420100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010432600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010445100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010457600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010470100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010482600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010495100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010507600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010520100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010532600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010545100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010557600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010570100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010582600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010595100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010607600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010620100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010632600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010645100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010657600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010670100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010682600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010695100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010707600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010720100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010732600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010745100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010757600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010770100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010782600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010795100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010807600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010820100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10010945100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010957600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010970100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010982600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10010995100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011007600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011020100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011032600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011045100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011057600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011070100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011082600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011095100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011107600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011120100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011132600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011145100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011157600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011170100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011182600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011195100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011207600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011220100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011232600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011245100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011257600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011270100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011282600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011295100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011307600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011320100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011332600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011345100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011357600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011370100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011382600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011395100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011407600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011420100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011432600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011445100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011457600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011470100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011482600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10011607600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011620100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011632600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011645100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011657600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011670100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011682600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011695100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011707600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011720100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011732600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011745100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011757600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011770100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011782600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011795100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011807600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011820100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011832600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011845100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011857600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011870100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011882600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011895100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011907600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011920100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011932600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011945100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011957600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011970100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011982600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10011995100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012007600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012020100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012032600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012045100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012057600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012070100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012082600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012095100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012107600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012120100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012132600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012145100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10012270100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012282600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012295100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012307600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012320100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012332600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012345100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012357600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012370100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012382600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012395100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012407600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012420100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012432600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012445100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012457600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012470100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012482600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012495100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012507600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012520100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012532600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012545100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012557600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012570100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012582600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012595100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012607600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012620100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012632600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012645100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012657600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012670100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012682600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012695100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012707600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012720100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012732600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012745100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012757600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012770100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012782600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012795100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012807600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10012932600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012945100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012957600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012970100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012982600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10012995100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013007600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013020100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013032600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013045100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013057600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013070100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013082600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013095100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013107600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013120100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013132600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013145100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013157600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013170100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013182600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013195100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013207600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013220100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013232600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013245100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013257600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013270100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013282600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013295100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013307600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013320100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013332600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013345100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013357600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013370100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013382600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013395100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013407600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013420100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013432600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013445100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013457600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013470100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10013595100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013607600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013620100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013632600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013645100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013657600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013670100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013682600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013695100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013707600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013720100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013732600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013745100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013757600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013770100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013782600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013795100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013807600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013820100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013832600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013845100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013857600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013870100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013882600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013895100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013907600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013920100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013932600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013945100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013957600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013970100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013982600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10013995100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014007600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014020100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014032600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014045100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014057600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014070100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014082600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014095100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014107600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014120100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014132600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10014257600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014270100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014282600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014295100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014307600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014320100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014332600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014345100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014357600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014370100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014382600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014395100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014407600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014420100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014432600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014445100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014457600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014470100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014482600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014495100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014507600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014520100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014532600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014545100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014557600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014570100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014582600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014595100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014607600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014620100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014632600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014645100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014657600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014670100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014682600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014695100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014707600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014720100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014732600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014745100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014757600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014770100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014782600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014795100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10014920100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014932600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014945100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014957600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014970100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014982600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10014995100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015007600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015020100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015032600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015045100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015057600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015070100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015082600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015095100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015107600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015120100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015132600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015145100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015157600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015170100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015182600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015195100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015207600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015220100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015232600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015245100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015257600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015270100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015282600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015295100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015307600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015320100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015332600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015345100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015357600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015370100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015382600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015395100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015407600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015420100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015432600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015445100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015457600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10015582600
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015595100
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015607600
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015620100
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015632600
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015645100
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015657600
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015670100
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015682600
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015695100
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015707600
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015720100
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015732600
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015745100
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015757600
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015770100
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015782600
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015795100
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015807600
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015820100
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015832600
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015845100
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015857600
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015870100
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015882600
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015895100
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015907600
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015920100
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015932600
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015945100
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015957600
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015970100
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015982600
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10015995100
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016007600
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016020100
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016032600
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016045100
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016057600
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016070100
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016082600
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016095100
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016107600
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016120100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #10016245100
			aData <= "0100001110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016257600
			aData <= "0100001101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016270100
			aData <= "0100010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016282600
			aData <= "0100010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016295100
			aData <= "0100010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016307600
			aData <= "0100001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016320100
			aData <= "0100010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016332600
			aData <= "0100010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016345100
			aData <= "0100100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016357600
			aData <= "0100100011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016370100
			aData <= "0100100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016382600
			aData <= "0100100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016395100
			aData <= "0100100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016407600
			aData <= "0100101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016420100
			aData <= "0100101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016432600
			aData <= "0100111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016445100
			aData <= "0100111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016457600
			aData <= "0100111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016470100
			aData <= "0100111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016482600
			aData <= "0100111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016495100
			aData <= "0100111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016507600
			aData <= "0101010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016520100
			aData <= "0101010000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016532600
			aData <= "0001100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016545100
			aData <= "0011010100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016557600
			aData <= "0011010011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016570100
			aData <= "0011100110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016582600
			aData <= "0011100101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016595100
			aData <= "0011101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016607600
			aData <= "0011101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016620100
			aData <= "0011101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016632600
			aData <= "0011100111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016645100
			aData <= "0011101101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016657600
			aData <= "0011101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016670100
			aData <= "0011101011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016682600
			aData <= "0011111001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016695100
			aData <= "0011111000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016707600
			aData <= "0011111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016720100
			aData <= "0011111100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016732600
			aData <= "0011111011";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016745100
			aData <= "0011111010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016757600
			aData <= "0011111111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016770100
			aData <= "0011111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #10016782600
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 78683 * sys_clk_per; ------------------------------------------------ 
-- #11000320100
			aData <= "0000100010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
			aData <= "0000100010";      spikeCnt <= "0000000000";      wait for 3 * sys_clk_per;
-- #11000370100
			aData <= "0100101010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #11000382600
			aData <= "0101001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #11000395100
			aData <= "0001001111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #11000407600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #11000420100
			aData <= "0010010001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #11000432600
			aData <= "0010101000";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #11000445100
			aData <= "0010111110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000457600
			aData <= "0010111101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000470100
			aData <= "0011010010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000482600
			aData <= "0011100100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000495100
			aData <= "0000000000";      spikeCnt <= "0000000011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11000620100
			aData <= "0000100010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000632600
			aData <= "0100101010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000645100
			aData <= "0101001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #11000657600
			aData <= "0001001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000670100
			aData <= "0101010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000682600
			aData <= "0010010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000695100
			aData <= "0010101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000707600
			aData <= "0010111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000720100
			aData <= "0010111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000732600
			aData <= "0011010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000745100
			aData <= "0011100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000757600
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11000882600
			aData <= "0000100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000895100
			aData <= "0100101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000907600
			aData <= "0101001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000920100
			aData <= "0001001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000932600
			aData <= "0101010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000945100
			aData <= "0010010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000957600
			aData <= "0010101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000970100
			aData <= "0010111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000982600
			aData <= "0010111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11000995100
			aData <= "0011010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11001007600
			aData <= "0011100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11001020100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11001145100
			aData <= "0000100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11001157600
			aData <= "0100101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11001170100
			aData <= "0101001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #11001182600
			aData <= "0001001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001195100
			aData <= "0101010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001207600
			aData <= "0010010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001220100
			aData <= "0010101000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001232600
			aData <= "0010111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001245100
			aData <= "0010111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001257600
			aData <= "0011010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001270100
			aData <= "0011100100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001282600
			aData <= "0000000000";      spikeCnt <= "0000000101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11001407600
			aData <= "0000100010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001420100
			aData <= "0100101010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #11001432600
			aData <= "0101001111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001445100
			aData <= "0001001111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001457600
			aData <= "0101010010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001470100
			aData <= "0010010001";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001482600
			aData <= "0010101000";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001495100
			aData <= "0010111110";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001507600
			aData <= "0010111101";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001520100
			aData <= "0011010010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001532600
			aData <= "0011100100";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001545100
			aData <= "0000000000";      spikeCnt <= "0000000110";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11001670100
			aData <= "0000100010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001682600
			aData <= "0100101010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001695100
			aData <= "0101001111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001707600
			aData <= "0001001111";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001720100
			aData <= "0101010010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001732600
			aData <= "0010010001";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001745100
			aData <= "0010101000";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001757600
			aData <= "0010111110";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001770100
			aData <= "0010111101";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001782600
			aData <= "0011010010";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001795100
			aData <= "0011100100";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #11001807600
			aData <= "0000000000";      spikeCnt <= "0000000110";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11001932600
			aData <= "0000100010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #11001945100
			aData <= "0100101010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #11001957600
			aData <= "0101001111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11001970100
			aData <= "0001001111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11001982600
			aData <= "0101010010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11001995100
			aData <= "0010010001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002007600
			aData <= "0010101000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002020100
			aData <= "0010111110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002032600
			aData <= "0010111101";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002045100
			aData <= "0011010010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002057600
			aData <= "0011100100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002070100
			aData <= "0000000000";      spikeCnt <= "0000001000";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11002195100
			aData <= "0000100010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002207600
			aData <= "0100101010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #11002220100
			aData <= "0101001111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002232600
			aData <= "0001001111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002245100
			aData <= "0101010010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002257600
			aData <= "0010010001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002270100
			aData <= "0010101000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002282600
			aData <= "0010111110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002295100
			aData <= "0010111101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002307600
			aData <= "0011010010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002320100
			aData <= "0011100100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002332600
			aData <= "0000000000";      spikeCnt <= "0000001001";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11002457600
			aData <= "0000100010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002470100
			aData <= "0100101010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #11002482600
			aData <= "0101001111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002495100
			aData <= "0001001111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002507600
			aData <= "0101010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002520100
			aData <= "0010010001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002532600
			aData <= "0010101000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002545100
			aData <= "0010111110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002557600
			aData <= "0010111101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002570100
			aData <= "0011010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002582600
			aData <= "0011100100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002595100
			aData <= "0000000000";      spikeCnt <= "0000001010";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11002720100
			aData <= "0000100010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002732600
			aData <= "0100101010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002745100
			aData <= "0101001111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002757600
			aData <= "0001001111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002770100
			aData <= "0101010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002782600
			aData <= "0010010001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002795100
			aData <= "0010101000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002807600
			aData <= "0010111110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002820100
			aData <= "0010111101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002832600
			aData <= "0011010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002845100
			aData <= "0011100100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002857600
			aData <= "0000000000";      spikeCnt <= "0000001010";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11002982600
			aData <= "0000100010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11002995100
			aData <= "0100101010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #11003007600
			aData <= "0101001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003020100
			aData <= "0001001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003032600
			aData <= "0101010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003045100
			aData <= "0010010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003057600
			aData <= "0010101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003070100
			aData <= "0010111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003082600
			aData <= "0010111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003095100
			aData <= "0011010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003107600
			aData <= "0011100100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003120100
			aData <= "0000000000";      spikeCnt <= "0000001011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11003245100
			aData <= "0000100010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003257600
			aData <= "0100101010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003270100
			aData <= "0101001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003282600
			aData <= "0001001111";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003295100
			aData <= "0101010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003307600
			aData <= "0010010001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003320100
			aData <= "0010101000";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003332600
			aData <= "0010111110";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003345100
			aData <= "0010111101";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003357600
			aData <= "0011010010";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #11003370100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003382600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11003507600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003520100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003532600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003545100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003557600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003570100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003582600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003595100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003607600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003620100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003632600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003645100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11003770100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003782600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003795100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003807600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003820100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003832600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003845100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003857600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003870100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003882600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003895100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11003907600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11004032600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004045100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004057600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004070100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004082600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004095100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004107600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004120100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004132600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004145100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004157600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004170100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11004295100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004307600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004320100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004332600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004345100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004357600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004370100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004382600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004395100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004407600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004420100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004432600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11004557600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004570100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004582600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004595100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004607600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004620100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004632600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004645100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004657600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004670100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004682600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004695100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11004820100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004832600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004845100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004857600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004870100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004882600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004895100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004907600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004920100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004932600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004945100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11004957600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11005082600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005095100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005107600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005120100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005132600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005145100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005157600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005170100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005182600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005195100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005207600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005220100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11005345100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005357600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005370100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005382600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005395100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005407600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005420100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005432600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005445100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005457600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005470100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005482600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11005607600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005620100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005632600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005645100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005657600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005670100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005682600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005695100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005707600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005720100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005732600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005745100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11005870100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005882600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005895100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005907600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005920100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005932600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005945100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005957600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005970100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005982600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11005995100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006007600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11006132600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006145100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006157600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006170100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006182600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006195100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006207600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006220100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006232600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006245100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006257600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006270100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11006395100
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006407600
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006420100
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006432600
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006445100
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006457600
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006470100
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006482600
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006495100
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006507600
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006520100
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006532600
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #11006657600
			aData <= "0000100010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006670100
			aData <= "0100101010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006682600
			aData <= "0101001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006695100
			aData <= "0001001111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006707600
			aData <= "0101010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006720100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006732600
			aData <= "0010101000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006745100
			aData <= "0010111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006757600
			aData <= "0010111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006770100
			aData <= "0011010010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006782600
			aData <= "0011100100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #11006795100
			aData <= "0000000000";      spikeCnt <= "0000001100";      wait for 79484 * sys_clk_per; ------------------------------------------------
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per; ------------------------------------------------ 
-- #12000332600
			--aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per; ------------------------------------------------ 
-- #12000370100
			aData <= "0100000001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #12000382600
			aData <= "0100000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #12000395100
			aData <= "0100000011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #12000407600
			aData <= "0100010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #12000420100
			aData <= "0100111111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #12000432600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per; ----
-- #12000445100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000457600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000470100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000482600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000495100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000507600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000520100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000532600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12000645100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000657600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000670100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000682600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000695100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000707600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000720100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000732600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000745100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000757600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000770100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000782600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000795100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000807600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12000920100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000932600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000945100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000957600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000970100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000982600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12000995100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001007600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001020100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001032600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001045100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001057600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001070100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001082600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12001195100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001207600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001220100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001232600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001245100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001257600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001270100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001282600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001295100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001307600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001320100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001332600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001345100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001357600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12001470100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001482600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001495100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001507600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001520100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001532600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001545100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001557600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001570100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001582600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001595100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001607600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001620100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001632600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12001745100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001757600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001770100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001782600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001795100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001807600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001820100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001832600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001845100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001857600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001870100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001882600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001895100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12001907600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12002020100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002032600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002045100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002057600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002070100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002082600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002095100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002107600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002120100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002132600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002145100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002157600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002170100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002182600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12002295100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002307600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002320100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002332600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002345100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002357600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002370100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002382600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002395100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002407600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002420100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002432600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002445100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002457600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12002570100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002582600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002595100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002607600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002620100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002632600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002645100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002657600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002670100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002682600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002695100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002707600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002720100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002732600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #12002845100
			aData <= "0100000001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002857600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002870100
			aData <= "0100000011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002882600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002895100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002907600
			aData <= "0101010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002920100
			aData <= "0001111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002932600
			aData <= "0001111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002945100
			aData <= "0010010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002957600
			aData <= "0010100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002970100
			aData <= "0011010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002982600
			aData <= "0011101110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12002995100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #12003007600
			aData <= "0100101001";      spikeCnt <= "0000000010";      wait for 5 * sys_clk_per;
			aData <= "0100101001";      spikeCnt <= "0000000011";      wait for 4 * sys_clk_per;
-- #12003120100-------------------------------------------------------------------------------------
			aData <= "0100000001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003132600
			aData <= "0100000000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003145100
			aData <= "0100000011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003157600
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003170100
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003182600
			aData <= "0101010011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003195100
			aData <= "0001111100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003207600
			aData <= "0001111011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003220100
			aData <= "0010010010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003232600
			aData <= "0010100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #12003245100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003257600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003270100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003282600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12003395100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003407600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003420100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003432600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003445100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003457600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003470100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003482600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003495100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003507600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003520100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003532600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003545100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003557600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12003670100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003682600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003695100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003707600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003720100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003732600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003745100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003757600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003770100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003782600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003795100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003807600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003820100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003832600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12003945100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003957600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003970100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003982600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12003995100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004007600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004020100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004032600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004045100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004057600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004070100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004082600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004095100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004107600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12004220100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004232600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004245100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004257600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004270100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004282600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004295100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004307600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004320100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004332600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004345100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004357600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004370100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004382600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12004495100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004507600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004520100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004532600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004545100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004557600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004570100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004582600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004595100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004607600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004620100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004632600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004645100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004657600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12004770100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004782600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004795100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004807600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004820100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004832600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004845100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004857600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004870100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004882600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004895100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004907600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004920100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12004932600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12005045100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005057600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005070100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005082600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005095100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005107600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005120100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005132600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005145100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005157600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005170100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005182600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005195100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005207600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12005320100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005332600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005345100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005357600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005370100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005382600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005395100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005407600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005420100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005432600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005445100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005457600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005470100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005482600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12005595100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005607600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005620100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005632600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005645100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005657600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005670100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005682600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005695100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005707600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005720100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005732600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005745100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005757600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12005870100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005882600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005895100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005907600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005920100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005932600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005945100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005957600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005970100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005982600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12005995100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006007600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006020100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006032600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12006145100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006157600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006170100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006182600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006195100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006207600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006220100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006232600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006245100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006257600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006270100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006282600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006295100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006307600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12006420100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006432600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006445100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006457600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006470100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006482600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006495100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006507600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006520100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006532600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006545100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006557600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006570100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006582600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12006695100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006707600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006720100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006732600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006745100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006757600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006770100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006782600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006795100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006807600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006820100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006832600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006845100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006857600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #12006970100
			aData <= "0100000001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006982600
			aData <= "0100000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12006995100
			aData <= "0100000011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007007600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007020100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007032600
			aData <= "0101010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007045100
			aData <= "0001111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007057600
			aData <= "0001111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007070100
			aData <= "0010010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007082600
			aData <= "0010100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007095100
			aData <= "0011010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007107600
			aData <= "0011101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007120100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #12007132600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 79457 * sys_clk_per;
-- #13000345100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per; ------------------------------------------------ 
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per; ------------------------------------------------ 
-- #13000382600
			aData <= "0100000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000395100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000407600
			aData <= "0011010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000420100
			aData <= "0011100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000432600
			aData <= "0101010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000445100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #13000557600
			aData <= "0100000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000570100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000582600
			aData <= "0011010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000595100
			aData <= "0011100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000607600
			aData <= "0101010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000620100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #13000732600
			aData <= "0100000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000745100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000757600
			aData <= "0011010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000770100
			aData <= "0011100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000782600
			aData <= "0101010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000795100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #13000907600
			aData <= "0100000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000920100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000932600
			aData <= "0011010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000945100
			aData <= "0011100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000957600
			aData <= "0101010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13000970100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #13001082600
			aData <= "0100000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13001095100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13001107600
			aData <= "0011010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #13001120100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;----
-- #13001132600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001145100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13001257600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001270100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001282600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001295100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001307600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001320100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13001432600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001445100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001457600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001470100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001482600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001495100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13001607600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001620100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001632600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001645100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001657600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001670100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13001782600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001795100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001807600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001820100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001832600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001845100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13001957600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001970100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001982600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13001995100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002007600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002020100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13002132600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002145100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002157600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002170100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002182600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002195100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13002307600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002320100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002332600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002345100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002357600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002370100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13002482600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002495100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002507600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002520100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002532600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002545100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13002657600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002670100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002682600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002695100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002707600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002720100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13002832600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002845100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002857600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002870100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002882600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13002895100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003007600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003020100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003032600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003045100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003057600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003070100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003182600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003195100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003207600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003220100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003232600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003245100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003357600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003370100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003382600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003395100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003407600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003420100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003532600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003545100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003557600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003570100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003582600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003595100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003707600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003720100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003732600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003745100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003757600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003770100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13003882600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003895100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003907600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003920100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003932600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13003945100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13004057600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004070100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004082600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004095100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004107600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004120100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13004232600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004245100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004257600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004270100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004282600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004295100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13004407600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004420100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004432600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004445100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004457600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004470100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #13004582600
			aData <= "0100000010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004595100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004607600
			aData <= "0011010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004620100
			aData <= "0011100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004632600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #13004645100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 79657 * sys_clk_per;
-- #14000357600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
			aData <= "0100101001";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #14000395100
			aData <= "0000111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #14000407600
			aData <= "0100000000";      spikeCnt <= "0000000000";      wait for 6 * sys_clk_per;
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 3 * sys_clk_per;
-- #14000520100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14000532600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14000645100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14000657600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14000770100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14000782600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14000895100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14000907600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001020100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001032600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001145100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001157600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001270100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001282600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001395100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001407600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001520100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001532600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001645100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001657600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001770100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001782600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14001895100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14001907600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002020100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002032600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002145100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002157600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002270100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002282600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002395100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002407600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002520100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002532600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002645100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002657600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002770100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002782600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14002895100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14002907600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14003020100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14003032600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14003145100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14003157600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14003270100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14003282600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #14003395100
			aData <= "0000111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #14003407600
			aData <= "0100000000";      spikeCnt <= "0000000001";      wait for 79757 * sys_clk_per;
-- #15000370100
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #15000407600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15000420100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15000532600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15000545100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15000657600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15000670100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15000782600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15000795100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15000907600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15000920100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15001032600
			aData <= "0100000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #15001045100
			aData <= "0011010000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #15001157600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001170100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001282600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001295100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001407600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001420100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001532600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001545100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001657600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001670100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001782600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001795100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15001907600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15001920100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002032600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002045100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002157600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002170100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002282600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002295100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002407600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002420100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002532600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002545100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002657600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002670100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002782600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002795100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15002907600
			aData <= "0100000100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #15002920100
			aData <= "0011010000";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #15003032600
			aData <= "0100000100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #15003045100
			aData <= "0011010000";      spikeCnt <= "0000000010";      wait for 9 * sys_clk_per;
-- #15003157600
			aData <= "0100000100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #15003170100
			aData <= "0011010000";      spikeCnt <= "0000000010";      wait for 9 * sys_clk_per;
-- #15003282600
			aData <= "0100000100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #15003295100
			aData <= "0011010000";      spikeCnt <= "0000000010";      wait for 9 * sys_clk_per;
-- #15003407600
			aData <= "0100000100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #15003420100
			aData <= "0011010000";      spikeCnt <= "0000000010";      wait for 9 * sys_clk_per;
			aData <= "0011010000";      spikeCnt <= "0000000011";      wait for 79748 * sys_clk_per;
-- #16000382600
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
			aData <= "0011001111";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #16000420100
			aData <= "0000111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000432600
			aData <= "0011001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000445100
			aData <= "0011110111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000457600
			aData <= "0100010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000470100
			aData <= "0100111111";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #16000582600
			aData <= "0000111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000595100
			aData <= "0011001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #16000607600
			aData <= "0011110111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000620100
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000632600
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 9 * sys_clk_per;
-- #16000745100
			aData <= "0000111001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000757600
			aData <= "0011001111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000770100
			aData <= "0011110111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000782600
			aData <= "0100010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #16000795100
			aData <= "0100111111";      spikeCnt <= "0000000001";      wait for 6 * sys_clk_per;
			aData <= "0100111111";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #16000882600
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 2 * sys_clk_per;
-- #16000907600
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16000920100
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16000932600
			aData <= "0011110111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16000945100
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16000957600
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #16001070100
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001082600
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001095100
			aData <= "0011110111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001107600
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001120100
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #16001232600
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001245100
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001257600
			aData <= "0011110111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001270100
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001282600
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #16001395100
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001407600
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001420100
			aData <= "0011110111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001432600
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001445100
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #16001557600
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001570100
			aData <= "0011001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001582600
			aData <= "0011110111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001595100
			aData <= "0100010101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001607600
			aData <= "0100111111";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #16001720100
			aData <= "0000111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #16001732600
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001745100
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001757600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001770100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16001882600
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001895100
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001907600
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001920100
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16001932600
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002045100
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002057600
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002070100
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002082600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002095100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002207600
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002220100
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002232600
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002245100
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002257600
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002370100
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002382600
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002395100
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002407600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002420100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002532600
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002545100
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002557600
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002570100
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002582600
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002695100
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002707600
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002720100
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002732600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002745100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16002857600
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002870100
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002882600
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002895100
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16002907600
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 9 * sys_clk_per;
-- #16003020100
			aData <= "0000111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16003032600
			aData <= "0011001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16003045100
			aData <= "0011110111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16003057600
			aData <= "0100010101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #16003070100
			aData <= "0100111111";      spikeCnt <= "0000000100";      wait for 5 * sys_clk_per;
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 4 * sys_clk_per;
-- #16003182600
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003195100
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003207600
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003220100
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003232600
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16003345100
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003357600
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003370100
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003382600
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003395100
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16003507600
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003520100
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003532600
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003545100
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003557600
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16003670100
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003682600
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003695100
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003707600
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003720100
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16003832600
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003845100
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003857600
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003870100
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16003882600
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16003995100
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004007600
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004020100
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004032600
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004045100
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16004157600
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004170100
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004182600
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004195100
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004207600
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 9 * sys_clk_per;
-- #16004320100
			aData <= "0000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004332600
			aData <= "0011001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004345100
			aData <= "0011110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004357600
			aData <= "0100010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #16004370100
			aData <= "0100111111";      spikeCnt <= "0000000101";      wait for 79682 * sys_clk_per;
-- #17000395100
			aData <= "0000100001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
			aData <= "0000100001";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #17000432600
			aData <= "0100001100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000445100
			aData <= "0000100001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000457600
			aData <= "0100100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per; 
-- #17000470100
			aData <= "0001100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000482600
			aData <= "0011010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000495100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000507600
			aData <= "0010101000";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #17000620100
			aData <= "0100001100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #17000632600
			aData <= "0000100001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #17000645100
			aData <= "0100100010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #17000657600
			aData <= "0001100110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #17000670100
			aData <= "0011010110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #17000682600
			aData <= "0010010001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #17000695100
			aData <= "0010101000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000000100";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000000101";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000000110";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000000111";      wait for 2 * sys_clk_per;
-- #17000807600
			aData <= "0100001100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000820100
			aData <= "0000100001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000832600
			aData <= "0100100010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000845100
			aData <= "0001100110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000857600
			aData <= "0011010110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000870100
			aData <= "0010010001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #17000882600
			aData <= "0010101000";      spikeCnt <= "0000001000";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000001001";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000001010";      wait for 3 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000001011";      wait for 2 * sys_clk_per;
-- #17000995100
			aData <= "0100001100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #17001007600
			aData <= "0000100001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #17001020100
			aData <= "0100100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #17001032600
			aData <= "0001100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #17001045100
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #17001057600
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #17001070100
			aData <= "0010101000";      spikeCnt <= "0000001111";      wait for 8 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000010000";      wait for 1 * sys_clk_per;
-- #17001182600
			aData <= "0100001100";      spikeCnt <= "0000010000";      wait for 1 * sys_clk_per;
-- #17001195100
			aData <= "0000100001";      spikeCnt <= "0000010001";      wait for 1 * sys_clk_per;
-- #17001207600
			aData <= "0100100010";      spikeCnt <= "0000010001";      wait for 1 * sys_clk_per;
-- #17001220100
			aData <= "0001100110";      spikeCnt <= "0000010010";      wait for 1 * sys_clk_per;
-- #17001232600
			aData <= "0011010110";      spikeCnt <= "0000010010";      wait for 1 * sys_clk_per;
-- #17001245100
			aData <= "0010010001";      spikeCnt <= "0000010011";      wait for 1 * sys_clk_per;
-- #17001257600
			aData <= "0010101000";      spikeCnt <= "0000010011";      wait for 1 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000010100";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000010101";      wait for 3 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000010110";      wait for 3 * sys_clk_per;
-- #17001370100
			aData <= "0100001100";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001382600
			aData <= "0000100001";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001395100
			aData <= "0100100010";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001407600
			aData <= "0001100110";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001420100
			aData <= "0011010110";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001432600
			aData <= "0010010001";      spikeCnt <= "0000010110";      wait for 1 * sys_clk_per;
-- #17001445100
			aData <= "0010101000";      spikeCnt <= "0000010111";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000011000";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000011001";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000011010";      wait for 3 * sys_clk_per;
-- #17001557600
			aData <= "0100001100";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001570100
			aData <= "0000100001";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001582600
			aData <= "0100100010";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001595100
			aData <= "0001100110";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001607600
			aData <= "0011010110";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001620100
			aData <= "0010010001";      spikeCnt <= "0000011010";      wait for 1 * sys_clk_per;
-- #17001632600
			aData <= "0010101000";      spikeCnt <= "0000011010";      wait for 8 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001745100
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001757600
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001770100
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001782600
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001795100
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001807600
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001820100
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17001932600
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001945100
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001957600
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001970100
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001982600
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17001995100
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002007600
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17002120100
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002132600
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002145100
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002157600
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002170100
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002182600
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002195100
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17002307600
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002320100
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002332600
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002345100
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002357600
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002370100
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002382600
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17002495100
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002507600
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002520100
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002532600
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002545100
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002557600
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002570100
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17002682600
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002695100
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002707600
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002720100
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002732600
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002745100
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002757600
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17002870100
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002882600
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002895100
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002907600
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002920100
			aData <= "0011010110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002932600
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17002945100
			aData <= "0010101000";      spikeCnt <= "0000011011";      wait for 9 * sys_clk_per;
-- #17003057600
			aData <= "0100001100";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17003070100
			aData <= "0000100001";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17003082600
			aData <= "0100100010";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17003095100
			aData <= "0001100110";      spikeCnt <= "0000011011";      wait for 1 * sys_clk_per;
-- #17003107600
			aData <= "0011010110";      spikeCnt <= "0000011100";      wait for 1 * sys_clk_per;
-- #17003120100
			aData <= "0010010001";      spikeCnt <= "0000011100";      wait for 1 * sys_clk_per;
-- #17003132600
			aData <= "0010101000";      spikeCnt <= "0000011101";      wait for 3 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000011110";      wait for 6 * sys_clk_per;
-- #17003245100
			aData <= "0100001100";      spikeCnt <= "0000011110";      wait for 1 * sys_clk_per;
-- #17003257600
			aData <= "0000100001";      spikeCnt <= "0000011110";      wait for 1 * sys_clk_per;
-- #17003270100
			aData <= "0100100010";      spikeCnt <= "0000011110";      wait for 1 * sys_clk_per;
-- #17003282600
			aData <= "0001100110";      spikeCnt <= "0000011110";      wait for 1 * sys_clk_per;
-- #17003295100
			aData <= "0011010110";      spikeCnt <= "0000011111";      wait for 1 * sys_clk_per;
-- #17003307600
			aData <= "0010010001";      spikeCnt <= "0000011111";      wait for 1 * sys_clk_per;
-- #17003320100
			aData <= "0010101000";      spikeCnt <= "0000011111";      wait for 1 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000100000";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000100001";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000100010";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000100011";      wait for 2 * sys_clk_per;
-- #17003432600
			aData <= "0100001100";      spikeCnt <= "0000100100";      wait for 1 * sys_clk_per;
-- #17003445100
			aData <= "0000100001";      spikeCnt <= "0000100100";      wait for 1 * sys_clk_per;
-- #17003457600
			aData <= "0100100010";      spikeCnt <= "0000100101";      wait for 1 * sys_clk_per;
-- #17003470100
			aData <= "0001100110";      spikeCnt <= "0000100101";      wait for 1 * sys_clk_per;
-- #17003482600
			aData <= "0011010110";      spikeCnt <= "0000100110";      wait for 1 * sys_clk_per;
-- #17003495100
			aData <= "0010010001";      spikeCnt <= "0000100110";      wait for 1 * sys_clk_per;
-- #17003507600
			aData <= "0010101000";      spikeCnt <= "0000100111";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000101000";      wait for 3 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000101001";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000101010";      wait for 2 * sys_clk_per;
-- #17003620100
			aData <= "0100001100";      spikeCnt <= "0000101011";      wait for 1 * sys_clk_per;
-- #17003632600
			aData <= "0000100001";      spikeCnt <= "0000101011";      wait for 1 * sys_clk_per;
-- #17003645100
			aData <= "0100100010";      spikeCnt <= "0000101100";      wait for 1 * sys_clk_per;
-- #17003657600
			aData <= "0001100110";      spikeCnt <= "0000101100";      wait for 1 * sys_clk_per;
-- #17003670100
			aData <= "0011010110";      spikeCnt <= "0000101101";      wait for 1 * sys_clk_per;
-- #17003682600
			aData <= "0010010001";      spikeCnt <= "0000101101";      wait for 1 * sys_clk_per;
-- #17003695100
			aData <= "0010101000";      spikeCnt <= "0000101110";      wait for 3 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000101111";      wait for 2 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 4 * sys_clk_per;
-- #17003807600
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003820100
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003832600
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003845100
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003857600
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003870100
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17003882600
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17003995100
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004007600
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004020100
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004032600
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004045100
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004057600
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004070100
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17004182600
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004195100
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004207600
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004220100
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004232600
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004245100
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004257600
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17004370100
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004382600
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004395100
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004407600
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004420100
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004432600
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004445100
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17004557600
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004570100
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004582600
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004595100
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004607600
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004620100
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004632600
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17004745100
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004757600
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004770100
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004782600
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004795100
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004807600
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004820100
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 9 * sys_clk_per;
-- #17004932600
			aData <= "0100001100";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004945100
			aData <= "0000100001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004957600
			aData <= "0100100010";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004970100
			aData <= "0001100110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004982600
			aData <= "0011010110";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17004995100
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
-- #17005007600
			aData <= "0010101000";      spikeCnt <= "0000110000";      wait for 79632 * sys_clk_per;
-- #18000407600
			aData <= "0100010000";      spikeCnt <= "0000110000";      wait for 1 * sys_clk_per;
			aData <= "0100010000";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #18000445100
			aData <= "0100001110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000457600
			aData <= "0100001101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000470100
			aData <= "0100010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000482600
			aData <= "0100010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000495100
			aData <= "0100010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000507600
			aData <= "0100001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000520100
			aData <= "0100010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000532600
			aData <= "0100010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000545100
			aData <= "0100100100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000557600
			aData <= "0100100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000570100
			aData <= "0100100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000582600
			aData <= "0100100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000595100
			aData <= "0100100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000607600
			aData <= "0100101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000620100
			aData <= "0100101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000632600
			aData <= "0100111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000645100
			aData <= "0100111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000657600
			aData <= "0100111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000670100
			aData <= "0100111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000682600
			aData <= "0100111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000695100
			aData <= "0100111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000707600
			aData <= "0100111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000720100
			aData <= "0101001110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000732600
			aData <= "0101010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000745100
			aData <= "0101010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000757600
			aData <= "0101010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000770100
			aData <= "0001100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000782600
			aData <= "0011010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000795100
			aData <= "0011010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000807600
			aData <= "0011010111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000820100
			aData <= "0011100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000832600
			aData <= "0011100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000845100
			aData <= "0011100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000857600
			aData <= "0011101010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000870100
			aData <= "0011101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000882600
			aData <= "0011101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000895100
			aData <= "0011100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000907600
			aData <= "0011101101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000920100
			aData <= "0011101100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000932600
			aData <= "0011101011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000945100
			aData <= "0011111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000957600
			aData <= "0011111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000970100
			aData <= "0011111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000982600
			aData <= "0011111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18000995100
			aData <= "0011111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001007600
			aData <= "0011111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001020100
			aData <= "0011111111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001032600
			aData <= "0011111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001045100
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18001170100
			aData <= "0100001110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001182600
			aData <= "0100001101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001195100
			aData <= "0100010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001207600
			aData <= "0100010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001220100
			aData <= "0100010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001232600
			aData <= "0100001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001245100
			aData <= "0100010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001257600
			aData <= "0100010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001270100
			aData <= "0100100100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #18001282600
			aData <= "0100100011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001295100
			aData <= "0100100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001307600
			aData <= "0100100110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001320100
			aData <= "0100100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001332600
			aData <= "0100101001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001345100
			aData <= "0100101000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001357600
			aData <= "0100111001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001370100
			aData <= "0100111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001382600
			aData <= "0100111101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001395100
			aData <= "0100111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001407600
			aData <= "0100111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001420100
			aData <= "0100111010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001432600
			aData <= "0100111110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001445100
			aData <= "0101001110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001457600
			aData <= "0101010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001470100
			aData <= "0101010000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001482600
			aData <= "0101010100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001495100
			aData <= "0001100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001507600
			aData <= "0011010100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001520100
			aData <= "0011010011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001532600
			aData <= "0011010111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001545100
			aData <= "0011100010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001557600
			aData <= "0011100110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001570100
			aData <= "0011100101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001582600
			aData <= "0011101010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001595100
			aData <= "0011101001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001607600
			aData <= "0011101000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001620100
			aData <= "0011100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001632600
			aData <= "0011101101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001645100
			aData <= "0011101100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001657600
			aData <= "0011101011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001670100
			aData <= "0011111001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001682600
			aData <= "0011111000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001695100
			aData <= "0011111101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001707600
			aData <= "0011111100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001720100
			aData <= "0011111011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001732600
			aData <= "0011111010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001745100
			aData <= "0011111111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #18001757600
			aData <= "0011111110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #18001770100
			aData <= "0000000000";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
			aData <= "0000000000";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per; ------------------------------------------------ 
-- #18001895100
			aData <= "0100001110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001907600
			aData <= "0100001101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001920100
			aData <= "0100010010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001932600
			aData <= "0100010001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001945100
			aData <= "0100010000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001957600
			aData <= "0100001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001970100
			aData <= "0100010100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001982600
			aData <= "0100010011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18001995100
			aData <= "0100100100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002007600
			aData <= "0100100011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002020100
			aData <= "0100100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002032600
			aData <= "0100100110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002045100
			aData <= "0100100101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002057600
			aData <= "0100101001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002070100
			aData <= "0100101000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002082600
			aData <= "0100111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002095100
			aData <= "0100111000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002107600
			aData <= "0100111101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002120100
			aData <= "0100111100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002132600
			aData <= "0100111011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002145100
			aData <= "0100111010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002157600
			aData <= "0100111110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002170100
			aData <= "0101001110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002182600
			aData <= "0101010001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002195100
			aData <= "0101010000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002207600
			aData <= "0101010100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002220100
			aData <= "0001100101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002232600
			aData <= "0011010100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002245100
			aData <= "0011010011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002257600
			aData <= "0011010111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002270100
			aData <= "0011100010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002282600
			aData <= "0011100110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002295100
			aData <= "0011100101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002307600
			aData <= "0011101010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002320100
			aData <= "0011101001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002332600
			aData <= "0011101000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002345100
			aData <= "0011100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002357600
			aData <= "0011101101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002370100
			aData <= "0011101100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002382600
			aData <= "0011101011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002395100
			aData <= "0011111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002407600
			aData <= "0011111000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002420100
			aData <= "0011111101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002432600
			aData <= "0011111100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002445100
			aData <= "0011111011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002457600
			aData <= "0011111010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002470100
			aData <= "0011111111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002482600
			aData <= "0011111110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002495100
			aData <= "0000000000";      spikeCnt <= "0000000011";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18002620100
			aData <= "0100001110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002632600
			aData <= "0100001101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002645100
			aData <= "0100010010";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002657600
			aData <= "0100010001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002670100
			aData <= "0100010000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002682600
			aData <= "0100001111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002695100
			aData <= "0100010100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002707600
			aData <= "0100010011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002720100
			aData <= "0100100100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002732600
			aData <= "0100100011";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002745100
			aData <= "0100100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002757600
			aData <= "0100100110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002770100
			aData <= "0100100101";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002782600
			aData <= "0100101001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002795100
			aData <= "0100101000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002807600
			aData <= "0100111001";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002820100
			aData <= "0100111000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #18002832600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002845100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002857600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002870100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002882600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002895100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002907600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002920100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002932600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002945100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002957600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002970100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002982600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18002995100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003007600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003020100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003032600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003045100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003057600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003070100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003082600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003095100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003107600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003120100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003132600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003145100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003157600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003170100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003182600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003195100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003207600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003220100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18003345100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003357600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003370100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003382600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003395100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003407600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003420100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003432600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003445100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003457600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003470100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003482600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003495100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003507600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003520100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003532600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003545100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003557600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003570100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003582600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003595100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003607600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003620100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003632600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003645100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003657600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003670100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003682600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003695100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003707600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003720100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003732600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003745100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003757600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003770100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003782600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003795100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003807600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003820100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003832600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003845100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003857600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003870100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003882600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003895100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003907600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003920100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003932600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18003945100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18004070100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004082600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004095100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004107600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004120100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004132600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004145100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004157600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004170100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004182600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004195100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004207600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004220100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004232600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004245100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004257600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004270100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004282600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004295100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004307600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004320100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004332600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004345100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004357600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004370100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004382600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004395100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004407600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004420100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004432600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004445100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004457600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004470100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004482600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004495100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004507600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004520100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004532600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004545100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004557600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004570100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004582600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004595100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004607600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004620100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004632600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004645100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004657600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004670100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18004795100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004807600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004820100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004832600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004845100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004857600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004870100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004882600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004895100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004907600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004920100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004932600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004945100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004957600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004970100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004982600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18004995100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005007600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005020100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005032600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005045100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005057600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005070100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005082600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005095100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005107600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005120100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005132600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005145100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005157600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005170100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005182600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005195100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005207600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005220100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005232600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005245100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005257600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005270100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005282600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005295100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005307600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005320100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005332600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005345100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005357600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005370100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005382600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005395100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18005520100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005532600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005545100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005557600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005570100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005582600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005595100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005607600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005620100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005632600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005645100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005657600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005670100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005682600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005695100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005707600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005720100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005732600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005745100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005757600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005770100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005782600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005795100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005807600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005820100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005832600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005845100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005857600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005870100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005882600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005895100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005907600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005920100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005932600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005945100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005957600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005970100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005982600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18005995100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006007600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006020100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006032600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006045100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006057600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006070100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006082600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006095100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006107600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006120100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18006245100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006257600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006270100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006282600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006295100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006307600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006320100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006332600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006345100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006357600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006370100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006382600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006395100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006407600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006420100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006432600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006445100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006457600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006470100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006482600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006495100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006507600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006520100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006532600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006545100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006557600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006570100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006582600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006595100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006607600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006620100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006632600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006645100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006657600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006670100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006682600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006695100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006707600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006720100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006732600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006745100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006757600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006770100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006782600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006795100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006807600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006820100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006832600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006845100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18006970100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006982600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18006995100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007007600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007020100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007032600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007045100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007057600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007070100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007082600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007095100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007107600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007120100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007132600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007145100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007157600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007170100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007182600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007195100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007207600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007220100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007232600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007245100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007257600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007270100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007282600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007295100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007307600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007320100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007332600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007345100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007357600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007370100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007382600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007395100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007407600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007420100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007432600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007445100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007457600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007470100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007482600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007495100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007507600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007520100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007532600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007545100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007557600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007570100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18007695100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007707600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007720100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007732600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007745100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007757600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007770100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007782600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007795100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007807600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007820100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007832600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007845100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007857600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007870100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007882600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007895100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007907600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007920100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007932600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007945100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007957600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007970100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007982600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18007995100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008007600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008020100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008032600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008045100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008057600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008070100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008082600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008095100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008107600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008120100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008132600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008145100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008157600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008170100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008182600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008195100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008207600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008220100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008232600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008245100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008257600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008270100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008282600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008295100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18008420100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008432600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008445100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008457600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008470100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008482600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008495100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008507600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008520100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008532600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008545100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008557600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008570100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008582600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008595100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008607600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008620100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008632600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008645100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008657600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008670100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008682600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008695100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008707600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008720100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008732600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008745100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008757600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008770100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008782600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008795100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008807600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008820100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008832600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008845100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008857600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008870100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008882600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008895100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008907600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008920100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008932600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008945100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008957600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008970100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008982600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18008995100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009007600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009020100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18009145100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009157600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009170100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009182600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009195100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009207600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009220100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009232600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009245100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009257600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009270100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009282600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009295100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009307600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009320100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009332600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009345100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009357600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009370100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009382600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009395100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009407600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009420100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009432600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009445100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009457600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009470100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009482600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009495100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009507600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009520100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009532600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009545100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009557600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009570100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009582600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009595100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009607600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009620100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009632600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009645100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009657600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009670100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009682600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009695100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009707600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009720100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009732600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009745100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18009870100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009882600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009895100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009907600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009920100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009932600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009945100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009957600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009970100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009982600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18009995100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010007600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010020100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010032600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010045100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010057600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010070100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010082600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010095100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010107600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010120100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010132600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010145100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010157600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010170100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010182600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010195100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010207600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010220100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010232600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010245100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010257600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010270100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010282600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010295100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010307600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010320100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010332600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010345100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010357600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010370100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010382600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010395100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010407600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010420100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010432600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010445100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010457600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010470100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18010595100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010607600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010620100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010632600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010645100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010657600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010670100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010682600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010695100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010707600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010720100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010732600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010745100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010757600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010770100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010782600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010795100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010807600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010820100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010832600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010845100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010857600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010870100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010882600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010895100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010907600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010920100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010932600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010945100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010957600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010970100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010982600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18010995100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011007600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011020100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011032600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011045100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011057600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011070100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011082600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011095100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011107600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011120100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011132600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011145100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011157600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011170100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011182600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011195100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18011320100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011332600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011345100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011357600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011370100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011382600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011395100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011407600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011420100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011432600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011445100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011457600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011470100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011482600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011495100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011507600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011520100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011532600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011545100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011557600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011570100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011582600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011595100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011607600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011620100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011632600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011645100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011657600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011670100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011682600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011695100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011707600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011720100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011732600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011745100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011757600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011770100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011782600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011795100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011807600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011820100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011832600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011845100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011857600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011870100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011882600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011895100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011907600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18011920100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18012045100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012057600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012070100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012082600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012095100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012107600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012120100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012132600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012145100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012157600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012170100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012182600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012195100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012207600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012220100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012232600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012245100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012257600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012270100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012282600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012295100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012307600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012320100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012332600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012345100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012357600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012370100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012382600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012395100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012407600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012420100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012432600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012445100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012457600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012470100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012482600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012495100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012507600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012520100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012532600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012545100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012557600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012570100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012582600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012595100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012607600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012620100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012632600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012645100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18012770100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012782600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012795100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012807600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012820100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012832600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012845100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012857600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012870100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012882600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012895100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012907600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012920100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012932600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012945100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012957600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012970100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012982600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18012995100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013007600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013020100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013032600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013045100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013057600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013070100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013082600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013095100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013107600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013120100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013132600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013145100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013157600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013170100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013182600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013195100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013207600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013220100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013232600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013245100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013257600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013270100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013282600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013295100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013307600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013320100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013332600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013345100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013357600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013370100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18013495100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013507600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013520100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013532600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013545100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013557600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013570100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013582600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013595100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013607600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013620100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013632600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013645100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013657600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013670100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013682600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013695100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013707600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013720100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013732600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013745100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013757600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013770100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013782600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013795100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013807600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013820100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013832600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013845100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013857600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013870100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013882600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013895100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013907600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013920100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013932600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013945100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013957600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013970100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013982600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18013995100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014007600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014020100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014032600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014045100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014057600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014070100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014082600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014095100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18014220100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014232600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014245100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014257600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014270100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014282600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014295100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014307600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014320100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014332600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014345100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014357600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014370100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014382600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014395100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014407600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014420100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014432600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014445100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014457600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014470100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014482600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014495100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014507600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014520100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014532600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014545100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014557600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014570100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014582600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014595100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014607600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014620100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014632600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014645100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014657600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014670100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014682600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014695100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014707600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014720100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014732600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014745100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014757600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014770100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014782600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014795100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014807600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014820100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18014945100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014957600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014970100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014982600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18014995100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015007600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015020100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015032600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015045100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015057600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015070100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015082600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015095100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015107600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015120100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015132600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015145100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015157600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015170100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015182600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015195100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015207600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015220100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015232600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015245100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015257600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015270100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015282600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015295100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015307600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015320100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015332600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015345100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015357600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015370100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015382600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015395100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015407600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015420100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015432600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015445100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015457600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015470100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015482600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015495100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015507600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015520100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015532600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015545100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18015670100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015682600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015695100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015707600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015720100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015732600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015745100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015757600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015770100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015782600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015795100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015807600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015820100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015832600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015845100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015857600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015870100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015882600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015895100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015907600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015920100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015932600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015945100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015957600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015970100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015982600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18015995100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016007600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016020100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016032600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016045100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016057600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016070100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016082600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016095100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016107600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016120100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016132600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016145100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016157600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016170100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016182600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016195100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016207600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016220100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016232600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016245100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016257600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016270100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18016395100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016407600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016420100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016432600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016445100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016457600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016470100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016482600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016495100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016507600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016520100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016532600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016545100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016557600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016570100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016582600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016595100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016607600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016620100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016632600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016645100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016657600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016670100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016682600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016695100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016707600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016720100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016732600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016745100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016757600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016770100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016782600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016795100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016807600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016820100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016832600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016845100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016857600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016870100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016882600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016895100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016907600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016920100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016932600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016945100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016957600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016970100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016982600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18016995100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18017120100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017132600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017145100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017157600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017170100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017182600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017195100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017207600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017220100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017232600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017245100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017257600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017270100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017282600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017295100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017307600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017320100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017332600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017345100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017357600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017370100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017382600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017395100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017407600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017420100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017432600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017445100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017457600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017470100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017482600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017495100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017507600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017520100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017532600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017545100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017557600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017570100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017582600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017595100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017607600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017620100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017632600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017645100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017657600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017670100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017682600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017695100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017707600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017720100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #18017845100
			aData <= "0100001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017857600
			aData <= "0100001101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017870100
			aData <= "0100010010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017882600
			aData <= "0100010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017895100
			aData <= "0100010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017907600
			aData <= "0100001111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017920100
			aData <= "0100010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017932600
			aData <= "0100010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017945100
			aData <= "0100100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017957600
			aData <= "0100100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017970100
			aData <= "0100100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017982600
			aData <= "0100100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18017995100
			aData <= "0100100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018007600
			aData <= "0100101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018020100
			aData <= "0100101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018032600
			aData <= "0100111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018045100
			aData <= "0100111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018057600
			aData <= "0100111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018070100
			aData <= "0100111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018082600
			aData <= "0100111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018095100
			aData <= "0100111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018107600
			aData <= "0100111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018120100
			aData <= "0101001110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018132600
			aData <= "0101010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018145100
			aData <= "0101010000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018157600
			aData <= "0101010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018170100
			aData <= "0001100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018182600
			aData <= "0011010100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018195100
			aData <= "0011010011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018207600
			aData <= "0011010111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018220100
			aData <= "0011100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018232600
			aData <= "0011100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018245100
			aData <= "0011100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018257600
			aData <= "0011101010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018270100
			aData <= "0011101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018282600
			aData <= "0011101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018295100
			aData <= "0011100111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018307600
			aData <= "0011101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018320100
			aData <= "0011101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018332600
			aData <= "0011101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018345100
			aData <= "0011111001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018357600
			aData <= "0011111000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018370100
			aData <= "0011111101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018382600
			aData <= "0011111100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018395100
			aData <= "0011111011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018407600
			aData <= "0011111010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018420100
			aData <= "0011111111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018432600
			aData <= "0011111110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #18018445100
			aData <= "0000000000";      spikeCnt <= "0000000100";      wait for 78558 * sys_clk_per; ------------------------------------------------ 
-- #19000420100
			aData <= "0010101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
			aData <= "0010101000";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #19000457600
			aData <= "0101000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000470100
			aData <= "0101100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000482600
			aData <= "0101100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000495100
			aData <= "0010111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000507600
			aData <= "0011010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000520100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #19000632600
			aData <= "0101000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000645100
			aData <= "0101100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000657600
			aData <= "0101100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000670100
			aData <= "0010111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000682600
			aData <= "0011010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000695100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 9 * sys_clk_per;
-- #19000807600
			aData <= "0101000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000820100
			aData <= "0101100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000832600
			aData <= "0101100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000845100
			aData <= "0010111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000857600
			aData <= "0011010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #19000870100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 4 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 5 * sys_clk_per;
-- #19000982600
			aData <= "0101000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #19000995100
			aData <= "0101100111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #19001007600
			aData <= "0101100110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #19001020100
			aData <= "0010111100";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #19001032600
			aData <= "0011010110";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #19001045100
			aData <= "0010010001";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #19001157600
			aData <= "0101000000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001170100
			aData <= "0101100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001182600
			aData <= "0101100110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001195100
			aData <= "0010111100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001207600
			aData <= "0011010110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001220100
			aData <= "0010010001";      spikeCnt <= "0000000011";      wait for 9 * sys_clk_per;
-- #19001332600
			aData <= "0101000000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001345100
			aData <= "0101100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001357600
			aData <= "0101100110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001370100
			aData <= "0010111100";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001382600
			aData <= "0011010110";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #19001395100
			aData <= "0010010001";      spikeCnt <= "0000000011";      wait for 6 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #19001507600
			aData <= "0101000000";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #19001520100
			aData <= "0101100111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001532600
			aData <= "0101100110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001545100
			aData <= "0010111100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001557600
			aData <= "0011010110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001570100
			aData <= "0010010001";      spikeCnt <= "0000000111";      wait for 9 * sys_clk_per;
-- #19001682600
			aData <= "0101000000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001695100
			aData <= "0101100111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001707600
			aData <= "0101100110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001720100
			aData <= "0010111100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001732600
			aData <= "0011010110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001745100
			aData <= "0010010001";      spikeCnt <= "0000000111";      wait for 9 * sys_clk_per;
-- #19001857600
			aData <= "0101000000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001870100
			aData <= "0101100111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001882600
			aData <= "0101100110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001895100
			aData <= "0010111100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001907600
			aData <= "0011010110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #19001920100
			aData <= "0010010001";      spikeCnt <= "0000000111";      wait for 5 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000001000";      wait for 4 * sys_clk_per;
-- #19002032600
			aData <= "0101000000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002045100
			aData <= "0101100111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002057600
			aData <= "0101100110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002070100
			aData <= "0010111100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002082600
			aData <= "0011010110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002095100
			aData <= "0010010001";      spikeCnt <= "0000001000";      wait for 9 * sys_clk_per;
-- #19002207600
			aData <= "0101000000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002220100
			aData <= "0101100111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002232600
			aData <= "0101100110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002245100
			aData <= "0010111100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002257600
			aData <= "0011010110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #19002270100
			aData <= "0010010001";      spikeCnt <= "0000001000";      wait for 3 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000001001";      wait for 6 * sys_clk_per;
-- #19002382600
			aData <= "0101000000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002395100
			aData <= "0101100111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002407600
			aData <= "0101100110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002420100
			aData <= "0010111100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002432600
			aData <= "0011010110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002445100
			aData <= "0010010001";      spikeCnt <= "0000001001";      wait for 9 * sys_clk_per;
-- #19002557600
			aData <= "0101000000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002570100
			aData <= "0101100111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002582600
			aData <= "0101100110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #19002595100
			aData <= "0010111100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002607600
			aData <= "0011010110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002620100
			aData <= "0010010001";      spikeCnt <= "0000001010";      wait for 9 * sys_clk_per;
-- #19002732600
			aData <= "0101000000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002745100
			aData <= "0101100111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002757600
			aData <= "0101100110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002770100
			aData <= "0010111100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002782600
			aData <= "0011010110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #19002795100
			aData <= "0010010001";      spikeCnt <= "0000001010";      wait for 5 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000001011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 2 * sys_clk_per;
-- #19002907600
			aData <= "0101000000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19002920100
			aData <= "0101100111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19002932600
			aData <= "0101100110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19002945100
			aData <= "0010111100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19002957600
			aData <= "0011010110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19002970100
			aData <= "0010010001";      spikeCnt <= "0000001100";      wait for 9 * sys_clk_per;
-- #19003082600
			aData <= "0101000000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19003095100
			aData <= "0101100111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19003107600
			aData <= "0101100110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #19003120100
			aData <= "0010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003132600
			aData <= "0011010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003145100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 9 * sys_clk_per;
-- #19003257600
			aData <= "0101000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003270100
			aData <= "0101100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003282600
			aData <= "0101100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003295100
			aData <= "0010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003307600
			aData <= "0011010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #19003320100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 7 * sys_clk_per;
-- #19003432600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003445100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003457600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003470100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003482600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003495100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19003607600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003620100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003632600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003645100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003657600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003670100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19003782600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003795100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003807600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003820100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003832600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003845100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19003957600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003970100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003982600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19003995100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004007600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004020100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19004132600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004145100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004157600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004170100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004182600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004195100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19004307600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004320100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004332600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004345100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004357600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004370100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19004482600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004495100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004507600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004520100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004532600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004545100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 9 * sys_clk_per;
-- #19004657600
			aData <= "0101000000";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004670100
			aData <= "0101100111";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004682600
			aData <= "0101100110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004695100
			aData <= "0010111100";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004707600
			aData <= "0011010110";      spikeCnt <= "0000001110";      wait for 1 * sys_clk_per;
-- #19004720100
			aData <= "0010010001";      spikeCnt <= "0000001110";      wait for 27 * sys_clk_per;
-- #19012832600
			aData <= "0010010001";      spikeCnt <= "0000001111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010010";      wait for 117 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000010111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011010";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000011111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100010";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000100111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101001";      wait for 111 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101110";      wait for 115 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000101111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110010";      wait for 363 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000110111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111010";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0000111111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000010";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000110";      wait for 117 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001000111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001001";      wait for 119 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001011";      wait for 121 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001001111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010011";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001010111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011011";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001011111";      wait for 363 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100100";      wait for 115 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001100111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101000";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101010";      wait for 113 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001101111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110000";      wait for 113 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001110111";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111000";      wait for 109 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111001";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111010";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111011";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111100";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111101";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111110";      wait for 2 * sys_clk_per;
			aData <= "0010010001";      spikeCnt <= "0001111111";      wait for 76912 * sys_clk_per;
-- #20000432600
			aData <= "1000111001";      spikeCnt <= "0001111111";      wait for 1 * sys_clk_per;
			aData <= "1000111001";      spikeCnt <= "0000000000";      wait for 2 * sys_clk_per;
-- #20000470100
			aData <= "0000100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000482600
			aData <= "0100101011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000495100
			aData <= "0100101010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000507600
			aData <= "0001001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000520100
			aData <= "0101001111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000532600
			aData <= "0001001110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000545100
			aData <= "0101010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000557600
			aData <= "1000000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000570100
			aData <= "0010010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000582600
			aData <= "0010101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000595100
			aData <= "0010111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000607600
			aData <= "0010111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000620100
			aData <= "0011010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000632600
			aData <= "0011100100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000645100
			aData <= "1000010111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000657600
			aData <= "1000010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000670100
			aData <= "1000010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000682600
			aData <= "1000010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000695100
			aData <= "1000011111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000707600
			aData <= "1000011110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000720100
			aData <= "1000011101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000732600
			aData <= "1000011100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000745100
			aData <= "1000011011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000757600
			aData <= "1000011010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000770100
			aData <= "1000011001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000782600
			aData <= "1000011000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000795100
			aData <= "1000100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000807600
			aData <= "1000100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000820100
			aData <= "1000100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000832600
			aData <= "1000100100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000845100
			aData <= "1000100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000857600
			aData <= "1000100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000870100
			aData <= "1000100001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000882600
			aData <= "1000100000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000895100
			aData <= "1000101111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000907600
			aData <= "1000101110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000920100
			aData <= "1000101101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000932600
			aData <= "1000101100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000945100
			aData <= "1000101011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000957600
			aData <= "1000101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000970100
			aData <= "1000101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000982600
			aData <= "1000110110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20000995100
			aData <= "1000110101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001007600
			aData <= "1000110100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001020100
			aData <= "1000110010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001032600
			aData <= "1000110001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001045100
			aData <= "1000111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001057600
			aData <= "1000111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001070100
			aData <= "1000111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001082600
			aData <= "1000111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001095100
			aData <= "1001010111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001107600
			aData <= "1001010110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001120100
			aData <= "1001010101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001132600
			aData <= "1001010100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001145100
			aData <= "1001010011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001157600
			aData <= "1001010010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001170100
			aData <= "1001010001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001182600
			aData <= "1001010000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001195100
			aData <= "1001011111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001207600
			aData <= "1001011110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001220100
			aData <= "1001011101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001232600
			aData <= "1001011100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001245100
			aData <= "1001011011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001257600
			aData <= "1001011010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001270100
			aData <= "1001011001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001282600
			aData <= "1001011000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001295100
			aData <= "1001100011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001307600
			aData <= "1001100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001320100
			aData <= "1001100001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001332600
			aData <= "1001100000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001345100
			aData <= "1001101110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001357600
			aData <= "1001101100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001370100
			aData <= "1001101001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001382600
			aData <= "1001110111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001395100
			aData <= "1001110001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001407600
			aData <= "1001111111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001420100
			aData <= "1001111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001432600
			aData <= "1001111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001445100
			aData <= "1001111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001457600
			aData <= "1001111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001470100
			aData <= "1001111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001482600
			aData <= "1001111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001495100
			aData <= "1001111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001507600
			aData <= "1010000111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001520100
			aData <= "1010000110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001532600
			aData <= "1010000101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001545100
			aData <= "1010000100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001557600
			aData <= "1010000011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001570100
			aData <= "1010000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001582600
			aData <= "1010000001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001595100
			aData <= "1010000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001607600
			aData <= "1010001011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001620100
			aData <= "1010001010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001632600
			aData <= "1010001001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001645100
			aData <= "1010001000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001657600
			aData <= "1010100111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001670100
			aData <= "1010100110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001682600
			aData <= "1010100101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001695100
			aData <= "1010100010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per; 
-- #20001707600
			aData <= "1010100000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001720100
			aData <= "1010101111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001732600
			aData <= "1010101101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001745100
			aData <= "1010101100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001757600
			aData <= "1010101011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001770100
			aData <= "1010101010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001782600
			aData <= "1010101000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001795100
			aData <= "1010110111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001807600
			aData <= "1010110110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001820100
			aData <= "1010110101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001832600
			aData <= "1010110100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001845100
			aData <= "1010110011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001857600
			aData <= "1010110001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001870100
			aData <= "1010111111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001882600
			aData <= "1010111110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001895100
			aData <= "1010111101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001907600
			aData <= "1010111100";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001920100
			aData <= "1010111011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001932600
			aData <= "1010111010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001945100
			aData <= "1010111001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001957600
			aData <= "1010111000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001970100
			aData <= "1011000111";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001982600
			aData <= "1011000110";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20001995100
			aData <= "1011000101";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20002007600
			aData <= "1011000011";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20002020100
			aData <= "1011000010";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20002032600
			aData <= "1011000001";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20002045100
			aData <= "1011000000";      spikeCnt <= "0000000000";      wait for 1 * sys_clk_per;
-- #20002057600
			aData <= "0000000000";      spikeCnt <= "0000000000";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20002182600
			aData <= "0000100010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002195100
			aData <= "0100101011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002207600
			aData <= "0100101010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002220100
			aData <= "0001001111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002232600
			aData <= "0101001111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002245100
			aData <= "0001001110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002257600
			aData <= "0101010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002270100
			aData <= "1000000000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002282600
			aData <= "0010010001";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002295100
			aData <= "0010101000";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002307600
			aData <= "0010111110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002320100
			aData <= "0010111101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002332600
			aData <= "0011010010";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002345100
			aData <= "0011100100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002357600
			aData <= "1000010111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002370100
			aData <= "1000010110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002382600
			aData <= "1000010101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002395100
			aData <= "1000010100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002407600
			aData <= "1000011111";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002420100
			aData <= "1000011110";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002432600
			aData <= "1000011101";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002445100
			aData <= "1000011100";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002457600
			aData <= "1000011011";      spikeCnt <= "0000000001";      wait for 1 * sys_clk_per;
-- #20002470100
			aData <= "1000011010";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #20002482600
			aData <= "1000011001";      spikeCnt <= "0000000010";      wait for 1 * sys_clk_per;
-- #20002495100
			aData <= "1000011000";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #20002507600
			aData <= "1000100111";      spikeCnt <= "0000000011";      wait for 1 * sys_clk_per;
-- #20002520100
			aData <= "1000100110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002532600
			aData <= "1000100101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002545100
			aData <= "1000100100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002557600
			aData <= "1000100011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002570100
			aData <= "1000100010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002582600
			aData <= "1000100001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002595100
			aData <= "1000100000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002607600
			aData <= "1000101111";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002620100
			aData <= "1000101110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002632600
			aData <= "1000101101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002645100
			aData <= "1000101100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002657600
			aData <= "1000101011";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002670100
			aData <= "1000101001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002682600
			aData <= "1000101000";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002695100
			aData <= "1000110110";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002707600
			aData <= "1000110101";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002720100
			aData <= "1000110100";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002732600
			aData <= "1000110010";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002745100
			aData <= "1000110001";      spikeCnt <= "0000000100";      wait for 1 * sys_clk_per;
-- #20002757600
			aData <= "1000111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002770100
			aData <= "1000111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002782600
			aData <= "1000111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002795100
			aData <= "1000111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002807600
			aData <= "1001010111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002820100
			aData <= "1001010110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002832600
			aData <= "1001010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002845100
			aData <= "1001010100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002857600
			aData <= "1001010011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002870100
			aData <= "1001010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002882600
			aData <= "1001010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002895100
			aData <= "1001010000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002907600
			aData <= "1001011111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002920100
			aData <= "1001011110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002932600
			aData <= "1001011101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002945100
			aData <= "1001011100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002957600
			aData <= "1001011011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002970100
			aData <= "1001011010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002982600
			aData <= "1001011001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20002995100
			aData <= "1001011000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003007600
			aData <= "1001100011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003020100
			aData <= "1001100010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003032600
			aData <= "1001100001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003045100
			aData <= "1001100000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003057600
			aData <= "1001101110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003070100
			aData <= "1001101100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003082600
			aData <= "1001101001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003095100
			aData <= "1001110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003107600
			aData <= "1001110001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003120100
			aData <= "1001111111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003132600
			aData <= "1001111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003145100
			aData <= "1001111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003157600
			aData <= "1001111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003170100
			aData <= "1001111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003182600
			aData <= "1001111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003195100
			aData <= "1001111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003207600
			aData <= "1001111000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003220100
			aData <= "1010000111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003232600
			aData <= "1010000110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003245100
			aData <= "1010000101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003257600
			aData <= "1010000100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003270100
			aData <= "1010000011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003282600
			aData <= "1010000010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003295100
			aData <= "1010000001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003307600
			aData <= "1010000000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003320100
			aData <= "1010001011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003332600
			aData <= "1010001010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003345100
			aData <= "1010001001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003357600
			aData <= "1010001000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003370100
			aData <= "1010100111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003382600
			aData <= "1010100110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003395100
			aData <= "1010100101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003407600
			aData <= "1010100010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003420100
			aData <= "1010100000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003432600
			aData <= "1010101111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003445100
			aData <= "1010101101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003457600
			aData <= "1010101100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003470100
			aData <= "1010101011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003482600
			aData <= "1010101010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003495100
			aData <= "1010101000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003507600
			aData <= "1010110111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003520100
			aData <= "1010110110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003532600
			aData <= "1010110101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003545100
			aData <= "1010110100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003557600
			aData <= "1010110011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003570100
			aData <= "1010110001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003582600
			aData <= "1010111111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003595100
			aData <= "1010111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003607600
			aData <= "1010111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003620100
			aData <= "1010111100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003632600
			aData <= "1010111011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003645100
			aData <= "1010111010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003657600
			aData <= "1010111001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003670100
			aData <= "1010111000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003682600
			aData <= "1011000111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003695100
			aData <= "1011000110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003707600
			aData <= "1011000101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003720100
			aData <= "1011000011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003732600
			aData <= "1011000010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003745100
			aData <= "1011000001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003757600
			aData <= "1011000000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003770100
			aData <= "0000000000";      spikeCnt <= "0000000101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20003895100
			aData <= "0000100010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003907600
			aData <= "0100101011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003920100
			aData <= "0100101010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003932600
			aData <= "0001001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003945100
			aData <= "0101001111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003957600
			aData <= "0001001110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003970100
			aData <= "0101010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003982600
			aData <= "1000000000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20003995100
			aData <= "0010010001";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004007600
			aData <= "0010101000";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004020100
			aData <= "0010111110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004032600
			aData <= "0010111101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004045100
			aData <= "0011010010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004057600
			aData <= "0011100100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004070100
			aData <= "1000010111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004082600
			aData <= "1000010110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004095100
			aData <= "1000010101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004107600
			aData <= "1000010100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004120100
			aData <= "1000011111";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004132600
			aData <= "1000011110";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004145100
			aData <= "1000011101";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004157600
			aData <= "1000011100";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004170100
			aData <= "1000011011";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004182600
			aData <= "1000011010";      spikeCnt <= "0000000101";      wait for 1 * sys_clk_per;
-- #20004195100
			aData <= "1000011001";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #20004207600
			aData <= "1000011000";      spikeCnt <= "0000000110";      wait for 1 * sys_clk_per;
-- #20004220100
			aData <= "1000100111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004232600
			aData <= "1000100110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004245100
			aData <= "1000100101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004257600
			aData <= "1000100100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004270100
			aData <= "1000100011";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004282600
			aData <= "1000100010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004295100
			aData <= "1000100001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004307600
			aData <= "1000100000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004320100
			aData <= "1000101111";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004332600
			aData <= "1000101110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004345100
			aData <= "1000101101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004357600
			aData <= "1000101100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004370100
			aData <= "1000101011";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004382600
			aData <= "1000101001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004395100
			aData <= "1000101000";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004407600
			aData <= "1000110110";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004420100
			aData <= "1000110101";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004432600
			aData <= "1000110100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004445100
			aData <= "1000110010";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004457600
			aData <= "1000110001";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004470100
			aData <= "1000111100";      spikeCnt <= "0000000111";      wait for 1 * sys_clk_per;
-- #20004482600
			aData <= "1000111011";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004495100
			aData <= "1000111010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004507600
			aData <= "1000111001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004520100
			aData <= "1001010111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004532600
			aData <= "1001010110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004545100
			aData <= "1001010101";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004557600
			aData <= "1001010100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004570100
			aData <= "1001010011";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004582600
			aData <= "1001010010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004595100
			aData <= "1001010001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004607600
			aData <= "1001010000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004620100
			aData <= "1001011111";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004632600
			aData <= "1001011110";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004645100
			aData <= "1001011101";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004657600
			aData <= "1001011100";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004670100
			aData <= "1001011011";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004682600
			aData <= "1001011010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004695100
			aData <= "1001011001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004707600
			aData <= "1001011000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004720100
			aData <= "1001100011";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004732600
			aData <= "1001100010";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004745100
			aData <= "1001100001";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004757600
			aData <= "1001100000";      spikeCnt <= "0000001000";      wait for 1 * sys_clk_per;
-- #20004770100
			aData <= "1001101110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004782600
			aData <= "1001101100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004795100
			aData <= "1001101001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004807600
			aData <= "1001110111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004820100
			aData <= "1001110001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004832600
			aData <= "1001111111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004845100
			aData <= "1001111110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004857600
			aData <= "1001111101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004870100
			aData <= "1001111100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004882600
			aData <= "1001111011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004895100
			aData <= "1001111010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004907600
			aData <= "1001111001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004920100
			aData <= "1001111000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004932600
			aData <= "1010000111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004945100
			aData <= "1010000110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004957600
			aData <= "1010000101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004970100
			aData <= "1010000100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004982600
			aData <= "1010000011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20004995100
			aData <= "1010000010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005007600
			aData <= "1010000001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005020100
			aData <= "1010000000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005032600
			aData <= "1010001011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005045100
			aData <= "1010001010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005057600
			aData <= "1010001001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005070100
			aData <= "1010001000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005082600
			aData <= "1010100111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005095100
			aData <= "1010100110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005107600
			aData <= "1010100101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005120100
			aData <= "1010100010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005132600
			aData <= "1010100000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005145100
			aData <= "1010101111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005157600
			aData <= "1010101101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005170100
			aData <= "1010101100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005182600
			aData <= "1010101011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005195100
			aData <= "1010101010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005207600
			aData <= "1010101000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005220100
			aData <= "1010110111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005232600
			aData <= "1010110110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005245100
			aData <= "1010110101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005257600
			aData <= "1010110100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005270100
			aData <= "1010110011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005282600
			aData <= "1010110001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005295100
			aData <= "1010111111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005307600
			aData <= "1010111110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005320100
			aData <= "1010111101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005332600
			aData <= "1010111100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005345100
			aData <= "1010111011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005357600
			aData <= "1010111010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005370100
			aData <= "1010111001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005382600
			aData <= "1010111000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005395100
			aData <= "1011000111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005407600
			aData <= "1011000110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005420100
			aData <= "1011000101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005432600
			aData <= "1011000011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005445100
			aData <= "1011000010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005457600
			aData <= "1011000001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005470100
			aData <= "1011000000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005482600
			aData <= "0000000000";      spikeCnt <= "0000001001";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20005607600
			aData <= "0000100010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005620100
			aData <= "0100101011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005632600
			aData <= "0100101010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005645100
			aData <= "0001001111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005657600
			aData <= "0101001111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005670100
			aData <= "0001001110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005682600
			aData <= "0101010010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005695100
			aData <= "1000000000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005707600
			aData <= "0010010001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005720100
			aData <= "0010101000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005732600
			aData <= "0010111110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005745100
			aData <= "0010111101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005757600
			aData <= "0011010010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005770100
			aData <= "0011100100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005782600
			aData <= "1000010111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005795100
			aData <= "1000010110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005807600
			aData <= "1000010101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005820100
			aData <= "1000010100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005832600
			aData <= "1000011111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005845100
			aData <= "1000011110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005857600
			aData <= "1000011101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005870100
			aData <= "1000011100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005882600
			aData <= "1000011011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005895100
			aData <= "1000011010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005907600
			aData <= "1000011001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005920100
			aData <= "1000011000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005932600
			aData <= "1000100111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005945100
			aData <= "1000100110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005957600
			aData <= "1000100101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005970100
			aData <= "1000100100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005982600
			aData <= "1000100011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20005995100
			aData <= "1000100010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006007600
			aData <= "1000100001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006020100
			aData <= "1000100000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006032600
			aData <= "1000101111";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006045100
			aData <= "1000101110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006057600
			aData <= "1000101101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006070100
			aData <= "1000101100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006082600
			aData <= "1000101011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006095100
			aData <= "1000101001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006107600
			aData <= "1000101000";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006120100
			aData <= "1000110110";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006132600
			aData <= "1000110101";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006145100
			aData <= "1000110100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006157600
			aData <= "1000110010";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006170100
			aData <= "1000110001";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006182600
			aData <= "1000111100";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006195100
			aData <= "1000111011";      spikeCnt <= "0000001001";      wait for 1 * sys_clk_per;
-- #20006207600
			aData <= "1000111010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006220100
			aData <= "1000111001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006232600
			aData <= "1001010111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006245100
			aData <= "1001010110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006257600
			aData <= "1001010101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006270100
			aData <= "1001010100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006282600
			aData <= "1001010011";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006295100
			aData <= "1001010010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006307600
			aData <= "1001010001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006320100
			aData <= "1001010000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006332600
			aData <= "1001011111";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006345100
			aData <= "1001011110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006357600
			aData <= "1001011101";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006370100
			aData <= "1001011100";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006382600
			aData <= "1001011011";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006395100
			aData <= "1001011010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006407600
			aData <= "1001011001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006420100
			aData <= "1001011000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006432600
			aData <= "1001100011";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006445100
			aData <= "1001100010";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006457600
			aData <= "1001100001";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006470100
			aData <= "1001100000";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006482600
			aData <= "1001101110";      spikeCnt <= "0000001010";      wait for 1 * sys_clk_per;
-- #20006495100
			aData <= "1001101100";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #20006507600
			aData <= "1001101001";      spikeCnt <= "0000001011";      wait for 1 * sys_clk_per;
-- #20006520100
			aData <= "1001110111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006532600
			aData <= "1001110001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006545100
			aData <= "1001111111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006557600
			aData <= "1001111110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006570100
			aData <= "1001111101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006582600
			aData <= "1001111100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006595100
			aData <= "1001111011";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006607600
			aData <= "1001111010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006620100
			aData <= "1001111001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006632600
			aData <= "1001111000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006645100
			aData <= "1010000111";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006657600
			aData <= "1010000110";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006670100
			aData <= "1010000101";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006682600
			aData <= "1010000100";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006695100
			aData <= "1010000011";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006707600
			aData <= "1010000010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006720100
			aData <= "1010000001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006732600
			aData <= "1010000000";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006745100
			aData <= "1010001011";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006757600
			aData <= "1010001010";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006770100
			aData <= "1010001001";      spikeCnt <= "0000001100";      wait for 1 * sys_clk_per;
-- #20006782600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006795100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006807600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006820100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006832600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006845100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006857600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006870100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006882600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006895100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006907600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006920100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006932600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006945100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006957600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006970100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006982600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20006995100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007007600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007020100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007032600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007045100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007057600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007070100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007082600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007095100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007107600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007120100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007132600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007145100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007157600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007170100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007182600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007195100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20007320100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007332600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007345100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007357600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007370100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007382600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007395100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007407600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007420100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007432600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007445100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007457600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007470100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007482600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007495100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007507600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007520100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007532600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007545100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007557600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007570100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007582600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007595100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007607600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007620100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007632600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007645100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007657600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007670100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007682600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007695100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007707600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007720100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007732600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007745100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007757600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007770100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007782600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007795100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007807600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007820100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007832600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007845100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007857600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007870100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007882600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007895100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007907600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007920100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007932600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007945100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007957600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007970100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007982600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20007995100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008007600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008020100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008032600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008045100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008057600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008070100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008082600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008095100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008107600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008120100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008132600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008145100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008157600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008170100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008182600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008195100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008207600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008220100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008232600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008245100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008257600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008270100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008282600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008295100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008307600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008320100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008332600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008345100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008357600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008370100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008382600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008395100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008407600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008420100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008432600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008445100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008457600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008470100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008482600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008495100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008507600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008520100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008532600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008545100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008557600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008570100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008582600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008595100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008607600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008620100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008632600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008645100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008657600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008670100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008682600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008695100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008707600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008720100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008732600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008745100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008757600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008770100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008782600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008795100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008807600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008820100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008832600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008845100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008857600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008870100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008882600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008895100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20008907600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20009032600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009045100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009057600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009070100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009082600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009095100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009107600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009120100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009132600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009145100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009157600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009170100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009182600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009195100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009207600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009220100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009232600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009245100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009257600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009270100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009282600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009295100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009307600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009320100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009332600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009345100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009357600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009370100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009382600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009395100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009407600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009420100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009432600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009445100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009457600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009470100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009482600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009495100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009507600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009520100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009532600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009545100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009557600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009570100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009582600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009595100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009607600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009620100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009632600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009645100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009657600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009670100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009682600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009695100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009707600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009720100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009732600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009745100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009757600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009770100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009782600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009795100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009807600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009820100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009832600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009845100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009857600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009870100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009882600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009895100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009907600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009920100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009932600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009945100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009957600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009970100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009982600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20009995100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010007600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010020100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010032600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010045100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010057600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010070100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010082600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010095100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010107600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010120100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010132600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010145100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010157600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010170100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010182600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010195100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010207600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010220100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010232600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010245100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010257600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010270100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010282600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010295100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010307600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010320100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010332600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010345100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010357600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010370100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010382600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010395100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010407600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010420100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010432600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010445100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010457600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010470100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010482600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010495100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010507600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010520100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010532600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010545100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010557600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010570100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010582600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010595100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010607600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010620100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20010745100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010757600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010770100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010782600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010795100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010807600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010820100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010832600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010845100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010857600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010870100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010882600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010895100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010907600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010920100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010932600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010945100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010957600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010970100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010982600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20010995100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011007600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011020100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011032600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011045100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011057600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011070100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011082600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011095100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011107600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011120100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011132600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011145100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011157600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011170100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011182600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011195100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011207600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011220100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011232600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011245100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011257600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011270100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011282600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011295100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011307600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011320100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011332600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011345100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011357600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011370100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011382600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011395100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011407600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011420100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011432600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011445100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011457600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011470100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011482600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011495100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011507600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011520100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011532600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011545100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011557600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011570100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011582600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011595100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011607600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011620100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011632600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011645100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011657600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011670100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011682600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011695100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011707600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011720100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011732600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011745100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011757600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011770100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011782600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011795100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011807600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011820100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011832600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011845100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011857600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011870100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011882600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011895100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011907600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011920100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011932600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011945100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011957600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011970100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011982600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20011995100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012007600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012020100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012032600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012045100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012057600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012070100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012082600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012095100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012107600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012120100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012132600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012145100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012157600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012170100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012182600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012195100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012207600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012220100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012232600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012245100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012257600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012270100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012282600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012295100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012307600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012320100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012332600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20012457600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012470100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012482600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012495100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012507600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012520100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012532600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012545100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012557600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012570100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012582600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012595100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012607600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012620100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012632600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012645100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012657600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012670100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012682600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012695100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012707600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012720100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012732600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012745100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012757600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012770100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012782600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012795100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012807600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012820100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012832600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012845100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012857600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012870100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012882600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012895100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012907600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012920100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012932600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012945100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012957600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012970100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012982600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20012995100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013007600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013020100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013032600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013045100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013057600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013070100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013082600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013095100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013107600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013120100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013132600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013145100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013157600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013170100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013182600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013195100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013207600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013220100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013232600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013245100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013257600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013270100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013282600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013295100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013307600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013320100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013332600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013345100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013357600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013370100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013382600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013395100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013407600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013420100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013432600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013445100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013457600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013470100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013482600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013495100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013507600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013520100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013532600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013545100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013557600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013570100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013582600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013595100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013607600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013620100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013632600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013645100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013657600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013670100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013682600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013695100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013707600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013720100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013732600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013745100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013757600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013770100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013782600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013795100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013807600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013820100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013832600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013845100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013857600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013870100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013882600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013895100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013907600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013920100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013932600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013945100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013957600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013970100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013982600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20013995100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014007600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014020100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014032600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014045100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20014170100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014182600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014195100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014207600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014220100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014232600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014245100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014257600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014270100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014282600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014295100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014307600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014320100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014332600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014345100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014357600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014370100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014382600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014395100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014407600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014420100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014432600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014445100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014457600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014470100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014482600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014495100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014507600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014520100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014532600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014545100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014557600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014570100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014582600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014595100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014607600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014620100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014632600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014645100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014657600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014670100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014682600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014695100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014707600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014720100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014732600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014745100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014757600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014770100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014782600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014795100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014807600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014820100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014832600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014845100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014857600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014870100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014882600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014895100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014907600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014920100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014932600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014945100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014957600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014970100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014982600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20014995100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015007600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015020100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015032600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015045100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015057600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015070100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015082600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015095100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015107600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015120100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015132600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015145100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015157600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015170100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015182600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015195100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015207600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015220100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015232600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015245100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015257600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015270100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015282600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015295100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015307600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015320100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015332600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015345100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015357600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015370100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015382600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015395100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015407600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015420100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015432600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015445100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015457600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015470100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015482600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015495100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015507600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015520100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015532600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015545100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015557600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015570100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015582600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015595100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015607600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015620100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015632600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015645100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015657600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015670100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015682600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015695100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015707600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015720100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015732600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015745100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015757600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20015882600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015895100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015907600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015920100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015932600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015945100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015957600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015970100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015982600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20015995100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016007600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016020100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016032600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016045100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016057600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016070100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016082600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016095100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016107600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016120100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016132600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016145100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016157600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016170100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016182600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016195100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016207600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016220100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016232600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016245100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016257600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016270100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016282600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016295100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016307600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016320100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016332600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016345100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016357600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016370100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016382600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016395100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016407600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016420100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016432600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016445100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016457600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016470100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016482600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016495100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016507600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016520100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016532600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016545100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016557600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016570100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016582600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016595100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016607600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016620100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016632600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016645100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016657600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016670100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016682600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016695100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016707600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016720100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016732600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016745100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016757600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016770100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016782600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016795100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016807600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016820100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016832600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016845100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016857600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016870100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016882600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016895100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016907600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016920100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016932600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016945100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016957600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016970100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016982600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20016995100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017007600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017020100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017032600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017045100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017057600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017070100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017082600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017095100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017107600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017120100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017132600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017145100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017157600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017170100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017182600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017195100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017207600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017220100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017232600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017245100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017257600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017270100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017282600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017295100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017307600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017320100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017332600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017345100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017357600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017370100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017382600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017395100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017407600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017420100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017432600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017445100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017457600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017470100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20017595100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017607600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017620100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017632600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017645100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017657600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017670100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017682600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017695100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017707600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017720100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017732600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017745100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017757600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017770100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017782600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017795100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017807600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017820100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017832600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017845100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017857600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017870100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017882600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017895100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017907600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017920100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017932600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017945100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017957600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017970100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017982600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20017995100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018007600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018020100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018032600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018045100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018057600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018070100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018082600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018095100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018107600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018120100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018132600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018145100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018157600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018170100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018182600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018195100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018207600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018220100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018232600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018245100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018257600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018270100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018282600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018295100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018307600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018320100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018332600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018345100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018357600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018370100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018382600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018395100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018407600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018420100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018432600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018445100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018457600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018470100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018482600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018495100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018507600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018520100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018532600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018545100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018557600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018570100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018582600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018595100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018607600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018620100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018632600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018645100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018657600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018670100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018682600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018695100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018707600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018720100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018732600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018745100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018757600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018770100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018782600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018795100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018807600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018820100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018832600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018845100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018857600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018870100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018882600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018895100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018907600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018920100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018932600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018945100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018957600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018970100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018982600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20018995100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019007600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019020100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019032600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019045100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019057600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019070100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019082600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019095100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019107600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019120100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019132600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019145100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019157600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019170100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019182600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20019307600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019320100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019332600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019345100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019357600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019370100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019382600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019395100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019407600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019420100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019432600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019445100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019457600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019470100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019482600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019495100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019507600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019520100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019532600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019545100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019557600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019570100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019582600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019595100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019607600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019620100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019632600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019645100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019657600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019670100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019682600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019695100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019707600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019720100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019732600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019745100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019757600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019770100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019782600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019795100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019807600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019820100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019832600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019845100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019857600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019870100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019882600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019895100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019907600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019920100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019932600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019945100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019957600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019970100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019982600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20019995100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020007600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020020100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020032600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020045100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020057600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020070100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020082600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020095100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020107600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020120100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020132600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020145100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020157600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020170100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020182600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020195100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020207600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020220100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020232600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020245100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020257600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020270100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020282600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020295100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020307600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020320100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020332600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020345100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020357600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020370100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020382600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020395100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020407600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020420100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020432600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020445100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020457600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020470100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020482600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020495100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020507600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020520100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020532600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020545100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020557600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020570100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020582600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020595100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020607600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020620100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020632600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020645100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020657600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020670100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020682600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020695100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020707600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020720100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020732600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020745100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020757600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020770100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020782600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020795100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020807600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020820100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020832600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020845100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020857600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020870100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020882600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20020895100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20021020100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021032600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021045100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021057600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021070100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021082600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021095100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021107600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021120100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021132600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021145100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021157600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021170100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021182600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021195100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021207600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021220100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021232600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021245100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021257600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021270100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021282600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021295100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021307600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021320100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021332600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021345100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021357600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021370100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021382600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021395100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021407600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021420100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021432600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021445100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021457600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021470100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021482600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021495100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021507600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021520100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021532600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021545100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021557600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021570100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021582600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021595100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021607600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021620100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021632600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021645100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021657600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021670100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021682600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021695100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021707600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021720100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021732600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021745100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021757600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021770100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021782600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021795100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021807600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021820100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021832600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021845100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021857600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021870100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021882600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021895100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021907600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021920100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021932600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021945100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021957600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021970100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021982600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20021995100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022007600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022020100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022032600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022045100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022057600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022070100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022082600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022095100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022107600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022120100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022132600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022145100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022157600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022170100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022182600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022195100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022207600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022220100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022232600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022245100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022257600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022270100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022282600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022295100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022307600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022320100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022332600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022345100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022357600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022370100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022382600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022395100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022407600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022420100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022432600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022445100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022457600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022470100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022482600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022495100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022507600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022520100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022532600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022545100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022557600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022570100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022582600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022595100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022607600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20022732600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022745100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022757600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022770100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022782600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022795100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022807600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022820100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022832600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022845100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022857600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022870100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022882600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022895100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022907600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022920100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022932600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022945100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022957600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022970100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022982600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20022995100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023007600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023020100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023032600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023045100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023057600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023070100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023082600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023095100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023107600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023120100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023132600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023145100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023157600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023170100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023182600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023195100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023207600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023220100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023232600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023245100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023257600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023270100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023282600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023295100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023307600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023320100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023332600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023345100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023357600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023370100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023382600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023395100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023407600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023420100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023432600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023445100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023457600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023470100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023482600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023495100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023507600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023520100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023532600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023545100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023557600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023570100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023582600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023595100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023607600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023620100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023632600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023645100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023657600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023670100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023682600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023695100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023707600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023720100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023732600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023745100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023757600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023770100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023782600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023795100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023807600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023820100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023832600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023845100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023857600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023870100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023882600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023895100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023907600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023920100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023932600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023945100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023957600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023970100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023982600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20023995100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024007600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024020100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024032600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024045100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024057600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024070100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024082600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024095100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024107600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024120100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024132600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024145100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024157600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024170100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024182600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024195100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024207600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024220100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024232600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024245100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024257600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024270100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024282600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024295100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024307600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024320100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20024445100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024457600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024470100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024482600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024495100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024507600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024520100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024532600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024545100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024557600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024570100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024582600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024595100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024607600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024620100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024632600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024645100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024657600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024670100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024682600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024695100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024707600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024720100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024732600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024745100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024757600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024770100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024782600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024795100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024807600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024820100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024832600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024845100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024857600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024870100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024882600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024895100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024907600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024920100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024932600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024945100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024957600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024970100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024982600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20024995100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025007600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025020100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025032600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025045100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025057600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025070100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025082600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025095100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025107600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025120100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025132600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025145100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025157600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025170100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025182600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025195100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025207600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025220100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025232600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025245100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025257600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025270100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025282600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025295100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025307600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025320100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025332600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025345100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025357600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025370100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025382600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025395100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025407600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025420100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025432600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025445100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025457600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025470100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025482600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025495100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025507600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025520100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025532600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025545100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025557600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025570100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025582600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025595100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025607600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025620100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025632600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025645100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025657600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025670100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025682600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025695100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025707600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025720100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025732600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025745100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025757600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025770100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025782600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025795100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025807600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025820100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025832600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025845100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025857600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025870100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025882600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025895100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025907600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025920100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025932600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025945100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025957600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025970100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025982600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20025995100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026007600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026020100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026032600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20026157600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026170100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026182600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026195100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026207600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026220100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026232600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026245100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026257600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026270100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026282600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026295100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026307600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026320100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026332600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026345100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026357600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026370100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026382600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026395100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026407600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026420100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026432600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026445100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026457600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026470100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026482600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026495100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026507600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026520100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026532600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026545100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026557600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026570100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026582600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026595100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026607600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026620100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026632600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026645100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026657600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026670100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026682600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026695100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026707600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026720100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026732600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026745100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026757600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026770100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026782600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026795100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026807600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026820100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026832600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026845100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026857600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026870100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026882600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026895100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026907600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026920100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026932600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026945100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026957600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026970100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026982600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20026995100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027007600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027020100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027032600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027045100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027057600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027070100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027082600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027095100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027107600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027120100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027132600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027145100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027157600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027170100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027182600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027195100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027207600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027220100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027232600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027245100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027257600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027270100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027282600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027295100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027307600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027320100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027332600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027345100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027357600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027370100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027382600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027395100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027407600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027420100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027432600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027445100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027457600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027470100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027482600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027495100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027507600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027520100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027532600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027545100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027557600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027570100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027582600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027595100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027607600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027620100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027632600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027645100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027657600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027670100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027682600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027695100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027707600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027720100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027732600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027745100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20027870100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027882600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027895100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027907600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027920100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027932600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027945100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027957600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027970100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027982600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20027995100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028007600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028020100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028032600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028045100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028057600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028070100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028082600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028095100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028107600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028120100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028132600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028145100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028157600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028170100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028182600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028195100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028207600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028220100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028232600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028245100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028257600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028270100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028282600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028295100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028307600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028320100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028332600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028345100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028357600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028370100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028382600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028395100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028407600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028420100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028432600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028445100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028457600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028470100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028482600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028495100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028507600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028520100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028532600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028545100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028557600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028570100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028582600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028595100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028607600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028620100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028632600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028645100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028657600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028670100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028682600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028695100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028707600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028720100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028732600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028745100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028757600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028770100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028782600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028795100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028807600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028820100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028832600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028845100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028857600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028870100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028882600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028895100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028907600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028920100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028932600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028945100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028957600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028970100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028982600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20028995100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029007600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029020100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029032600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029045100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029057600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029070100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029082600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029095100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029107600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029120100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029132600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029145100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029157600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029170100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029182600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029195100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029207600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029220100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029232600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029245100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029257600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029270100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029282600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029295100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029307600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029320100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029332600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029345100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029357600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029370100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029382600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029395100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029407600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029420100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029432600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029445100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029457600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20029582600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029595100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029607600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029620100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029632600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029645100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029657600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029670100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029682600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029695100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029707600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029720100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029732600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029745100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029757600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029770100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029782600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029795100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029807600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029820100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029832600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029845100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029857600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029870100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029882600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029895100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029907600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029920100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029932600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029945100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029957600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029970100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029982600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20029995100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030007600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030020100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030032600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030045100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030057600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030070100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030082600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030095100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030107600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030120100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030132600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030145100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030157600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030170100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030182600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030195100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030207600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030220100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030232600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030245100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030257600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030270100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030282600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030295100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030307600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030320100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030332600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030345100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030357600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030370100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030382600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030395100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030407600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030420100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030432600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030445100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030457600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030470100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030482600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030495100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030507600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030520100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030532600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030545100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030557600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030570100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030582600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030595100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030607600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030620100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030632600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030645100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030657600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030670100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030682600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030695100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030707600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030720100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030732600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030745100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030757600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030770100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030782600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030795100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030807600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030820100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030832600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030845100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030857600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030870100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030882600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030895100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030907600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030920100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030932600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030945100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030957600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030970100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030982600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20030995100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031007600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031020100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031032600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031045100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031057600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031070100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031082600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031095100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031107600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031120100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031132600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031145100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031157600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031170100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20031295100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031307600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031320100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031332600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031345100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031357600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031370100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031382600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031395100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031407600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031420100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031432600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031445100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031457600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031470100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031482600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031495100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031507600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031520100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031532600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031545100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031557600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031570100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031582600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031595100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031607600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031620100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031632600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031645100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031657600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031670100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031682600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031695100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031707600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031720100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031732600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031745100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031757600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031770100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031782600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031795100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031807600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031820100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031832600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031845100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031857600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031870100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031882600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031895100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031907600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031920100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031932600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031945100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031957600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031970100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031982600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20031995100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032007600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032020100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032032600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032045100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032057600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032070100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032082600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032095100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032107600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032120100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032132600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032145100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032157600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032170100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032182600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032195100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032207600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032220100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032232600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032245100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032257600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032270100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032282600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032295100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032307600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032320100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032332600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032345100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032357600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032370100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032382600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032395100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032407600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032420100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032432600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032445100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032457600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032470100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032482600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032495100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032507600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032520100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032532600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032545100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032557600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032570100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032582600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032595100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032607600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032620100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032632600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032645100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032657600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032670100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032682600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032695100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032707600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032720100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032732600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032745100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032757600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032770100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032782600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032795100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032807600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032820100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032832600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032845100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032857600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032870100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20032882600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20033007600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033020100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033032600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033045100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033057600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033070100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033082600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033095100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033107600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033120100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033132600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033145100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033157600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033170100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033182600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033195100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033207600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033220100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033232600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033245100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033257600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033270100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033282600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033295100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033307600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033320100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033332600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033345100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033357600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033370100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033382600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033395100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033407600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033420100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033432600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033445100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033457600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033470100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033482600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033495100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033507600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033520100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033532600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033545100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033557600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033570100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033582600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033595100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033607600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033620100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033632600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033645100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033657600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033670100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033682600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033695100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033707600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033720100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033732600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033745100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033757600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033770100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033782600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033795100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033807600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033820100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033832600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033845100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033857600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033870100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033882600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033895100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033907600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033920100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033932600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033945100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033957600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033970100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033982600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20033995100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034007600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034020100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034032600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034045100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034057600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034070100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034082600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034095100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034107600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034120100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034132600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034145100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034157600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034170100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034182600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034195100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034207600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034220100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034232600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034245100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034257600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034270100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034282600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034295100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034307600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034320100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034332600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034345100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034357600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034370100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034382600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034395100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034407600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034420100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034432600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034445100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034457600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034470100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034482600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034495100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034507600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034520100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034532600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034545100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034557600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034570100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034582600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034595100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20034720100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034732600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034745100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034757600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034770100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034782600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034795100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034807600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034820100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034832600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034845100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034857600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034870100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034882600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034895100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034907600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034920100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034932600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034945100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034957600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034970100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034982600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20034995100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035007600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035020100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035032600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035045100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035057600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035070100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035082600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035095100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035107600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035120100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035132600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035145100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035157600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035170100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035182600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035195100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035207600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035220100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035232600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035245100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035257600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035270100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035282600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035295100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035307600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035320100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035332600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035345100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035357600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035370100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035382600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035395100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035407600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035420100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035432600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035445100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035457600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035470100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035482600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035495100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035507600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035520100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035532600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035545100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035557600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035570100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035582600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035595100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035607600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035620100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035632600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035645100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035657600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035670100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035682600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035695100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035707600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035720100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035732600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035745100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035757600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035770100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035782600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035795100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035807600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035820100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035832600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035845100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035857600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035870100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035882600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035895100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035907600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035920100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035932600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035945100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035957600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035970100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035982600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20035995100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036007600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036020100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036032600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036045100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036057600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036070100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036082600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036095100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036107600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036120100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036132600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036145100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036157600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036170100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036182600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036195100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036207600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036220100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036232600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036245100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036257600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036270100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036282600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036295100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036307600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20036432600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036445100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036457600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036470100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036482600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036495100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036507600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036520100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036532600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036545100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036557600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036570100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036582600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036595100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036607600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036620100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036632600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036645100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036657600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036670100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036682600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036695100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036707600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036720100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036732600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036745100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036757600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036770100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036782600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036795100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036807600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036820100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036832600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036845100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036857600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036870100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036882600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036895100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036907600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036920100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036932600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036945100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036957600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036970100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036982600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20036995100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037007600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037020100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037032600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037045100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037057600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037070100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037082600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037095100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037107600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037120100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037132600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037145100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037157600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037170100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037182600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037195100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037207600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037220100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037232600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037245100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037257600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037270100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037282600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037295100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037307600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037320100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037332600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037345100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037357600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037370100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037382600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037395100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037407600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037420100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037432600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037445100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037457600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037470100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037482600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037495100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037507600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037520100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037532600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037545100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037557600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037570100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037582600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037595100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037607600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037620100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037632600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037645100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037657600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037670100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037682600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037695100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037707600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037720100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037732600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037745100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037757600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037770100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037782600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037795100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037807600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037820100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037832600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037845100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037857600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037870100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037882600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037895100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037907600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037920100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037932600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037945100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037957600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037970100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037982600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20037995100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038007600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038020100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20038145100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038157600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038170100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038182600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038195100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038207600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038220100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038232600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038245100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038257600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038270100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038282600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038295100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038307600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038320100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038332600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038345100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038357600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038370100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038382600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038395100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038407600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038420100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038432600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038445100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038457600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038470100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038482600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038495100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038507600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038520100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038532600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038545100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038557600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038570100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038582600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038595100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038607600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038620100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038632600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038645100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038657600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038670100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038682600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038695100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038707600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038720100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038732600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038745100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038757600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038770100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038782600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038795100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038807600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038820100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038832600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038845100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038857600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038870100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038882600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038895100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038907600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038920100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038932600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038945100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038957600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038970100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038982600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20038995100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039007600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039020100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039032600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039045100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039057600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039070100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039082600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039095100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039107600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039120100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039132600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039145100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039157600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039170100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039182600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039195100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039207600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039220100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039232600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039245100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039257600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039270100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039282600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039295100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039307600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039320100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039332600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039345100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039357600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039370100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039382600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039395100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039407600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039420100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039432600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039445100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039457600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039470100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039482600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039495100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039507600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039520100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039532600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039545100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039557600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039570100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039582600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039595100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039607600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039620100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039632600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039645100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039657600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039670100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039682600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039695100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039707600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039720100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039732600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20039857600
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039870100
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039882600
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039895100
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039907600
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039920100
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039932600
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039945100
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039957600
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039970100
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039982600
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20039995100
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040007600
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040020100
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040032600
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040045100
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040057600
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040070100
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040082600
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040095100
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040107600
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040120100
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040132600
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040145100
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040157600
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040170100
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040182600
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040195100
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040207600
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040220100
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040232600
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040245100
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040257600
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040270100
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040282600
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040295100
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040307600
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040320100
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040332600
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040345100
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040357600
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040370100
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040382600
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040395100
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040407600
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040420100
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040432600
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040445100
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040457600
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040470100
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040482600
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040495100
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040507600
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040520100
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040532600
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040545100
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040557600
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040570100
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040582600
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040595100
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040607600
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040620100
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040632600
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040645100
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040657600
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040670100
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040682600
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040695100
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040707600
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040720100
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040732600
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040745100
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040757600
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040770100
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040782600
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040795100
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040807600
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040820100
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040832600
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040845100
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040857600
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040870100
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040882600
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040895100
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040907600
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040920100
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040932600
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040945100
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040957600
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040970100
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040982600
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20040995100
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041007600
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041020100
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041032600
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041045100
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041057600
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041070100
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041082600
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041095100
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041107600
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041120100
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041132600
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041145100
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041157600
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041170100
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041182600
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041195100
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041207600
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041220100
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041232600
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041245100
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041257600
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041270100
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041282600
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041295100
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041307600
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041320100
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041332600
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041345100
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041357600
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041370100
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041382600
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041395100
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041407600
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041420100
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041432600
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041445100
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 10 * sys_clk_per; ------------------------------------------------ 
-- #20041570100
			aData <= "0000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041582600
			aData <= "0100101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041595100
			aData <= "0100101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041607600
			aData <= "0001001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041620100
			aData <= "0101001111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041632600
			aData <= "0001001110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041645100
			aData <= "0101010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041657600
			aData <= "1000000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041670100
			aData <= "0010010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041682600
			aData <= "0010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041695100
			aData <= "0010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041707600
			aData <= "0010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041720100
			aData <= "0011010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041732600
			aData <= "0011100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041745100
			aData <= "1000010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041757600
			aData <= "1000010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041770100
			aData <= "1000010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041782600
			aData <= "1000010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041795100
			aData <= "1000011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041807600
			aData <= "1000011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041820100
			aData <= "1000011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041832600
			aData <= "1000011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041845100
			aData <= "1000011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041857600
			aData <= "1000011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041870100
			aData <= "1000011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041882600
			aData <= "1000011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041895100
			aData <= "1000100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041907600
			aData <= "1000100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041920100
			aData <= "1000100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041932600
			aData <= "1000100100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041945100
			aData <= "1000100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041957600
			aData <= "1000100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041970100
			aData <= "1000100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041982600
			aData <= "1000100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20041995100
			aData <= "1000101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042007600
			aData <= "1000101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042020100
			aData <= "1000101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042032600
			aData <= "1000101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042045100
			aData <= "1000101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042057600
			aData <= "1000101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042070100
			aData <= "1000101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042082600
			aData <= "1000110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042095100
			aData <= "1000110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042107600
			aData <= "1000110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042120100
			aData <= "1000110010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042132600
			aData <= "1000110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042145100
			aData <= "1000111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042157600
			aData <= "1000111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042170100
			aData <= "1000111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042182600
			aData <= "1000111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042195100
			aData <= "1001010111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042207600
			aData <= "1001010110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042220100
			aData <= "1001010101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042232600
			aData <= "1001010100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042245100
			aData <= "1001010011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042257600
			aData <= "1001010010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042270100
			aData <= "1001010001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042282600
			aData <= "1001010000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042295100
			aData <= "1001011111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042307600
			aData <= "1001011110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042320100
			aData <= "1001011101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042332600
			aData <= "1001011100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042345100
			aData <= "1001011011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042357600
			aData <= "1001011010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042370100
			aData <= "1001011001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042382600
			aData <= "1001011000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042395100
			aData <= "1001100011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042407600
			aData <= "1001100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042420100
			aData <= "1001100001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042432600
			aData <= "1001100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042445100
			aData <= "1001101110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042457600
			aData <= "1001101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042470100
			aData <= "1001101001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042482600
			aData <= "1001110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042495100
			aData <= "1001110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042507600
			aData <= "1001111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042520100
			aData <= "1001111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042532600
			aData <= "1001111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042545100
			aData <= "1001111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042557600
			aData <= "1001111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042570100
			aData <= "1001111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042582600
			aData <= "1001111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042595100
			aData <= "1001111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042607600
			aData <= "1010000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042620100
			aData <= "1010000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042632600
			aData <= "1010000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042645100
			aData <= "1010000100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042657600
			aData <= "1010000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042670100
			aData <= "1010000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042682600
			aData <= "1010000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042695100
			aData <= "1010000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042707600
			aData <= "1010001011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042720100
			aData <= "1010001010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042732600
			aData <= "1010001001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042745100
			aData <= "1010001000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042757600
			aData <= "1010100111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042770100
			aData <= "1010100110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042782600
			aData <= "1010100101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042795100
			aData <= "1010100010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042807600
			aData <= "1010100000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042820100
			aData <= "1010101111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042832600
			aData <= "1010101101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042845100
			aData <= "1010101100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042857600
			aData <= "1010101011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042870100
			aData <= "1010101010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042882600
			aData <= "1010101000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042895100
			aData <= "1010110111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042907600
			aData <= "1010110110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042920100
			aData <= "1010110101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042932600
			aData <= "1010110100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042945100
			aData <= "1010110011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042957600
			aData <= "1010110001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042970100
			aData <= "1010111111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042982600
			aData <= "1010111110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20042995100
			aData <= "1010111101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043007600
			aData <= "1010111100";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043020100
			aData <= "1010111011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043032600
			aData <= "1010111010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043045100
			aData <= "1010111001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043057600
			aData <= "1010111000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043070100
			aData <= "1011000111";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043082600
			aData <= "1011000110";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043095100
			aData <= "1011000101";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043107600
			aData <= "1011000011";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043120100
			aData <= "1011000010";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043132600
			aData <= "1011000001";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043145100
			aData <= "1011000000";      spikeCnt <= "0000001101";      wait for 1 * sys_clk_per;
-- #20043157600
			aData <= "0000000000";      spikeCnt <= "0000001101";      wait for 147 * sys_clk_per; ------------------------------------------------ 

 		wait;
    end process;

    --clock process
    process
    begin
        wait for clock_period/2;
        clk_p <= not clk_p;
        clk_n <= not clk_n;
        
    end process;
    
    
    --reset process
    process
    begin
        rst <= '1';
        wait for clock_period*5;
        rst <= '0';
        wait;
    end process;

end architecture tb;
