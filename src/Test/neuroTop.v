module neuroTop(
    input sysclk_n,
    input sysclk_p,
    input reset,
    output io_inOut,
    input [9:0] io_spikeCnt,
    output [9:0] io_aAddr,
    output io_aEna,
    input [9:0] io_aData,
    output [4:0] io_n,
    output io_spikes_0,
    output io_spikes_1,
    output io_spikes_2,
    output io_spikes_3,
    output io_spikes_4,
    output io_spikes_5,
    output io_spikes_6,
    output io_spikes_7
    );
    
    wire clk_n;
    wire clk_p;
    wire clk;
    wire np_reset;
    wire np_io_inOut;
    wire [9:0] np_io_spikeCnt;
    wire [9:0] np_io_aAddr;
    wire np_io_aEna;
    wire [9:0] np_io_aData;
    wire [4:0] np_io_n;
    wire np_io_spikes_0;
    wire np_io_spikes_1;
    wire np_io_spikes_2;
    wire np_io_spikes_3;
    wire np_io_spikes_4;
    wire np_io_spikes_5;
    wire np_io_spikes_6;
    wire np_io_spikes_7;
    
 
    clk_wiz_0 clkGen(
        .clk_out1(clk),
        .reset(np_reset),
        .clk_in1_p(clk_p),
        .clk_in1_n(clk_n)
    );
        
    neuron_top np(
        .clock(clk),
        .reset(np_reset),
        .io_inOut(np_io_inOut),
        .io_spikeCnt(np_io_spikeCnt),
        .io_aAddr(np_io_aAddr),
        .io_aEna(np_io_aEna),
        .io_aData(np_io_aData),
        .io_n(np_io_n),
        .io_spikes_0(np_io_spikes_0),
        .io_spikes_1(np_io_spikes_1),
        .io_spikes_2(np_io_spikes_2),
        .io_spikes_3(np_io_spikes_3),
        .io_spikes_4(np_io_spikes_4),
        .io_spikes_5(np_io_spikes_5),
        .io_spikes_6(np_io_spikes_6),
        .io_spikes_7(np_io_spikes_7)
    );
    
    assign np_reset = reset;
    assign np_io_inOut = io_inOut;
    assign np_io_spikeCnt = io_spikeCnt;
    assign np_io_aAddr = io_aAddr;
    assign np_io_aEna = io_aEna;
    assign np_io_aData = io_aData;
    assign np_io_n = io_n;
    assign np_io_spikes_0 = io_spikes_0;
    assign np_io_spikes_1 = io_spikes_1;
    assign np_io_spikes_2 = io_spikes_2;
    assign np_io_spikes_3 = io_spikes_3;
    assign np_io_spikes_4 = io_spikes_4;
    assign np_io_spikes_5 = io_spikes_5;
    assign np_io_spikes_6 = io_spikes_6;
    assign np_io_spikes_7 = io_spikes_7;
    assign clk_n = sysclk_n;
    assign clk_p = sysclk_p;
    
endmodule
