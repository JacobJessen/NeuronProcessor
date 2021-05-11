module Tx(
  input        clock,
  input        reset,
  output       io_tx,
  output       io_ready,
  input        io_valid,
  input  [7:0] io_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] clkCnt; // @[UART.scala 15:23]
  reg  baudtick; // @[UART.scala 16:25]
  reg [1:0] state; // @[UART.scala 17:22]
  reg [7:0] data; // @[UART.scala 18:21]
  reg  txBit; // @[UART.scala 19:22]
  reg [2:0] bitCnt; // @[UART.scala 20:23]
  reg  readyR; // @[UART.scala 21:23]
  wire  _T = clkCnt == 11'h2b6; // @[UART.scala 26:15]
  wire [10:0] _T_2 = clkCnt + 11'h1; // @[UART.scala 30:22]
  wire  _T_3 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = baudtick & io_valid; // @[UART.scala 39:21]
  wire  _GEN_2 = _T_4 ? 1'h0 : txBit; // @[UART.scala 39:33]
  wire  _T_5 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire [7:0] _T_8 = {1'h1,data[7:1]}; // @[UART.scala 50:24]
  wire  _T_9 = bitCnt < 3'h7; // @[UART.scala 51:21]
  wire [2:0] _T_11 = bitCnt + 3'h1; // @[UART.scala 52:28]
  wire  _GEN_9 = baudtick ? data[0] : txBit; // @[UART.scala 48:21]
  wire  _T_12 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _GEN_13 = baudtick | txBit; // @[UART.scala 60:21]
  wire  _GEN_15 = _T_12 ? _GEN_13 : txBit; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_5 ? _GEN_9 : _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_21 = _T_3 ? _GEN_2 : _GEN_17; // @[Conditional.scala 40:58]
  wire  _GEN_24 = _T_3 & _T_4; // @[Conditional.scala 40:58]
  assign io_tx = txBit; // @[UART.scala 23:9]
  assign io_ready = readyR; // @[UART.scala 24:12]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  clkCnt = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  baudtick = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  data = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  txBit = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  bitCnt = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  readyR = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      clkCnt <= 11'h0;
    end else if (_T) begin
      clkCnt <= 11'h0;
    end else begin
      clkCnt <= _T_2;
    end
    if (reset) begin
      baudtick <= 1'h0;
    end else begin
      baudtick <= _T;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_3) begin
      if (_T_4) begin
        state <= 2'h1;
      end
    end else if (_T_5) begin
      if (baudtick) begin
        if (!(_T_9)) begin
          state <= 2'h2;
        end
      end
    end else if (_T_12) begin
      if (baudtick) begin
        state <= 2'h0;
      end
    end
    if (reset) begin
      data <= 8'h0;
    end else if (_T_3) begin
      if (_T_4) begin
        data <= io_data;
      end
    end else if (_T_5) begin
      if (baudtick) begin
        data <= _T_8;
      end
    end
    txBit <= reset | _GEN_21;
    if (reset) begin
      bitCnt <= 3'h0;
    end else if (_T_3) begin
      if (_T_4) begin
        bitCnt <= 3'h0;
      end
    end else if (_T_5) begin
      if (baudtick) begin
        if (_T_9) begin
          bitCnt <= _T_11;
        end else begin
          bitCnt <= 3'h0;
        end
      end
    end
    if (reset) begin
      readyR <= 1'h0;
    end else begin
      readyR <= _GEN_24;
    end
  end
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rx,
  input        io_ready,
  output       io_valid,
  output [7:0] io_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] dataSr; // @[UART.scala 77:25]
  reg [1:0] filter; // @[UART.scala 78:25]
  reg  rxBit; // @[UART.scala 79:25]
  reg [3:0] spaceCnt; // @[UART.scala 80:25]
  reg [7:0] data; // @[UART.scala 81:25]
  reg [5:0] clkCnt; // @[UART.scala 82:25]
  reg  baudTick; // @[UART.scala 83:25]
  reg  bitTick; // @[UART.scala 84:25]
  reg [1:0] state; // @[UART.scala 85:25]
  reg [2:0] bitCnt; // @[UART.scala 86:25]
  reg  validR; // @[UART.scala 87:25]
  wire  _T = validR & io_ready; // @[UART.scala 93:15]
  wire  _GEN_0 = _T ? 1'h0 : validR; // @[UART.scala 93:27]
  wire  _T_1 = clkCnt == 6'h2b; // @[UART.scala 97:15]
  wire [5:0] _T_3 = clkCnt + 6'h1; // @[UART.scala 102:22]
  wire [1:0] _T_5 = {dataSr[0],io_rx}; // @[UART.scala 108:25]
  wire  _T_7 = filter < 2'h3; // @[UART.scala 111:30]
  wire  _T_8 = dataSr[1] & _T_7; // @[UART.scala 111:20]
  wire [1:0] _T_10 = filter + 2'h1; // @[UART.scala 112:24]
  wire  _T_12 = ~dataSr[1]; // @[UART.scala 113:16]
  wire  _T_13 = filter > 2'h0; // @[UART.scala 113:37]
  wire  _T_14 = _T_12 & _T_13; // @[UART.scala 113:27]
  wire [1:0] _T_16 = filter - 2'h1; // @[UART.scala 114:24]
  wire  _T_17 = filter == 2'h3; // @[UART.scala 117:17]
  wire  _T_18 = filter == 2'h0; // @[UART.scala 119:23]
  wire  _GEN_5 = _T_18 ? 1'h0 : rxBit; // @[UART.scala 119:31]
  wire  _GEN_6 = _T_17 | _GEN_5; // @[UART.scala 117:25]
  wire  _T_19 = spaceCnt == 4'hf; // @[UART.scala 124:19]
  wire [3:0] _T_21 = spaceCnt + 4'h1; // @[UART.scala 128:28]
  wire  _T_22 = state == 2'h0; // @[UART.scala 130:16]
  wire  _GEN_12 = baudTick ? _GEN_6 : rxBit; // @[UART.scala 107:17]
  wire  _GEN_13 = baudTick & _T_19; // @[UART.scala 107:17]
  wire  _T_23 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_24 = ~rxBit; // @[UART.scala 137:24]
  wire  _T_25 = baudTick & _T_24; // @[UART.scala 137:21]
  wire  _T_26 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire [7:0] _T_28 = {rxBit,data[7:1]}; // @[UART.scala 143:23]
  wire  _T_29 = bitCnt < 3'h7; // @[UART.scala 144:21]
  wire [2:0] _T_31 = bitCnt + 3'h1; // @[UART.scala 145:28]
  wire  _T_32 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_33 = bitTick & rxBit; // @[UART.scala 153:20]
  wire  _GEN_22 = _T_33 | _GEN_0; // @[UART.scala 153:29]
  assign io_valid = validR; // @[UART.scala 91:12]
  assign io_data = data; // @[UART.scala 90:11]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dataSr = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  filter = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  rxBit = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  spaceCnt = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  data = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  clkCnt = _RAND_5[5:0];
  _RAND_6 = {1{`RANDOM}};
  baudTick = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  bitTick = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  bitCnt = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  validR = _RAND_10[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      dataSr <= 2'h3;
    end else if (baudTick) begin
      dataSr <= _T_5;
    end
    if (reset) begin
      filter <= 2'h3;
    end else if (baudTick) begin
      if (_T_8) begin
        filter <= _T_10;
      end else if (_T_14) begin
        filter <= _T_16;
      end
    end
    rxBit <= reset | _GEN_12;
    if (reset) begin
      spaceCnt <= 4'h0;
    end else if (baudTick) begin
      if (_T_22) begin
        spaceCnt <= 4'h0;
      end else if (_T_19) begin
        spaceCnt <= 4'h0;
      end else begin
        spaceCnt <= _T_21;
      end
    end
    if (reset) begin
      data <= 8'h0;
    end else if (!(_T_23)) begin
      if (_T_26) begin
        if (bitTick) begin
          data <= _T_28;
        end
      end
    end
    if (reset) begin
      clkCnt <= 6'h0;
    end else if (_T_1) begin
      clkCnt <= 6'h0;
    end else begin
      clkCnt <= _T_3;
    end
    if (reset) begin
      baudTick <= 1'h0;
    end else begin
      baudTick <= _T_1;
    end
    if (reset) begin
      bitTick <= 1'h0;
    end else begin
      bitTick <= _GEN_13;
    end
    if (reset) begin
      state <= 2'h0;
    end else if (_T_23) begin
      if (_T_25) begin
        state <= 2'h1;
      end
    end else if (_T_26) begin
      if (bitTick) begin
        if (!(_T_29)) begin
          state <= 2'h2;
        end
      end
    end else if (_T_32) begin
      if (_T_33) begin
        state <= 2'h0;
      end
    end
    if (reset) begin
      bitCnt <= 3'h0;
    end else if (!(_T_23)) begin
      if (_T_26) begin
        if (bitTick) begin
          if (_T_29) begin
            bitCnt <= _T_31;
          end else begin
            bitCnt <= 3'h0;
          end
        end
      end
    end
    if (reset) begin
      validR <= 1'h0;
    end else if (_T_23) begin
      if (_T) begin
        validR <= 1'h0;
      end
    end else if (_T_26) begin
      if (_T) begin
        validR <= 1'h0;
      end
    end else if (_T_32) begin
      validR <= _GEN_22;
    end else if (_T) begin
      validR <= 1'h0;
    end
  end
endmodule
module Uart(
  input        clock,
  input        reset,
  input        io_rxd,
  output       io_txd,
  input        io_rxReady,
  output       io_rxValid,
  output [7:0] io_rxByte,
  output       io_txReady,
  input        io_txValid,
  input  [7:0] io_txByte
);
  wire  tx_clock; // @[UART.scala 177:18]
  wire  tx_reset; // @[UART.scala 177:18]
  wire  tx_io_tx; // @[UART.scala 177:18]
  wire  tx_io_ready; // @[UART.scala 177:18]
  wire  tx_io_valid; // @[UART.scala 177:18]
  wire [7:0] tx_io_data; // @[UART.scala 177:18]
  wire  rx_clock; // @[UART.scala 178:18]
  wire  rx_reset; // @[UART.scala 178:18]
  wire  rx_io_rx; // @[UART.scala 178:18]
  wire  rx_io_ready; // @[UART.scala 178:18]
  wire  rx_io_valid; // @[UART.scala 178:18]
  wire [7:0] rx_io_data; // @[UART.scala 178:18]
  Tx tx ( // @[UART.scala 177:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_tx(tx_io_tx),
    .io_ready(tx_io_ready),
    .io_valid(tx_io_valid),
    .io_data(tx_io_data)
  );
  Rx rx ( // @[UART.scala 178:18]
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rx(rx_io_rx),
    .io_ready(rx_io_ready),
    .io_valid(rx_io_valid),
    .io_data(rx_io_data)
  );
  assign io_txd = tx_io_tx; // @[UART.scala 180:10]
  assign io_rxValid = rx_io_valid; // @[UART.scala 187:14]
  assign io_rxByte = rx_io_data; // @[UART.scala 188:13]
  assign io_txReady = tx_io_ready; // @[UART.scala 181:14]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_valid = io_txValid; // @[UART.scala 182:15]
  assign tx_io_data = io_txByte; // @[UART.scala 183:14]
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rx = io_rxd; // @[UART.scala 185:12]
  assign rx_io_ready = io_rxReady; // @[UART.scala 186:15]
endmodule
module OffChipCom(
  input         clock,
  input         reset,
  output        io_tx,
  input         io_rx,
  output [23:0] io_inC0Data,
  output        io_inC0Valid,
  output [23:0] io_inC1Data,
  output        io_inC1Valid,
  input  [7:0]  io_outCData,
  input         io_outCValid,
  output        io_outCReady,
  input         io_inC0HSin,
  output        io_inC0HSout,
  input         io_inC1HSin,
  output        io_inC1HSout
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  uart_clock; // @[OffChipCom.scala 34:20]
  wire  uart_reset; // @[OffChipCom.scala 34:20]
  wire  uart_io_rxd; // @[OffChipCom.scala 34:20]
  wire  uart_io_txd; // @[OffChipCom.scala 34:20]
  wire  uart_io_rxReady; // @[OffChipCom.scala 34:20]
  wire  uart_io_rxValid; // @[OffChipCom.scala 34:20]
  wire [7:0] uart_io_rxByte; // @[OffChipCom.scala 34:20]
  wire  uart_io_txReady; // @[OffChipCom.scala 34:20]
  wire  uart_io_txValid; // @[OffChipCom.scala 34:20]
  wire [7:0] uart_io_txByte; // @[OffChipCom.scala 34:20]
  reg [7:0] txBuf; // @[OffChipCom.scala 36:22]
  reg  txV; // @[OffChipCom.scala 37:22]
  reg  phase; // @[OffChipCom.scala 39:22]
  reg [1:0] byteCnt; // @[OffChipCom.scala 41:24]
  reg [8:0] pixCnt; // @[OffChipCom.scala 42:23]
  reg  inC0V; // @[OffChipCom.scala 44:22]
  reg  inC1V; // @[OffChipCom.scala 45:22]
  reg [7:0] addr1; // @[OffChipCom.scala 47:22]
  reg [7:0] addr0; // @[OffChipCom.scala 48:22]
  reg [7:0] rate1; // @[OffChipCom.scala 49:22]
  reg [7:0] rate0; // @[OffChipCom.scala 50:22]
  reg [1:0] stateReg; // @[OffChipCom.scala 55:25]
  wire [15:0] _T = {addr0,rate1}; // @[OffChipCom.scala 57:20]
  wire  _T_2 = uart_io_txReady & txV; // @[OffChipCom.scala 68:24]
  wire  _GEN_0 = _T_2 ? 1'h0 : txV; // @[OffChipCom.scala 68:32]
  wire  _GEN_1 = inC0V ? 1'h0 : inC0V; // @[OffChipCom.scala 76:31]
  wire  _GEN_2 = inC1V ? 1'h0 : inC1V; // @[OffChipCom.scala 83:31]
  wire  _T_5 = 2'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_6 = phase == io_inC0HSin; // @[OffChipCom.scala 89:18]
  wire  _T_7 = io_inC0HSin == io_inC1HSin; // @[OffChipCom.scala 89:49]
  wire  _T_8 = _T_6 & _T_7; // @[OffChipCom.scala 89:34]
  wire  _T_9 = 2'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_8 = uart_io_txReady ? _GEN_0 : 1'h1; // @[OffChipCom.scala 94:29]
  wire  _T_10 = 2'h2 == stateReg; // @[Conditional.scala 37:30]
  wire [1:0] _T_12 = byteCnt + 2'h1; // @[OffChipCom.scala 111:28]
  wire  _T_13 = byteCnt == 2'h3; // @[OffChipCom.scala 113:23]
  wire  _GEN_14 = uart_io_rxValid; // @[OffChipCom.scala 104:29]
  wire  _T_14 = 2'h3 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_15 = addr1 == 8'h0; // @[OffChipCom.scala 121:19]
  wire  _GEN_17 = _T_15 | _GEN_1; // @[OffChipCom.scala 121:27]
  wire [8:0] _T_17 = pixCnt + 9'h1; // @[OffChipCom.scala 126:24]
  wire  _T_18 = pixCnt == 9'h1e3; // @[OffChipCom.scala 128:19]
  wire  _T_19 = ~phase; // @[OffChipCom.scala 130:18]
  wire  _GEN_30 = _T_10 & _GEN_14; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_9 ? _GEN_8 : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_9 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_5 ? _GEN_0 : _GEN_41; // @[Conditional.scala 40:58]
  wire  _T_20 = ~txV; // @[OffChipCom.scala 139:25]
  wire  _T_21 = io_outCValid & _T_20; // @[OffChipCom.scala 139:22]
  wire  _GEN_63 = _T_21 | _GEN_54; // @[OffChipCom.scala 139:30]
  Uart uart ( // @[OffChipCom.scala 34:20]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_rxd(uart_io_rxd),
    .io_txd(uart_io_txd),
    .io_rxReady(uart_io_rxReady),
    .io_rxValid(uart_io_rxValid),
    .io_rxByte(uart_io_rxByte),
    .io_txReady(uart_io_txReady),
    .io_txValid(uart_io_txValid),
    .io_txByte(uart_io_txByte)
  );
  assign io_tx = uart_io_txd; // @[OffChipCom.scala 64:9]
  assign io_inC0Data = {_T,rate0}; // @[OffChipCom.scala 74:15]
  assign io_inC0Valid = inC0V; // @[OffChipCom.scala 75:16]
  assign io_inC1Data = {_T,rate0}; // @[OffChipCom.scala 81:15]
  assign io_inC1Valid = inC1V; // @[OffChipCom.scala 82:16]
  assign io_outCReady = io_outCValid & _T_20; // @[OffChipCom.scala 138:16 OffChipCom.scala 141:18]
  assign io_inC0HSout = phase; // @[OffChipCom.scala 73:16]
  assign io_inC1HSout = phase; // @[OffChipCom.scala 80:16]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_rxd = io_rx; // @[OffChipCom.scala 60:15]
  assign uart_io_rxReady = _T_5 ? 1'h0 : _GEN_46; // @[OffChipCom.scala 61:19 OffChipCom.scala 109:25]
  assign uart_io_txValid = txV; // @[OffChipCom.scala 65:19]
  assign uart_io_txByte = txBuf; // @[OffChipCom.scala 66:18]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  txBuf = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  txV = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  phase = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  byteCnt = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  pixCnt = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  inC0V = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  inC1V = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  addr1 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  addr0 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  rate1 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  rate0 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  stateReg = _RAND_11[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      txBuf <= 8'h0;
    end else if (_T_21) begin
      txBuf <= io_outCData;
    end else if (!(_T_5)) begin
      if (_T_9) begin
        if (!(uart_io_txReady)) begin
          txBuf <= 8'hff;
        end
      end
    end
    if (reset) begin
      txV <= 1'h0;
    end else begin
      txV <= _GEN_63;
    end
    if (reset) begin
      phase <= 1'h0;
    end else if (!(_T_5)) begin
      if (!(_T_9)) begin
        if (!(_T_10)) begin
          if (_T_14) begin
            if (_T_18) begin
              phase <= _T_19;
            end
          end
        end
      end
    end
    if (reset) begin
      byteCnt <= 2'h0;
    end else if (!(_T_5)) begin
      if (_T_9) begin
        if (!(uart_io_txReady)) begin
          byteCnt <= 2'h0;
        end
      end else if (_T_10) begin
        if (uart_io_rxValid) begin
          byteCnt <= _T_12;
        end
      end
    end
    if (reset) begin
      pixCnt <= 9'h0;
    end else if (!(_T_5)) begin
      if (_T_9) begin
        if (!(uart_io_txReady)) begin
          pixCnt <= 9'h0;
        end
      end else if (!(_T_10)) begin
        if (_T_14) begin
          pixCnt <= _T_17;
        end
      end
    end
    if (reset) begin
      inC0V <= 1'h0;
    end else if (_T_5) begin
      if (inC0V) begin
        inC0V <= 1'h0;
      end
    end else if (_T_9) begin
      if (inC0V) begin
        inC0V <= 1'h0;
      end
    end else if (_T_10) begin
      if (inC0V) begin
        inC0V <= 1'h0;
      end
    end else if (_T_14) begin
      inC0V <= _GEN_17;
    end else if (inC0V) begin
      inC0V <= 1'h0;
    end
    if (reset) begin
      inC1V <= 1'h0;
    end else if (_T_5) begin
      if (inC1V) begin
        inC1V <= 1'h0;
      end
    end else if (_T_9) begin
      if (inC1V) begin
        inC1V <= 1'h0;
      end
    end else if (_T_10) begin
      if (inC1V) begin
        inC1V <= 1'h0;
      end
    end else if (_T_14) begin
      if (_T_15) begin
        if (inC1V) begin
          inC1V <= 1'h0;
        end
      end else begin
        inC1V <= 1'h1;
      end
    end else begin
      inC1V <= _GEN_2;
    end
    if (reset) begin
      addr1 <= 8'h0;
    end else if (!(_T_5)) begin
      if (!(_T_9)) begin
        if (_T_10) begin
          if (uart_io_rxValid) begin
            addr1 <= addr0;
          end
        end
      end
    end
    if (reset) begin
      addr0 <= 8'h0;
    end else if (!(_T_5)) begin
      if (!(_T_9)) begin
        if (_T_10) begin
          if (uart_io_rxValid) begin
            addr0 <= rate1;
          end
        end
      end
    end
    if (reset) begin
      rate1 <= 8'h0;
    end else if (!(_T_5)) begin
      if (!(_T_9)) begin
        if (_T_10) begin
          if (uart_io_rxValid) begin
            rate1 <= rate0;
          end
        end
      end
    end
    if (reset) begin
      rate0 <= 8'h0;
    end else if (!(_T_5)) begin
      if (!(_T_9)) begin
        if (_T_10) begin
          if (uart_io_rxValid) begin
            rate0 <= uart_io_rxByte;
          end
        end
      end
    end
    if (reset) begin
      stateReg <= 2'h0;
    end else if (_T_5) begin
      if (_T_8) begin
        stateReg <= 2'h1;
      end
    end else if (_T_9) begin
      if (uart_io_txReady) begin
        stateReg <= 2'h2;
      end
    end else if (_T_10) begin
      if (uart_io_rxValid) begin
        if (_T_13) begin
          stateReg <= 2'h3;
        end else begin
          stateReg <= 2'h2;
        end
      end
    end else if (_T_14) begin
      if (_T_18) begin
        stateReg <= 2'h0;
      end else begin
        stateReg <= 2'h2;
      end
    end
  end
endmodule
module BusInterface(
  input         io_grant,
  output        io_reqOut,
  output [10:0] io_tx,
  input  [10:0] io_spikeID,
  output        io_ready,
  input         io_reqIn
);
  wire  _T = ~io_grant; // @[BusInterface.scala 28:28]
  assign io_reqOut = io_reqIn & _T; // @[BusInterface.scala 28:13]
  assign io_tx = io_grant ? io_spikeID : 11'h0; // @[BusInterface.scala 23:9 BusInterface.scala 25:11]
  assign io_ready = io_grant; // @[BusInterface.scala 29:15]
endmodule
module PriorityMaskRstEncoder(
  input        io_reqs_0,
  input        io_reqs_1,
  input        io_reqs_2,
  input        io_reqs_3,
  input        io_reqs_4,
  input        io_reqs_5,
  input        io_reqs_6,
  input        io_reqs_7,
  output [2:0] io_value,
  output       io_mask_0,
  output       io_mask_1,
  output       io_mask_2,
  output       io_mask_3,
  output       io_mask_4,
  output       io_mask_5,
  output       io_mask_6,
  output       io_mask_7,
  output       io_rst_0,
  output       io_rst_1,
  output       io_rst_2,
  output       io_rst_3,
  output       io_rst_4,
  output       io_rst_5,
  output       io_rst_6,
  output       io_rst_7,
  output       io_valid
);
  wire  _GEN_3 = io_reqs_1 | io_reqs_0; // @[SpikeTransmission.scala 89:22]
  wire  _GEN_5 = io_reqs_2 | _GEN_3; // @[SpikeTransmission.scala 89:22]
  wire [1:0] _GEN_6 = io_reqs_2 ? 2'h2 : {{1'd0}, io_reqs_1}; // @[SpikeTransmission.scala 89:22]
  wire  _GEN_7 = io_reqs_3 | _GEN_5; // @[SpikeTransmission.scala 89:22]
  wire [1:0] _GEN_8 = io_reqs_3 ? 2'h3 : _GEN_6; // @[SpikeTransmission.scala 89:22]
  wire  _GEN_9 = io_reqs_4 | _GEN_7; // @[SpikeTransmission.scala 89:22]
  wire [2:0] _GEN_10 = io_reqs_4 ? 3'h4 : {{1'd0}, _GEN_8}; // @[SpikeTransmission.scala 89:22]
  wire  _GEN_11 = io_reqs_5 | _GEN_9; // @[SpikeTransmission.scala 89:22]
  wire [2:0] _GEN_12 = io_reqs_5 ? 3'h5 : _GEN_10; // @[SpikeTransmission.scala 89:22]
  wire  _GEN_13 = io_reqs_6 | _GEN_11; // @[SpikeTransmission.scala 89:22]
  wire [2:0] _GEN_14 = io_reqs_6 ? 3'h6 : _GEN_12; // @[SpikeTransmission.scala 89:22]
  wire  _T_8 = 3'h0 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_10 = 3'h1 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_12 = 3'h2 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_14 = 3'h3 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_16 = 3'h4 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_18 = 3'h5 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_20 = 3'h6 == io_value; // @[SpikeTransmission.scala 96:14]
  wire  _T_22 = 3'h7 == io_value; // @[SpikeTransmission.scala 96:14]
  assign io_value = io_reqs_7 ? 3'h7 : _GEN_14; // @[SpikeTransmission.scala 75:12 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16 SpikeTransmission.scala 91:16]
  assign io_mask_0 = io_mask_1 | io_reqs_1; // @[SpikeTransmission.scala 85:16]
  assign io_mask_1 = io_mask_2 | io_reqs_2; // @[SpikeTransmission.scala 85:16]
  assign io_mask_2 = io_mask_3 | io_reqs_3; // @[SpikeTransmission.scala 85:16]
  assign io_mask_3 = io_mask_4 | io_reqs_4; // @[SpikeTransmission.scala 85:16]
  assign io_mask_4 = io_mask_5 | io_reqs_5; // @[SpikeTransmission.scala 85:16]
  assign io_mask_5 = io_mask_6 | io_reqs_6; // @[SpikeTransmission.scala 85:16]
  assign io_mask_6 = io_mask_7 | io_reqs_7; // @[SpikeTransmission.scala 85:16]
  assign io_mask_7 = io_value == 3'h0; // @[SpikeTransmission.scala 80:28 SpikeTransmission.scala 82:28]
  assign io_rst_0 = _T_8 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_1 = _T_10 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_2 = _T_12 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_3 = _T_14 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_4 = _T_16 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_5 = _T_18 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_6 = _T_20 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_rst_7 = _T_22 & io_valid; // @[SpikeTransmission.scala 97:17 SpikeTransmission.scala 99:17]
  assign io_valid = io_reqs_7 | _GEN_13; // @[SpikeTransmission.scala 76:12 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16 SpikeTransmission.scala 90:16]
endmodule
module TransmissionSystem(
  input         clock,
  input         reset,
  output [10:0] io_data,
  input         io_ready,
  output        io_valid,
  input  [4:0]  io_n,
  input         io_spikes_0,
  input         io_spikes_1,
  input         io_spikes_2,
  input         io_spikes_3,
  input         io_spikes_4,
  input         io_spikes_5,
  input         io_spikes_6,
  input         io_spikes_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  spikeEncoder_io_reqs_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_7; // @[SpikeTransmission.scala 22:28]
  wire [2:0] spikeEncoder_io_value; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_valid; // @[SpikeTransmission.scala 22:28]
  reg  spikeRegs_0; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_1; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_2; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_3; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_4; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_5; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_6; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_7; // @[SpikeTransmission.scala 18:29]
  reg [4:0] neuronIdMSB_0; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_1; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_2; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_3; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_4; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_5; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_6; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_7; // @[SpikeTransmission.scala 19:29]
  reg  maskRegs_0; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_1; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_2; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_3; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_4; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_5; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_6; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_7; // @[SpikeTransmission.scala 20:29]
  wire  _T_3 = ~spikeEncoder_io_valid; // @[SpikeTransmission.scala 37:16]
  wire  _GEN_0 = _T_3 | maskRegs_0; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_1 = io_ready ? spikeEncoder_io_mask_0 : _GEN_0; // @[SpikeTransmission.scala 35:20]
  wire  _T_5 = spikeEncoder_io_rst_0 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_0 = ~_T_5; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_0 = rstReadySel_0 & spikeRegs_0; // @[SpikeTransmission.scala 44:38]
  wire  _T_8 = ~spikeUpdate_0; // @[SpikeTransmission.scala 46:10]
  wire  _T_9 = 3'h0 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_11 = {3'h0,neuronIdMSB_0,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_5 = _T_9 ? _T_11 : 11'h0; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_6 = _T_3 | maskRegs_1; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_7 = io_ready ? spikeEncoder_io_mask_1 : _GEN_6; // @[SpikeTransmission.scala 35:20]
  wire  _T_14 = spikeEncoder_io_rst_1 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_1 = ~_T_14; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_1 = rstReadySel_1 & spikeRegs_1; // @[SpikeTransmission.scala 44:38]
  wire  _T_17 = ~spikeUpdate_1; // @[SpikeTransmission.scala 46:10]
  wire  _T_18 = 3'h1 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_20 = {3'h0,neuronIdMSB_1,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_11 = _T_18 ? _T_20 : _GEN_5; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_12 = _T_3 | maskRegs_2; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_13 = io_ready ? spikeEncoder_io_mask_2 : _GEN_12; // @[SpikeTransmission.scala 35:20]
  wire  _T_23 = spikeEncoder_io_rst_2 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_2 = ~_T_23; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_2 = rstReadySel_2 & spikeRegs_2; // @[SpikeTransmission.scala 44:38]
  wire  _T_26 = ~spikeUpdate_2; // @[SpikeTransmission.scala 46:10]
  wire  _T_27 = 3'h2 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_29 = {3'h0,neuronIdMSB_2,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_17 = _T_27 ? _T_29 : _GEN_11; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_18 = _T_3 | maskRegs_3; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_19 = io_ready ? spikeEncoder_io_mask_3 : _GEN_18; // @[SpikeTransmission.scala 35:20]
  wire  _T_32 = spikeEncoder_io_rst_3 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_3 = ~_T_32; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_3 = rstReadySel_3 & spikeRegs_3; // @[SpikeTransmission.scala 44:38]
  wire  _T_35 = ~spikeUpdate_3; // @[SpikeTransmission.scala 46:10]
  wire  _T_36 = 3'h3 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_38 = {3'h0,neuronIdMSB_3,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_23 = _T_36 ? _T_38 : _GEN_17; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_24 = _T_3 | maskRegs_4; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_25 = io_ready ? spikeEncoder_io_mask_4 : _GEN_24; // @[SpikeTransmission.scala 35:20]
  wire  _T_41 = spikeEncoder_io_rst_4 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_4 = ~_T_41; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_4 = rstReadySel_4 & spikeRegs_4; // @[SpikeTransmission.scala 44:38]
  wire  _T_44 = ~spikeUpdate_4; // @[SpikeTransmission.scala 46:10]
  wire  _T_45 = 3'h4 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_47 = {3'h0,neuronIdMSB_4,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_29 = _T_45 ? _T_47 : _GEN_23; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_30 = _T_3 | maskRegs_5; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_31 = io_ready ? spikeEncoder_io_mask_5 : _GEN_30; // @[SpikeTransmission.scala 35:20]
  wire  _T_50 = spikeEncoder_io_rst_5 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_5 = ~_T_50; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_5 = rstReadySel_5 & spikeRegs_5; // @[SpikeTransmission.scala 44:38]
  wire  _T_53 = ~spikeUpdate_5; // @[SpikeTransmission.scala 46:10]
  wire  _T_54 = 3'h5 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_56 = {3'h0,neuronIdMSB_5,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_35 = _T_54 ? _T_56 : _GEN_29; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_36 = _T_3 | maskRegs_6; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_37 = io_ready ? spikeEncoder_io_mask_6 : _GEN_36; // @[SpikeTransmission.scala 35:20]
  wire  _T_59 = spikeEncoder_io_rst_6 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_6 = ~_T_59; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_6 = rstReadySel_6 & spikeRegs_6; // @[SpikeTransmission.scala 44:38]
  wire  _T_62 = ~spikeUpdate_6; // @[SpikeTransmission.scala 46:10]
  wire  _T_63 = 3'h6 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_65 = {3'h0,neuronIdMSB_6,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_41 = _T_63 ? _T_65 : _GEN_35; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_42 = _T_3 | maskRegs_7; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_43 = io_ready ? spikeEncoder_io_mask_7 : _GEN_42; // @[SpikeTransmission.scala 35:20]
  wire  _T_68 = spikeEncoder_io_rst_7 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_7 = ~_T_68; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_7 = rstReadySel_7 & spikeRegs_7; // @[SpikeTransmission.scala 44:38]
  wire  _T_71 = ~spikeUpdate_7; // @[SpikeTransmission.scala 46:10]
  wire  _T_72 = 3'h7 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_74 = {3'h0,neuronIdMSB_7,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  PriorityMaskRstEncoder spikeEncoder ( // @[SpikeTransmission.scala 22:28]
    .io_reqs_0(spikeEncoder_io_reqs_0),
    .io_reqs_1(spikeEncoder_io_reqs_1),
    .io_reqs_2(spikeEncoder_io_reqs_2),
    .io_reqs_3(spikeEncoder_io_reqs_3),
    .io_reqs_4(spikeEncoder_io_reqs_4),
    .io_reqs_5(spikeEncoder_io_reqs_5),
    .io_reqs_6(spikeEncoder_io_reqs_6),
    .io_reqs_7(spikeEncoder_io_reqs_7),
    .io_value(spikeEncoder_io_value),
    .io_mask_0(spikeEncoder_io_mask_0),
    .io_mask_1(spikeEncoder_io_mask_1),
    .io_mask_2(spikeEncoder_io_mask_2),
    .io_mask_3(spikeEncoder_io_mask_3),
    .io_mask_4(spikeEncoder_io_mask_4),
    .io_mask_5(spikeEncoder_io_mask_5),
    .io_mask_6(spikeEncoder_io_mask_6),
    .io_mask_7(spikeEncoder_io_mask_7),
    .io_rst_0(spikeEncoder_io_rst_0),
    .io_rst_1(spikeEncoder_io_rst_1),
    .io_rst_2(spikeEncoder_io_rst_2),
    .io_rst_3(spikeEncoder_io_rst_3),
    .io_rst_4(spikeEncoder_io_rst_4),
    .io_rst_5(spikeEncoder_io_rst_5),
    .io_rst_6(spikeEncoder_io_rst_6),
    .io_rst_7(spikeEncoder_io_rst_7),
    .io_valid(spikeEncoder_io_valid)
  );
  assign io_data = _T_72 ? _T_74 : _GEN_41; // @[SpikeTransmission.scala 29:12 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15]
  assign io_valid = spikeEncoder_io_valid; // @[SpikeTransmission.scala 30:12]
  assign spikeEncoder_io_reqs_0 = maskRegs_0 & spikeRegs_0; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_1 = maskRegs_1 & spikeRegs_1; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_2 = maskRegs_2 & spikeRegs_2; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_3 = maskRegs_3 & spikeRegs_3; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_4 = maskRegs_4 & spikeRegs_4; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_5 = maskRegs_5 & spikeRegs_5; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_6 = maskRegs_6 & spikeRegs_6; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_7 = maskRegs_7 & spikeRegs_7; // @[SpikeTransmission.scala 27:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  spikeRegs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  spikeRegs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  spikeRegs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  spikeRegs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  spikeRegs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  spikeRegs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  spikeRegs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  spikeRegs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  neuronIdMSB_0 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  neuronIdMSB_1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  neuronIdMSB_2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  neuronIdMSB_3 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  neuronIdMSB_4 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  neuronIdMSB_5 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  neuronIdMSB_6 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  neuronIdMSB_7 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  maskRegs_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  maskRegs_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  maskRegs_2 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  maskRegs_3 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  maskRegs_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  maskRegs_5 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  maskRegs_6 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  maskRegs_7 = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      spikeRegs_0 <= 1'h0;
    end else if (_T_8) begin
      spikeRegs_0 <= io_spikes_0;
    end
    if (reset) begin
      spikeRegs_1 <= 1'h0;
    end else if (_T_17) begin
      spikeRegs_1 <= io_spikes_1;
    end
    if (reset) begin
      spikeRegs_2 <= 1'h0;
    end else if (_T_26) begin
      spikeRegs_2 <= io_spikes_2;
    end
    if (reset) begin
      spikeRegs_3 <= 1'h0;
    end else if (_T_35) begin
      spikeRegs_3 <= io_spikes_3;
    end
    if (reset) begin
      spikeRegs_4 <= 1'h0;
    end else if (_T_44) begin
      spikeRegs_4 <= io_spikes_4;
    end
    if (reset) begin
      spikeRegs_5 <= 1'h0;
    end else if (_T_53) begin
      spikeRegs_5 <= io_spikes_5;
    end
    if (reset) begin
      spikeRegs_6 <= 1'h0;
    end else if (_T_62) begin
      spikeRegs_6 <= io_spikes_6;
    end
    if (reset) begin
      spikeRegs_7 <= 1'h0;
    end else if (_T_71) begin
      spikeRegs_7 <= io_spikes_7;
    end
    if (reset) begin
      neuronIdMSB_0 <= 5'h0;
    end else if (_T_8) begin
      neuronIdMSB_0 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_1 <= 5'h0;
    end else if (_T_17) begin
      neuronIdMSB_1 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_2 <= 5'h0;
    end else if (_T_26) begin
      neuronIdMSB_2 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_3 <= 5'h0;
    end else if (_T_35) begin
      neuronIdMSB_3 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_4 <= 5'h0;
    end else if (_T_44) begin
      neuronIdMSB_4 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_5 <= 5'h0;
    end else if (_T_53) begin
      neuronIdMSB_5 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_6 <= 5'h0;
    end else if (_T_62) begin
      neuronIdMSB_6 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_7 <= 5'h0;
    end else if (_T_71) begin
      neuronIdMSB_7 <= io_n;
    end
    maskRegs_0 <= reset | _GEN_1;
    maskRegs_1 <= reset | _GEN_7;
    maskRegs_2 <= reset | _GEN_13;
    maskRegs_3 <= reset | _GEN_19;
    maskRegs_4 <= reset | _GEN_25;
    maskRegs_5 <= reset | _GEN_31;
    maskRegs_6 <= reset | _GEN_37;
    maskRegs_7 <= reset | _GEN_43;
  end
endmodule
module InputCore(
  input         clock,
  input         reset,
  input  [23:0] io_offCCData,
  input         io_offCCValid,
  input         io_offCCHSin,
  output        io_offCCHSout,
  input         io_grant,
  output        io_req,
  output [10:0] io_tx
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  interface__io_grant; // @[InputCore.scala 29:26]
  wire  interface__io_reqOut; // @[InputCore.scala 29:26]
  wire [10:0] interface__io_tx; // @[InputCore.scala 29:26]
  wire [10:0] interface__io_spikeID; // @[InputCore.scala 29:26]
  wire  interface__io_ready; // @[InputCore.scala 29:26]
  wire  interface__io_reqIn; // @[InputCore.scala 29:26]
  wire  spikeTrans_clock; // @[InputCore.scala 36:26]
  wire  spikeTrans_reset; // @[InputCore.scala 36:26]
  wire [10:0] spikeTrans_io_data; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_ready; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_valid; // @[InputCore.scala 36:26]
  wire [4:0] spikeTrans_io_n; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_0; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_1; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_2; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_3; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_4; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_5; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_6; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_7; // @[InputCore.scala 36:26]
  reg [8:0] rateMem00 [0:255]; // @[InputCore.scala 63:29]
  initial begin
  $readmemb("Y:/home/jacob/myDrive/test_postSynth/NeuromorphicProcessor/mapping/in0mem.mem", rateMem00);
  end // @[Neurons.scala 212:37]
  wire [8:0] rateMem00__T_1_r_data; // @[InputCore.scala 63:29]
  wire [7:0] rateMem00__T_1_r_addr; // @[InputCore.scala 63:29]
  wire [8:0] rateMem00__T_1_w_data; // @[InputCore.scala 63:29]
  wire [7:0] rateMem00__T_1_w_addr; // @[InputCore.scala 63:29]
  wire  rateMem00__T_1_w_mask; // @[InputCore.scala 63:29]
  wire  rateMem00__T_1_w_en; // @[InputCore.scala 63:29]
  reg  rateMem00__T_1_r_en_pipe_0;
  reg [7:0] rateMem00__T_1_r_addr_pipe_0;
  reg [8:0] rateMem1 [0:255]; // @[InputCore.scala 81:29]
  initial begin
  $readmemb("Y:/home/jacob/myDrive/test_postSynth/NeuromorphicProcessor/mapping/in0mem.mem", rateMem1);
  end
  wire [8:0] rateMem1__T_2_r_data; // @[InputCore.scala 81:29]
  wire [7:0] rateMem1__T_2_r_addr; // @[InputCore.scala 81:29]
  wire [8:0] rateMem1__T_2_w_data; // @[InputCore.scala 81:29]
  wire [7:0] rateMem1__T_2_w_addr; // @[InputCore.scala 81:29]
  wire  rateMem1__T_2_w_mask; // @[InputCore.scala 81:29]
  wire  rateMem1__T_2_w_en; // @[InputCore.scala 81:29]
  reg  rateMem1__T_2_r_en_pipe_0;
  reg [7:0] rateMem1__T_2_r_addr_pipe_0;
  reg [8:0] ts; // @[InputCore.scala 42:29]
  reg [7:0] pixcnt; // @[InputCore.scala 43:29]
  reg [7:0] pixcntLate; // @[InputCore.scala 44:29]
  reg [7:0] pixcntLater; // @[InputCore.scala 45:29]
  reg [16:0] tsCycleCnt; // @[InputCore.scala 46:29]
  reg  phase; // @[InputCore.scala 47:29]
  reg  spikePulse_0; // @[InputCore.scala 50:29]
  reg  spikePulse_1; // @[InputCore.scala 50:29]
  reg  spikePulse_2; // @[InputCore.scala 50:29]
  reg  spikePulse_3; // @[InputCore.scala 50:29]
  reg  spikePulse_4; // @[InputCore.scala 50:29]
  reg  spikePulse_5; // @[InputCore.scala 50:29]
  reg  spikePulse_6; // @[InputCore.scala 50:29]
  reg  spikePulse_7; // @[InputCore.scala 50:29]
  reg [2:0] stateReg; // @[InputCore.scala 52:29]
  wire [8:0] rdata0 = rateMem00__T_1_r_data; // @[InputCore.scala 69:15]
  wire  _T_14 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_19 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_22 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_47 = _T_19 | _T_22; // @[Conditional.scala 39:67]
  wire  cntrEna = _T_14 ? 1'h0 : _GEN_47; // @[Conditional.scala 40:58]
  wire  ena0 = phase ? io_offCCValid : cntrEna; // @[InputCore.scala 97:16]
  wire  _GEN_8 = ena0 & phase; // @[InputCore.scala 67:14]
  wire  wr1 = phase ? 1'h0 : 1'h1; // @[InputCore.scala 97:16]
  wire [8:0] rdata1 = rateMem1__T_2_r_data; // @[InputCore.scala 86:15]
  wire  ena1 = phase ? cntrEna : io_offCCValid; // @[InputCore.scala 97:16]
  wire  _GEN_18 = ena1 & wr1; // @[InputCore.scala 84:14]
  wire [8:0] cntrRateData = phase ? rdata1 : rdata0; // @[InputCore.scala 97:16]
  wire [16:0] _T_8 = tsCycleCnt - 17'h1; // @[InputCore.scala 118:28]
  wire  _T_9 = tsCycleCnt == 17'h0; // @[InputCore.scala 119:19]
  wire  _T_10 = ts == 9'h0; // @[InputCore.scala 125:11]
  wire  _T_11 = cntrRateData == 9'h0; // @[InputCore.scala 125:35]
  wire  _T_12 = _T_10 | _T_11; // @[InputCore.scala 125:19]
  wire [8:0] _GEN_0 = ts % cntrRateData; // @[InputCore.scala 128:18]
  wire [8:0] _T_13 = _GEN_0[8:0]; // @[InputCore.scala 128:18]
  wire [8:0] modRes = _T_12 ? 9'h1 : _T_13; // @[InputCore.scala 125:43]
  wire  _T_15 = io_offCCHSin != phase; // @[InputCore.scala 135:25]
  wire  _T_17 = _T_15 & _T_9; // @[InputCore.scala 135:35]
  wire  _T_18 = ~phase; // @[InputCore.scala 137:18]
  wire  _GEN_30 = _T_17 ? _T_18 : phase; // @[InputCore.scala 135:58]
  wire [7:0] _T_21 = pixcnt + 8'h1; // @[InputCore.scala 142:24]
  wire  _T_25 = modRes == 9'h0; // @[InputCore.scala 148:19]
  wire [3:0] _T_27 = {1'h0,pixcntLate[2:0]}; // @[InputCore.scala 149:34]
  wire [3:0] _GEN_31 = _T_25 ? _T_27 : 4'h8; // @[InputCore.scala 148:27]
  wire  _T_28 = pixcnt == 8'hff; // @[InputCore.scala 152:19]
  wire  _T_29 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [8:0] _T_31 = ts + 9'h1; // @[InputCore.scala 158:16]
  wire  _T_32 = cntrRateData != 9'h0; // @[InputCore.scala 159:25]
  wire  _T_34 = _T_32 & _T_25; // @[InputCore.scala 159:33]
  wire [3:0] _GEN_33 = _T_34 ? _T_27 : 4'h8; // @[InputCore.scala 159:51]
  wire  _T_37 = ts == 9'h1f3; // @[InputCore.scala 163:15]
  wire  _T_38 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_39 = _T_29 ? _GEN_33 : 4'h8; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_44 = _T_22 ? _GEN_31 : _GEN_39; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_50 = _T_19 ? 4'h8 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_14 ? _GEN_30 : phase; // @[Conditional.scala 40:58]
  wire [3:0] sPulseDecSig = _T_14 ? 4'h8 : _GEN_50; // @[Conditional.scala 40:58]
  wire  _T_40 = sPulseDecSig == 4'h0; // @[InputCore.scala 180:24]
  wire  _T_41 = sPulseDecSig == 4'h1; // @[InputCore.scala 180:24]
  wire  _T_42 = sPulseDecSig == 4'h2; // @[InputCore.scala 180:24]
  wire  _T_43 = sPulseDecSig == 4'h3; // @[InputCore.scala 180:24]
  wire  _T_44 = sPulseDecSig == 4'h4; // @[InputCore.scala 180:24]
  wire  _T_45 = sPulseDecSig == 4'h5; // @[InputCore.scala 180:24]
  wire  _T_46 = sPulseDecSig == 4'h6; // @[InputCore.scala 180:24]
  wire  _T_47 = sPulseDecSig == 4'h7; // @[InputCore.scala 180:24]
  wire  _GEN_68 = ~_GEN_8;
  wire  _GEN_76 = ~_GEN_18;
  BusInterface interface_ ( // @[InputCore.scala 29:26]
    .io_grant(interface__io_grant),
    .io_reqOut(interface__io_reqOut),
    .io_tx(interface__io_tx),
    .io_spikeID(interface__io_spikeID),
    .io_ready(interface__io_ready),
    .io_reqIn(interface__io_reqIn)
  );
  TransmissionSystem spikeTrans ( // @[InputCore.scala 36:26]
    .clock(spikeTrans_clock),
    .reset(spikeTrans_reset),
    .io_data(spikeTrans_io_data),
    .io_ready(spikeTrans_io_ready),
    .io_valid(spikeTrans_io_valid),
    .io_n(spikeTrans_io_n),
    .io_spikes_0(spikeTrans_io_spikes_0),
    .io_spikes_1(spikeTrans_io_spikes_1),
    .io_spikes_2(spikeTrans_io_spikes_2),
    .io_spikes_3(spikeTrans_io_spikes_3),
    .io_spikes_4(spikeTrans_io_spikes_4),
    .io_spikes_5(spikeTrans_io_spikes_5),
    .io_spikes_6(spikeTrans_io_spikes_6),
    .io_spikes_7(spikeTrans_io_spikes_7)
  );
  assign rateMem00__T_1_r_addr = rateMem00__T_1_r_addr_pipe_0;
  assign rateMem00__T_1_r_data = rateMem00[rateMem00__T_1_r_addr]; // @[InputCore.scala 63:29]
  assign rateMem00__T_1_w_data = io_offCCData[8:0];
  assign rateMem00__T_1_w_addr = phase ? io_offCCData[23:16] : pixcnt;
  assign rateMem00__T_1_w_mask = phase;
  assign rateMem00__T_1_w_en = ena0 & _GEN_8;
  assign rateMem1__T_2_r_addr = rateMem1__T_2_r_addr_pipe_0;
  assign rateMem1__T_2_r_data = rateMem1[rateMem1__T_2_r_addr]; // @[InputCore.scala 81:29]
  assign rateMem1__T_2_w_data = io_offCCData[8:0];
  assign rateMem1__T_2_w_addr = phase ? pixcnt : io_offCCData[23:16];
  assign rateMem1__T_2_w_mask = phase ? 1'h0 : 1'h1;
  assign rateMem1__T_2_w_en = ena1 & _GEN_18;
  assign io_offCCHSout = phase; // @[InputCore.scala 55:17]
  assign io_req = interface__io_reqOut; // @[InputCore.scala 31:27]
  assign io_tx = interface__io_tx; // @[InputCore.scala 32:27]
  assign interface__io_grant = io_grant; // @[InputCore.scala 30:27]
  assign interface__io_spikeID = spikeTrans_io_data; // @[InputCore.scala 37:27]
  assign interface__io_reqIn = spikeTrans_io_valid; // @[InputCore.scala 39:27]
  assign spikeTrans_clock = clock;
  assign spikeTrans_reset = reset;
  assign spikeTrans_io_ready = interface__io_ready; // @[InputCore.scala 38:27]
  assign spikeTrans_io_n = pixcntLater[7:3]; // @[InputCore.scala 186:27]
  assign spikeTrans_io_spikes_0 = spikePulse_0; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_1 = spikePulse_1; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_2 = spikePulse_2; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_3 = spikePulse_3; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_4 = spikePulse_4; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_5 = spikePulse_5; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_6 = spikePulse_6; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_7 = spikePulse_7; // @[InputCore.scala 188:29]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    rateMem00[initvar] = _RAND_0[8:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    rateMem1[initvar] = _RAND_3[8:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rateMem00__T_1_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rateMem00__T_1_r_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  rateMem1__T_2_r_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rateMem1__T_2_r_addr_pipe_0 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  ts = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  pixcnt = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  pixcntLate = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  pixcntLater = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  tsCycleCnt = _RAND_10[16:0];
  _RAND_11 = {1{`RANDOM}};
  phase = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  spikePulse_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  spikePulse_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  spikePulse_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  spikePulse_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  spikePulse_4 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  spikePulse_5 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  spikePulse_6 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  spikePulse_7 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stateReg = _RAND_20[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(rateMem00__T_1_w_en & rateMem00__T_1_w_mask) begin
      rateMem00[rateMem00__T_1_w_addr] <= rateMem00__T_1_w_data; // @[InputCore.scala 63:29]
    end
    rateMem00__T_1_r_en_pipe_0 <= ena0 & _GEN_68;
    if (ena0 & _GEN_68) begin
      if (phase) begin
        rateMem00__T_1_r_addr_pipe_0 <= io_offCCData[23:16];
      end else begin
        rateMem00__T_1_r_addr_pipe_0 <= pixcnt;
      end
    end
    if(rateMem1__T_2_w_en & rateMem1__T_2_w_mask) begin
      rateMem1[rateMem1__T_2_w_addr] <= rateMem1__T_2_w_data; // @[InputCore.scala 81:29]
    end
    rateMem1__T_2_r_en_pipe_0 <= ena1 & _GEN_76;
    if (ena1 & _GEN_76) begin
      if (phase) begin
        rateMem1__T_2_r_addr_pipe_0 <= pixcnt;
      end else begin
        rateMem1__T_2_r_addr_pipe_0 <= io_offCCData[23:16];
      end
    end
    if (reset) begin
      ts <= 9'h0;
    end else if (_T_14) begin
      ts <= 9'h0;
    end else if (!(_T_19)) begin
      if (!(_T_22)) begin
        if (_T_29) begin
          ts <= _T_31;
        end
      end
    end
    if (reset) begin
      pixcnt <= 8'h0;
    end else if (_T_14) begin
      pixcnt <= 8'h0;
    end else if (_T_19) begin
      pixcnt <= _T_21;
    end else if (_T_22) begin
      pixcnt <= _T_21;
    end else if (!(_T_29)) begin
      if (_T_38) begin
        pixcnt <= 8'h0;
      end
    end
    pixcntLate <= pixcnt;
    pixcntLater <= pixcntLate;
    if (reset) begin
      tsCycleCnt <= 17'h13880;
    end else if (_T_9) begin
      tsCycleCnt <= 17'h13880;
    end else begin
      tsCycleCnt <= _T_8;
    end
    phase <= reset | _GEN_55;
    if (reset) begin
      spikePulse_0 <= 1'h0;
    end else begin
      spikePulse_0 <= _T_40;
    end
    if (reset) begin
      spikePulse_1 <= 1'h0;
    end else begin
      spikePulse_1 <= _T_41;
    end
    if (reset) begin
      spikePulse_2 <= 1'h0;
    end else begin
      spikePulse_2 <= _T_42;
    end
    if (reset) begin
      spikePulse_3 <= 1'h0;
    end else begin
      spikePulse_3 <= _T_43;
    end
    if (reset) begin
      spikePulse_4 <= 1'h0;
    end else begin
      spikePulse_4 <= _T_44;
    end
    if (reset) begin
      spikePulse_5 <= 1'h0;
    end else begin
      spikePulse_5 <= _T_45;
    end
    if (reset) begin
      spikePulse_6 <= 1'h0;
    end else begin
      spikePulse_6 <= _T_46;
    end
    if (reset) begin
      spikePulse_7 <= 1'h0;
    end else begin
      spikePulse_7 <= _T_47;
    end
    if (reset) begin
      stateReg <= 3'h0;
    end else if (_T_14) begin
      if (_T_17) begin
        stateReg <= 3'h1;
      end
    end else if (_T_19) begin
      stateReg <= 3'h2;
    end else if (_T_22) begin
      if (_T_28) begin
        stateReg <= 3'h3;
      end
    end else if (_T_29) begin
      if (_T_37) begin
        stateReg <= 3'h0;
      end else begin
        stateReg <= 3'h4;
      end
    end else if (_T_38) begin
      if (_T_9) begin
        stateReg <= 3'h1;
      end
    end
  end
endmodule
module TransmissionSystem_1(
  input         clock,
  input         reset,
  output [10:0] io_data,
  input         io_ready,
  output        io_valid,
  input  [4:0]  io_n,
  input         io_spikes_0,
  input         io_spikes_1,
  input         io_spikes_2,
  input         io_spikes_3,
  input         io_spikes_4,
  input         io_spikes_5,
  input         io_spikes_6,
  input         io_spikes_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  spikeEncoder_io_reqs_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_7; // @[SpikeTransmission.scala 22:28]
  wire [2:0] spikeEncoder_io_value; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_valid; // @[SpikeTransmission.scala 22:28]
  reg  spikeRegs_0; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_1; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_2; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_3; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_4; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_5; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_6; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_7; // @[SpikeTransmission.scala 18:29]
  reg [4:0] neuronIdMSB_0; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_1; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_2; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_3; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_4; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_5; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_6; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_7; // @[SpikeTransmission.scala 19:29]
  reg  maskRegs_0; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_1; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_2; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_3; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_4; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_5; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_6; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_7; // @[SpikeTransmission.scala 20:29]
  wire  _T_3 = ~spikeEncoder_io_valid; // @[SpikeTransmission.scala 37:16]
  wire  _GEN_0 = _T_3 | maskRegs_0; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_1 = io_ready ? spikeEncoder_io_mask_0 : _GEN_0; // @[SpikeTransmission.scala 35:20]
  wire  _T_5 = spikeEncoder_io_rst_0 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_0 = ~_T_5; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_0 = rstReadySel_0 & spikeRegs_0; // @[SpikeTransmission.scala 44:38]
  wire  _T_8 = ~spikeUpdate_0; // @[SpikeTransmission.scala 46:10]
  wire  _T_9 = 3'h0 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_11 = {3'h1,neuronIdMSB_0,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_5 = _T_9 ? _T_11 : 11'h0; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_6 = _T_3 | maskRegs_1; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_7 = io_ready ? spikeEncoder_io_mask_1 : _GEN_6; // @[SpikeTransmission.scala 35:20]
  wire  _T_14 = spikeEncoder_io_rst_1 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_1 = ~_T_14; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_1 = rstReadySel_1 & spikeRegs_1; // @[SpikeTransmission.scala 44:38]
  wire  _T_17 = ~spikeUpdate_1; // @[SpikeTransmission.scala 46:10]
  wire  _T_18 = 3'h1 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_20 = {3'h1,neuronIdMSB_1,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_11 = _T_18 ? _T_20 : _GEN_5; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_12 = _T_3 | maskRegs_2; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_13 = io_ready ? spikeEncoder_io_mask_2 : _GEN_12; // @[SpikeTransmission.scala 35:20]
  wire  _T_23 = spikeEncoder_io_rst_2 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_2 = ~_T_23; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_2 = rstReadySel_2 & spikeRegs_2; // @[SpikeTransmission.scala 44:38]
  wire  _T_26 = ~spikeUpdate_2; // @[SpikeTransmission.scala 46:10]
  wire  _T_27 = 3'h2 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_29 = {3'h1,neuronIdMSB_2,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_17 = _T_27 ? _T_29 : _GEN_11; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_18 = _T_3 | maskRegs_3; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_19 = io_ready ? spikeEncoder_io_mask_3 : _GEN_18; // @[SpikeTransmission.scala 35:20]
  wire  _T_32 = spikeEncoder_io_rst_3 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_3 = ~_T_32; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_3 = rstReadySel_3 & spikeRegs_3; // @[SpikeTransmission.scala 44:38]
  wire  _T_35 = ~spikeUpdate_3; // @[SpikeTransmission.scala 46:10]
  wire  _T_36 = 3'h3 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_38 = {3'h1,neuronIdMSB_3,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_23 = _T_36 ? _T_38 : _GEN_17; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_24 = _T_3 | maskRegs_4; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_25 = io_ready ? spikeEncoder_io_mask_4 : _GEN_24; // @[SpikeTransmission.scala 35:20]
  wire  _T_41 = spikeEncoder_io_rst_4 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_4 = ~_T_41; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_4 = rstReadySel_4 & spikeRegs_4; // @[SpikeTransmission.scala 44:38]
  wire  _T_44 = ~spikeUpdate_4; // @[SpikeTransmission.scala 46:10]
  wire  _T_45 = 3'h4 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_47 = {3'h1,neuronIdMSB_4,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_29 = _T_45 ? _T_47 : _GEN_23; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_30 = _T_3 | maskRegs_5; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_31 = io_ready ? spikeEncoder_io_mask_5 : _GEN_30; // @[SpikeTransmission.scala 35:20]
  wire  _T_50 = spikeEncoder_io_rst_5 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_5 = ~_T_50; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_5 = rstReadySel_5 & spikeRegs_5; // @[SpikeTransmission.scala 44:38]
  wire  _T_53 = ~spikeUpdate_5; // @[SpikeTransmission.scala 46:10]
  wire  _T_54 = 3'h5 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_56 = {3'h1,neuronIdMSB_5,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_35 = _T_54 ? _T_56 : _GEN_29; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_36 = _T_3 | maskRegs_6; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_37 = io_ready ? spikeEncoder_io_mask_6 : _GEN_36; // @[SpikeTransmission.scala 35:20]
  wire  _T_59 = spikeEncoder_io_rst_6 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_6 = ~_T_59; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_6 = rstReadySel_6 & spikeRegs_6; // @[SpikeTransmission.scala 44:38]
  wire  _T_62 = ~spikeUpdate_6; // @[SpikeTransmission.scala 46:10]
  wire  _T_63 = 3'h6 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_65 = {3'h1,neuronIdMSB_6,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_41 = _T_63 ? _T_65 : _GEN_35; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_42 = _T_3 | maskRegs_7; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_43 = io_ready ? spikeEncoder_io_mask_7 : _GEN_42; // @[SpikeTransmission.scala 35:20]
  wire  _T_68 = spikeEncoder_io_rst_7 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_7 = ~_T_68; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_7 = rstReadySel_7 & spikeRegs_7; // @[SpikeTransmission.scala 44:38]
  wire  _T_71 = ~spikeUpdate_7; // @[SpikeTransmission.scala 46:10]
  wire  _T_72 = 3'h7 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_74 = {3'h1,neuronIdMSB_7,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  PriorityMaskRstEncoder spikeEncoder ( // @[SpikeTransmission.scala 22:28]
    .io_reqs_0(spikeEncoder_io_reqs_0),
    .io_reqs_1(spikeEncoder_io_reqs_1),
    .io_reqs_2(spikeEncoder_io_reqs_2),
    .io_reqs_3(spikeEncoder_io_reqs_3),
    .io_reqs_4(spikeEncoder_io_reqs_4),
    .io_reqs_5(spikeEncoder_io_reqs_5),
    .io_reqs_6(spikeEncoder_io_reqs_6),
    .io_reqs_7(spikeEncoder_io_reqs_7),
    .io_value(spikeEncoder_io_value),
    .io_mask_0(spikeEncoder_io_mask_0),
    .io_mask_1(spikeEncoder_io_mask_1),
    .io_mask_2(spikeEncoder_io_mask_2),
    .io_mask_3(spikeEncoder_io_mask_3),
    .io_mask_4(spikeEncoder_io_mask_4),
    .io_mask_5(spikeEncoder_io_mask_5),
    .io_mask_6(spikeEncoder_io_mask_6),
    .io_mask_7(spikeEncoder_io_mask_7),
    .io_rst_0(spikeEncoder_io_rst_0),
    .io_rst_1(spikeEncoder_io_rst_1),
    .io_rst_2(spikeEncoder_io_rst_2),
    .io_rst_3(spikeEncoder_io_rst_3),
    .io_rst_4(spikeEncoder_io_rst_4),
    .io_rst_5(spikeEncoder_io_rst_5),
    .io_rst_6(spikeEncoder_io_rst_6),
    .io_rst_7(spikeEncoder_io_rst_7),
    .io_valid(spikeEncoder_io_valid)
  );
  assign io_data = _T_72 ? _T_74 : _GEN_41; // @[SpikeTransmission.scala 29:12 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15]
  assign io_valid = spikeEncoder_io_valid; // @[SpikeTransmission.scala 30:12]
  assign spikeEncoder_io_reqs_0 = maskRegs_0 & spikeRegs_0; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_1 = maskRegs_1 & spikeRegs_1; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_2 = maskRegs_2 & spikeRegs_2; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_3 = maskRegs_3 & spikeRegs_3; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_4 = maskRegs_4 & spikeRegs_4; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_5 = maskRegs_5 & spikeRegs_5; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_6 = maskRegs_6 & spikeRegs_6; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_7 = maskRegs_7 & spikeRegs_7; // @[SpikeTransmission.scala 27:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  spikeRegs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  spikeRegs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  spikeRegs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  spikeRegs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  spikeRegs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  spikeRegs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  spikeRegs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  spikeRegs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  neuronIdMSB_0 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  neuronIdMSB_1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  neuronIdMSB_2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  neuronIdMSB_3 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  neuronIdMSB_4 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  neuronIdMSB_5 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  neuronIdMSB_6 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  neuronIdMSB_7 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  maskRegs_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  maskRegs_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  maskRegs_2 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  maskRegs_3 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  maskRegs_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  maskRegs_5 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  maskRegs_6 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  maskRegs_7 = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      spikeRegs_0 <= 1'h0;
    end else if (_T_8) begin
      spikeRegs_0 <= io_spikes_0;
    end
    if (reset) begin
      spikeRegs_1 <= 1'h0;
    end else if (_T_17) begin
      spikeRegs_1 <= io_spikes_1;
    end
    if (reset) begin
      spikeRegs_2 <= 1'h0;
    end else if (_T_26) begin
      spikeRegs_2 <= io_spikes_2;
    end
    if (reset) begin
      spikeRegs_3 <= 1'h0;
    end else if (_T_35) begin
      spikeRegs_3 <= io_spikes_3;
    end
    if (reset) begin
      spikeRegs_4 <= 1'h0;
    end else if (_T_44) begin
      spikeRegs_4 <= io_spikes_4;
    end
    if (reset) begin
      spikeRegs_5 <= 1'h0;
    end else if (_T_53) begin
      spikeRegs_5 <= io_spikes_5;
    end
    if (reset) begin
      spikeRegs_6 <= 1'h0;
    end else if (_T_62) begin
      spikeRegs_6 <= io_spikes_6;
    end
    if (reset) begin
      spikeRegs_7 <= 1'h0;
    end else if (_T_71) begin
      spikeRegs_7 <= io_spikes_7;
    end
    if (reset) begin
      neuronIdMSB_0 <= 5'h0;
    end else if (_T_8) begin
      neuronIdMSB_0 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_1 <= 5'h0;
    end else if (_T_17) begin
      neuronIdMSB_1 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_2 <= 5'h0;
    end else if (_T_26) begin
      neuronIdMSB_2 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_3 <= 5'h0;
    end else if (_T_35) begin
      neuronIdMSB_3 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_4 <= 5'h0;
    end else if (_T_44) begin
      neuronIdMSB_4 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_5 <= 5'h0;
    end else if (_T_53) begin
      neuronIdMSB_5 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_6 <= 5'h0;
    end else if (_T_62) begin
      neuronIdMSB_6 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_7 <= 5'h0;
    end else if (_T_71) begin
      neuronIdMSB_7 <= io_n;
    end
    maskRegs_0 <= reset | _GEN_1;
    maskRegs_1 <= reset | _GEN_7;
    maskRegs_2 <= reset | _GEN_13;
    maskRegs_3 <= reset | _GEN_19;
    maskRegs_4 <= reset | _GEN_25;
    maskRegs_5 <= reset | _GEN_31;
    maskRegs_6 <= reset | _GEN_37;
    maskRegs_7 <= reset | _GEN_43;
  end
endmodule
module InputCore_1(
  input         clock,
  input         reset,
  input  [23:0] io_offCCData,
  input         io_offCCValid,
  input         io_offCCHSin,
  output        io_offCCHSout,
  input         io_grant,
  output        io_req,
  output [10:0] io_tx
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  interface__io_grant; // @[InputCore.scala 29:26]
  wire  interface__io_reqOut; // @[InputCore.scala 29:26]
  wire [10:0] interface__io_tx; // @[InputCore.scala 29:26]
  wire [10:0] interface__io_spikeID; // @[InputCore.scala 29:26]
  wire  interface__io_ready; // @[InputCore.scala 29:26]
  wire  interface__io_reqIn; // @[InputCore.scala 29:26]
  wire  spikeTrans_clock; // @[InputCore.scala 36:26]
  wire  spikeTrans_reset; // @[InputCore.scala 36:26]
  wire [10:0] spikeTrans_io_data; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_ready; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_valid; // @[InputCore.scala 36:26]
  wire [4:0] spikeTrans_io_n; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_0; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_1; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_2; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_3; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_4; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_5; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_6; // @[InputCore.scala 36:26]
  wire  spikeTrans_io_spikes_7; // @[InputCore.scala 36:26]
  reg [8:0] rateMem01 [0:255]; // @[InputCore.scala 63:29]
  initial begin
  $readmemb("Y:/home/jacob/myDrive/test_postSynth/NeuromorphicProcessor/mapping/in1mem.mem", rateMem01);
  end
  wire [8:0] rateMem01__T_1_r_data; // @[InputCore.scala 63:29]
  wire [7:0] rateMem01__T_1_r_addr; // @[InputCore.scala 63:29]
  wire [8:0] rateMem01__T_1_w_data; // @[InputCore.scala 63:29]
  wire [7:0] rateMem01__T_1_w_addr; // @[InputCore.scala 63:29]
  wire  rateMem01__T_1_w_mask; // @[InputCore.scala 63:29]
  wire  rateMem01__T_1_w_en; // @[InputCore.scala 63:29]
  reg  rateMem01__T_1_r_en_pipe_0;
  reg [7:0] rateMem01__T_1_r_addr_pipe_0;
  reg [8:0] rateMem1 [0:255]; // @[InputCore.scala 81:29]
  initial begin
  $readmemb("Y:/home/jacob/myDrive/test_postSynth/NeuromorphicProcessor/mapping/in1mem.mem", rateMem1);
  end
  wire [8:0] rateMem1__T_2_r_data; // @[InputCore.scala 81:29]
  wire [7:0] rateMem1__T_2_r_addr; // @[InputCore.scala 81:29]
  wire [8:0] rateMem1__T_2_w_data; // @[InputCore.scala 81:29]
  wire [7:0] rateMem1__T_2_w_addr; // @[InputCore.scala 81:29]
  wire  rateMem1__T_2_w_mask; // @[InputCore.scala 81:29]
  wire  rateMem1__T_2_w_en; // @[InputCore.scala 81:29]
  reg  rateMem1__T_2_r_en_pipe_0;
  reg [7:0] rateMem1__T_2_r_addr_pipe_0;
  reg [8:0] ts; // @[InputCore.scala 42:29]
  reg [7:0] pixcnt; // @[InputCore.scala 43:29]
  reg [7:0] pixcntLate; // @[InputCore.scala 44:29]
  reg [7:0] pixcntLater; // @[InputCore.scala 45:29]
  reg [16:0] tsCycleCnt; // @[InputCore.scala 46:29]
  reg  phase; // @[InputCore.scala 47:29]
  reg  spikePulse_0; // @[InputCore.scala 50:29]
  reg  spikePulse_1; // @[InputCore.scala 50:29]
  reg  spikePulse_2; // @[InputCore.scala 50:29]
  reg  spikePulse_3; // @[InputCore.scala 50:29]
  reg  spikePulse_4; // @[InputCore.scala 50:29]
  reg  spikePulse_5; // @[InputCore.scala 50:29]
  reg  spikePulse_6; // @[InputCore.scala 50:29]
  reg  spikePulse_7; // @[InputCore.scala 50:29]
  reg [2:0] stateReg; // @[InputCore.scala 52:29]
  wire [8:0] rdata0 = rateMem01__T_1_r_data; // @[InputCore.scala 69:15]
  wire  _T_14 = 3'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_19 = 3'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_22 = 3'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _GEN_47 = _T_19 | _T_22; // @[Conditional.scala 39:67]
  wire  cntrEna = _T_14 ? 1'h0 : _GEN_47; // @[Conditional.scala 40:58]
  wire  ena0 = phase ? io_offCCValid : cntrEna; // @[InputCore.scala 97:16]
  wire  _GEN_8 = ena0 & phase; // @[InputCore.scala 67:14]
  wire  wr1 = phase ? 1'h0 : 1'h1; // @[InputCore.scala 97:16]
  wire [8:0] rdata1 = rateMem1__T_2_r_data; // @[InputCore.scala 86:15]
  wire  ena1 = phase ? cntrEna : io_offCCValid; // @[InputCore.scala 97:16]
  wire  _GEN_18 = ena1 & wr1; // @[InputCore.scala 84:14]
  wire [8:0] cntrRateData = phase ? rdata1 : rdata0; // @[InputCore.scala 97:16]
  wire [16:0] _T_8 = tsCycleCnt - 17'h1; // @[InputCore.scala 118:28]
  wire  _T_9 = tsCycleCnt == 17'h0; // @[InputCore.scala 119:19]
  wire  _T_10 = ts == 9'h0; // @[InputCore.scala 125:11]
  wire  _T_11 = cntrRateData == 9'h0; // @[InputCore.scala 125:35]
  wire  _T_12 = _T_10 | _T_11; // @[InputCore.scala 125:19]
  wire [8:0] _GEN_0 = ts % cntrRateData; // @[InputCore.scala 128:18]
  wire [8:0] _T_13 = _GEN_0[8:0]; // @[InputCore.scala 128:18]
  wire [8:0] modRes = _T_12 ? 9'h1 : _T_13; // @[InputCore.scala 125:43]
  wire  _T_15 = io_offCCHSin != phase; // @[InputCore.scala 135:25]
  wire  _T_17 = _T_15 & _T_9; // @[InputCore.scala 135:35]
  wire  _T_18 = ~phase; // @[InputCore.scala 137:18]
  wire  _GEN_30 = _T_17 ? _T_18 : phase; // @[InputCore.scala 135:58]
  wire [7:0] _T_21 = pixcnt + 8'h1; // @[InputCore.scala 142:24]
  wire  _T_25 = modRes == 9'h0; // @[InputCore.scala 148:19]
  wire [3:0] _T_27 = {1'h0,pixcntLate[2:0]}; // @[InputCore.scala 149:34]
  wire [3:0] _GEN_31 = _T_25 ? _T_27 : 4'h8; // @[InputCore.scala 148:27]
  wire  _T_28 = pixcnt == 8'hff; // @[InputCore.scala 152:19]
  wire  _T_29 = 3'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [8:0] _T_31 = ts + 9'h1; // @[InputCore.scala 158:16]
  wire  _T_32 = cntrRateData != 9'h0; // @[InputCore.scala 159:25]
  wire  _T_34 = _T_32 & _T_25; // @[InputCore.scala 159:33]
  wire [3:0] _GEN_33 = _T_34 ? _T_27 : 4'h8; // @[InputCore.scala 159:51]
  wire  _T_37 = ts == 9'h1f3; // @[InputCore.scala 163:15]
  wire  _T_38 = 3'h4 == stateReg; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_39 = _T_29 ? _GEN_33 : 4'h8; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_44 = _T_22 ? _GEN_31 : _GEN_39; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_50 = _T_19 ? 4'h8 : _GEN_44; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_14 ? _GEN_30 : phase; // @[Conditional.scala 40:58]
  wire [3:0] sPulseDecSig = _T_14 ? 4'h8 : _GEN_50; // @[Conditional.scala 40:58]
  wire  _T_40 = sPulseDecSig == 4'h0; // @[InputCore.scala 180:24]
  wire  _T_41 = sPulseDecSig == 4'h1; // @[InputCore.scala 180:24]
  wire  _T_42 = sPulseDecSig == 4'h2; // @[InputCore.scala 180:24]
  wire  _T_43 = sPulseDecSig == 4'h3; // @[InputCore.scala 180:24]
  wire  _T_44 = sPulseDecSig == 4'h4; // @[InputCore.scala 180:24]
  wire  _T_45 = sPulseDecSig == 4'h5; // @[InputCore.scala 180:24]
  wire  _T_46 = sPulseDecSig == 4'h6; // @[InputCore.scala 180:24]
  wire  _T_47 = sPulseDecSig == 4'h7; // @[InputCore.scala 180:24]
  wire  _GEN_68 = ~_GEN_8;
  wire  _GEN_76 = ~_GEN_18;
  BusInterface interface_ ( // @[InputCore.scala 29:26]
    .io_grant(interface__io_grant),
    .io_reqOut(interface__io_reqOut),
    .io_tx(interface__io_tx),
    .io_spikeID(interface__io_spikeID),
    .io_ready(interface__io_ready),
    .io_reqIn(interface__io_reqIn)
  );
  TransmissionSystem_1 spikeTrans ( // @[InputCore.scala 36:26]
    .clock(spikeTrans_clock),
    .reset(spikeTrans_reset),
    .io_data(spikeTrans_io_data),
    .io_ready(spikeTrans_io_ready),
    .io_valid(spikeTrans_io_valid),
    .io_n(spikeTrans_io_n),
    .io_spikes_0(spikeTrans_io_spikes_0),
    .io_spikes_1(spikeTrans_io_spikes_1),
    .io_spikes_2(spikeTrans_io_spikes_2),
    .io_spikes_3(spikeTrans_io_spikes_3),
    .io_spikes_4(spikeTrans_io_spikes_4),
    .io_spikes_5(spikeTrans_io_spikes_5),
    .io_spikes_6(spikeTrans_io_spikes_6),
    .io_spikes_7(spikeTrans_io_spikes_7)
  );
  assign rateMem01__T_1_r_addr = rateMem01__T_1_r_addr_pipe_0;
  assign rateMem01__T_1_r_data = rateMem01[rateMem01__T_1_r_addr]; // @[InputCore.scala 63:29]
  assign rateMem01__T_1_w_data = io_offCCData[8:0];
  assign rateMem01__T_1_w_addr = phase ? io_offCCData[23:16] : pixcnt;
  assign rateMem01__T_1_w_mask = phase;
  assign rateMem01__T_1_w_en = ena0 & _GEN_8;
  assign rateMem1__T_2_r_addr = rateMem1__T_2_r_addr_pipe_0;
  assign rateMem1__T_2_r_data = rateMem1[rateMem1__T_2_r_addr]; // @[InputCore.scala 81:29]
  assign rateMem1__T_2_w_data = io_offCCData[8:0];
  assign rateMem1__T_2_w_addr = phase ? pixcnt : io_offCCData[23:16];
  assign rateMem1__T_2_w_mask = phase ? 1'h0 : 1'h1;
  assign rateMem1__T_2_w_en = ena1 & _GEN_18;
  assign io_offCCHSout = phase; // @[InputCore.scala 55:17]
  assign io_req = interface__io_reqOut; // @[InputCore.scala 31:27]
  assign io_tx = interface__io_tx; // @[InputCore.scala 32:27]
  assign interface__io_grant = io_grant; // @[InputCore.scala 30:27]
  assign interface__io_spikeID = spikeTrans_io_data; // @[InputCore.scala 37:27]
  assign interface__io_reqIn = spikeTrans_io_valid; // @[InputCore.scala 39:27]
  assign spikeTrans_clock = clock;
  assign spikeTrans_reset = reset;
  assign spikeTrans_io_ready = interface__io_ready; // @[InputCore.scala 38:27]
  assign spikeTrans_io_n = pixcntLater[7:3]; // @[InputCore.scala 186:27]
  assign spikeTrans_io_spikes_0 = spikePulse_0; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_1 = spikePulse_1; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_2 = spikePulse_2; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_3 = spikePulse_3; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_4 = spikePulse_4; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_5 = spikePulse_5; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_6 = spikePulse_6; // @[InputCore.scala 188:29]
  assign spikeTrans_io_spikes_7 = spikePulse_7; // @[InputCore.scala 188:29]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    rateMem01[initvar] = _RAND_0[8:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    rateMem1[initvar] = _RAND_3[8:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rateMem01__T_1_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rateMem01__T_1_r_addr_pipe_0 = _RAND_2[7:0];
  _RAND_4 = {1{`RANDOM}};
  rateMem1__T_2_r_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  rateMem1__T_2_r_addr_pipe_0 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  ts = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  pixcnt = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  pixcntLate = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  pixcntLater = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  tsCycleCnt = _RAND_10[16:0];
  _RAND_11 = {1{`RANDOM}};
  phase = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  spikePulse_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  spikePulse_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  spikePulse_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  spikePulse_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  spikePulse_4 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  spikePulse_5 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  spikePulse_6 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  spikePulse_7 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  stateReg = _RAND_20[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(rateMem01__T_1_w_en & rateMem01__T_1_w_mask) begin
      rateMem01[rateMem01__T_1_w_addr] <= rateMem01__T_1_w_data; // @[InputCore.scala 63:29]
    end
    rateMem01__T_1_r_en_pipe_0 <= ena0 & _GEN_68;
    if (ena0 & _GEN_68) begin
      if (phase) begin
        rateMem01__T_1_r_addr_pipe_0 <= io_offCCData[23:16];
      end else begin
        rateMem01__T_1_r_addr_pipe_0 <= pixcnt;
      end
    end
    if(rateMem1__T_2_w_en & rateMem1__T_2_w_mask) begin
      rateMem1[rateMem1__T_2_w_addr] <= rateMem1__T_2_w_data; // @[InputCore.scala 81:29]
    end
    rateMem1__T_2_r_en_pipe_0 <= ena1 & _GEN_76;
    if (ena1 & _GEN_76) begin
      if (phase) begin
        rateMem1__T_2_r_addr_pipe_0 <= pixcnt;
      end else begin
        rateMem1__T_2_r_addr_pipe_0 <= io_offCCData[23:16];
      end
    end
    if (reset) begin
      ts <= 9'h0;
    end else if (_T_14) begin
      ts <= 9'h0;
    end else if (!(_T_19)) begin
      if (!(_T_22)) begin
        if (_T_29) begin
          ts <= _T_31;
        end
      end
    end
    if (reset) begin
      pixcnt <= 8'h0;
    end else if (_T_14) begin
      pixcnt <= 8'h0;
    end else if (_T_19) begin
      pixcnt <= _T_21;
    end else if (_T_22) begin
      pixcnt <= _T_21;
    end else if (!(_T_29)) begin
      if (_T_38) begin
        pixcnt <= 8'h0;
      end
    end
    pixcntLate <= pixcnt;
    pixcntLater <= pixcntLate;
    if (reset) begin
      tsCycleCnt <= 17'h13880;
    end else if (_T_9) begin
      tsCycleCnt <= 17'h13880;
    end else begin
      tsCycleCnt <= _T_8;
    end
    phase <= reset | _GEN_55;
    if (reset) begin
      spikePulse_0 <= 1'h0;
    end else begin
      spikePulse_0 <= _T_40;
    end
    if (reset) begin
      spikePulse_1 <= 1'h0;
    end else begin
      spikePulse_1 <= _T_41;
    end
    if (reset) begin
      spikePulse_2 <= 1'h0;
    end else begin
      spikePulse_2 <= _T_42;
    end
    if (reset) begin
      spikePulse_3 <= 1'h0;
    end else begin
      spikePulse_3 <= _T_43;
    end
    if (reset) begin
      spikePulse_4 <= 1'h0;
    end else begin
      spikePulse_4 <= _T_44;
    end
    if (reset) begin
      spikePulse_5 <= 1'h0;
    end else begin
      spikePulse_5 <= _T_45;
    end
    if (reset) begin
      spikePulse_6 <= 1'h0;
    end else begin
      spikePulse_6 <= _T_46;
    end
    if (reset) begin
      spikePulse_7 <= 1'h0;
    end else begin
      spikePulse_7 <= _T_47;
    end
    if (reset) begin
      stateReg <= 3'h0;
    end else if (_T_14) begin
      if (_T_17) begin
        stateReg <= 3'h1;
      end
    end else if (_T_19) begin
      stateReg <= 3'h2;
    end else if (_T_22) begin
      if (_T_28) begin
        stateReg <= 3'h3;
      end
    end else if (_T_29) begin
      if (_T_37) begin
        stateReg <= 3'h0;
      end else begin
        stateReg <= 3'h4;
      end
    end else if (_T_38) begin
      if (_T_9) begin
        stateReg <= 3'h1;
      end
    end
  end
endmodule
module BusInterface_2(
  input         clock,
  input         reset,
  input         io_grant,
  output        io_reqOut,
  output [10:0] io_tx,
  input  [10:0] io_rx,
  output [9:0]  io_axonID,
  output        io_valid,
  input  [10:0] io_spikeID,
  output        io_ready,
  input         io_reqIn
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  _T = ~io_grant; // @[BusInterface.scala 28:28]
  reg [2:0] synROMReg; // @[BusInterface.scala 38:27]
  reg [7:0] axonIDLSB; // @[BusInterface.scala 41:27]
  wire  enaROM = |io_rx; // @[BusInterface.scala 43:22]
  assign io_reqOut = io_reqIn & _T; // @[BusInterface.scala 28:13]
  assign io_tx = io_grant ? io_spikeID : 11'h0; // @[BusInterface.scala 23:9 BusInterface.scala 25:11]
  assign io_axonID = {synROMReg[1:0],axonIDLSB}; // @[BusInterface.scala 52:13]
  assign io_valid = synROMReg[2]; // @[BusInterface.scala 51:13]
  assign io_ready = io_grant; // @[BusInterface.scala 29:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  synROMReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  axonIDLSB = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      synROMReg <= 3'h0;
    end else if (enaROM) begin
      if (3'h4 == io_rx[10:8]) begin
        synROMReg <= 3'h0;
      end else if (3'h3 == io_rx[10:8]) begin
        synROMReg <= 3'h6;
      end else if (3'h2 == io_rx[10:8]) begin
        synROMReg <= 3'h0;
      end else if (3'h1 == io_rx[10:8]) begin
        synROMReg <= 3'h5;
      end else begin
        synROMReg <= 3'h4;
      end
    end else begin
      synROMReg <= 3'h0;
    end
    if (reset) begin
      axonIDLSB <= 8'h0;
    end else begin
      axonIDLSB <= io_rx[7:0];
    end
  end
endmodule
module AxonSystem(
  input        clock,
  input        reset,
  input  [9:0] io_axonIn,
  input        io_axonValid,
  input        io_inOut,
  output [9:0] io_spikeCnt,
  input  [9:0] io_rAddr,
  input        io_rEna,
  output [9:0] io_rData
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] axonMem0 [0:1023]; // @[AxonSystem.scala 30:29]
  wire [9:0] axonMem0__T_r_data; // @[AxonSystem.scala 30:29]
  wire [9:0] axonMem0__T_r_addr; // @[AxonSystem.scala 30:29]
  wire [9:0] axonMem0__T_w_data; // @[AxonSystem.scala 30:29]
  wire [9:0] axonMem0__T_w_addr; // @[AxonSystem.scala 30:29]
  wire  axonMem0__T_w_mask; // @[AxonSystem.scala 30:29]
  wire  axonMem0__T_w_en; // @[AxonSystem.scala 30:29]
  reg  axonMem0__T_r_en_pipe_0;
  reg [9:0] axonMem0__T_r_addr_pipe_0;
  reg [9:0] axonMem1 [0:1023]; // @[AxonSystem.scala 47:29]
  wire [9:0] axonMem1__T_1_r_data; // @[AxonSystem.scala 47:29]
  wire [9:0] axonMem1__T_1_r_addr; // @[AxonSystem.scala 47:29]
  wire [9:0] axonMem1__T_1_w_data; // @[AxonSystem.scala 47:29]
  wire [9:0] axonMem1__T_1_w_addr; // @[AxonSystem.scala 47:29]
  wire  axonMem1__T_1_w_mask; // @[AxonSystem.scala 47:29]
  wire  axonMem1__T_1_w_en; // @[AxonSystem.scala 47:29]
  reg  axonMem1__T_1_r_en_pipe_0;
  reg [9:0] axonMem1__T_1_r_addr_pipe_0;
  reg [9:0] spikeCntReg; // @[AxonSystem.scala 20:28]
  wire  wr0 = ~io_inOut; // @[AxonSystem.scala 59:8]
  wire [9:0] rdata0 = axonMem0__T_r_data; // @[AxonSystem.scala 35:15]
  wire  ena0 = wr0 ? io_axonValid : io_rEna; // @[AxonSystem.scala 59:19]
  wire  _GEN_8 = ena0 & wr0; // @[AxonSystem.scala 33:14]
  wire  wr1 = wr0 ? 1'h0 : 1'h1; // @[AxonSystem.scala 59:19]
  wire [9:0] rdata1 = axonMem1__T_1_r_data; // @[AxonSystem.scala 52:15]
  wire  ena1 = wr0 ? io_rEna : io_axonValid; // @[AxonSystem.scala 59:19]
  wire  _GEN_18 = ena1 & wr1; // @[AxonSystem.scala 50:14]
  reg  inOutReg; // @[AxonSystem.scala 86:25]
  wire  _T_3 = inOutReg != io_inOut; // @[AxonSystem.scala 88:17]
  wire [9:0] _T_5 = spikeCntReg + 10'h1; // @[AxonSystem.scala 91:32]
  wire  _GEN_33 = ~_GEN_8;
  wire  _GEN_41 = ~_GEN_18;
  assign axonMem0__T_r_addr = axonMem0__T_r_addr_pipe_0;
  assign axonMem0__T_r_data = axonMem0[axonMem0__T_r_addr]; // @[AxonSystem.scala 30:29]
  assign axonMem0__T_w_data = wr0 ? io_axonIn : 10'h0;
  assign axonMem0__T_w_addr = wr0 ? spikeCntReg : io_rAddr;
  assign axonMem0__T_w_mask = ~io_inOut;
  assign axonMem0__T_w_en = ena0 & _GEN_8;
  assign axonMem1__T_1_r_addr = axonMem1__T_1_r_addr_pipe_0;
  assign axonMem1__T_1_r_data = axonMem1[axonMem1__T_1_r_addr]; // @[AxonSystem.scala 47:29]
  assign axonMem1__T_1_w_data = wr0 ? 10'h0 : io_axonIn;
  assign axonMem1__T_1_w_addr = wr0 ? io_rAddr : spikeCntReg;
  assign axonMem1__T_1_w_mask = wr0 ? 1'h0 : 1'h1;
  assign axonMem1__T_1_w_en = ena1 & _GEN_18;
  assign io_spikeCnt = spikeCntReg; // @[AxonSystem.scala 22:15]
  assign io_rData = wr0 ? rdata1 : rdata0; // @[AxonSystem.scala 67:14 AxonSystem.scala 73:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    axonMem0[initvar] = _RAND_0[9:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    axonMem1[initvar] = _RAND_3[9:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  axonMem0__T_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  axonMem0__T_r_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  axonMem1__T_1_r_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  axonMem1__T_1_r_addr_pipe_0 = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  spikeCntReg = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  inOutReg = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(axonMem0__T_w_en & axonMem0__T_w_mask) begin
      axonMem0[axonMem0__T_w_addr] <= axonMem0__T_w_data; // @[AxonSystem.scala 30:29]
    end
    axonMem0__T_r_en_pipe_0 <= ena0 & _GEN_33;
    if (ena0 & _GEN_33) begin
      if (wr0) begin
        axonMem0__T_r_addr_pipe_0 <= spikeCntReg;
      end else begin
        axonMem0__T_r_addr_pipe_0 <= io_rAddr;
      end
    end
    if(axonMem1__T_1_w_en & axonMem1__T_1_w_mask) begin
      axonMem1[axonMem1__T_1_w_addr] <= axonMem1__T_1_w_data; // @[AxonSystem.scala 47:29]
    end
    axonMem1__T_1_r_en_pipe_0 <= ena1 & _GEN_41;
    if (ena1 & _GEN_41) begin
      if (wr0) begin
        axonMem1__T_1_r_addr_pipe_0 <= io_rAddr;
      end else begin
        axonMem1__T_1_r_addr_pipe_0 <= spikeCntReg;
      end
    end
    if (reset) begin
      spikeCntReg <= 10'h0;
    end else if (_T_3) begin
      spikeCntReg <= 10'h0;
    end else if (io_axonValid) begin
      spikeCntReg <= _T_5;
    end
    inOutReg <= io_inOut;
  end
endmodule
module TransmissionSystem_2(
  input         clock,
  input         reset,
  output [10:0] io_data,
  input         io_ready,
  output        io_valid,
  input  [4:0]  io_n,
  input         io_spikes_0,
  input         io_spikes_1,
  input         io_spikes_2,
  input         io_spikes_3,
  input         io_spikes_4,
  input         io_spikes_5,
  input         io_spikes_6,
  input         io_spikes_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  spikeEncoder_io_reqs_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_7; // @[SpikeTransmission.scala 22:28]
  wire [2:0] spikeEncoder_io_value; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_valid; // @[SpikeTransmission.scala 22:28]
  reg  spikeRegs_0; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_1; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_2; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_3; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_4; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_5; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_6; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_7; // @[SpikeTransmission.scala 18:29]
  reg [4:0] neuronIdMSB_0; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_1; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_2; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_3; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_4; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_5; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_6; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_7; // @[SpikeTransmission.scala 19:29]
  reg  maskRegs_0; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_1; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_2; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_3; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_4; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_5; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_6; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_7; // @[SpikeTransmission.scala 20:29]
  wire  _T_3 = ~spikeEncoder_io_valid; // @[SpikeTransmission.scala 37:16]
  wire  _GEN_0 = _T_3 | maskRegs_0; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_1 = io_ready ? spikeEncoder_io_mask_0 : _GEN_0; // @[SpikeTransmission.scala 35:20]
  wire  _T_5 = spikeEncoder_io_rst_0 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_0 = ~_T_5; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_0 = rstReadySel_0 & spikeRegs_0; // @[SpikeTransmission.scala 44:38]
  wire  _T_8 = ~spikeUpdate_0; // @[SpikeTransmission.scala 46:10]
  wire  _T_9 = 3'h0 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_11 = {3'h2,neuronIdMSB_0,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_5 = _T_9 ? _T_11 : 11'h0; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_6 = _T_3 | maskRegs_1; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_7 = io_ready ? spikeEncoder_io_mask_1 : _GEN_6; // @[SpikeTransmission.scala 35:20]
  wire  _T_14 = spikeEncoder_io_rst_1 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_1 = ~_T_14; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_1 = rstReadySel_1 & spikeRegs_1; // @[SpikeTransmission.scala 44:38]
  wire  _T_17 = ~spikeUpdate_1; // @[SpikeTransmission.scala 46:10]
  wire  _T_18 = 3'h1 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_20 = {3'h2,neuronIdMSB_1,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_11 = _T_18 ? _T_20 : _GEN_5; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_12 = _T_3 | maskRegs_2; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_13 = io_ready ? spikeEncoder_io_mask_2 : _GEN_12; // @[SpikeTransmission.scala 35:20]
  wire  _T_23 = spikeEncoder_io_rst_2 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_2 = ~_T_23; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_2 = rstReadySel_2 & spikeRegs_2; // @[SpikeTransmission.scala 44:38]
  wire  _T_26 = ~spikeUpdate_2; // @[SpikeTransmission.scala 46:10]
  wire  _T_27 = 3'h2 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_29 = {3'h2,neuronIdMSB_2,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_17 = _T_27 ? _T_29 : _GEN_11; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_18 = _T_3 | maskRegs_3; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_19 = io_ready ? spikeEncoder_io_mask_3 : _GEN_18; // @[SpikeTransmission.scala 35:20]
  wire  _T_32 = spikeEncoder_io_rst_3 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_3 = ~_T_32; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_3 = rstReadySel_3 & spikeRegs_3; // @[SpikeTransmission.scala 44:38]
  wire  _T_35 = ~spikeUpdate_3; // @[SpikeTransmission.scala 46:10]
  wire  _T_36 = 3'h3 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_38 = {3'h2,neuronIdMSB_3,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_23 = _T_36 ? _T_38 : _GEN_17; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_24 = _T_3 | maskRegs_4; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_25 = io_ready ? spikeEncoder_io_mask_4 : _GEN_24; // @[SpikeTransmission.scala 35:20]
  wire  _T_41 = spikeEncoder_io_rst_4 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_4 = ~_T_41; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_4 = rstReadySel_4 & spikeRegs_4; // @[SpikeTransmission.scala 44:38]
  wire  _T_44 = ~spikeUpdate_4; // @[SpikeTransmission.scala 46:10]
  wire  _T_45 = 3'h4 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_47 = {3'h2,neuronIdMSB_4,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_29 = _T_45 ? _T_47 : _GEN_23; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_30 = _T_3 | maskRegs_5; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_31 = io_ready ? spikeEncoder_io_mask_5 : _GEN_30; // @[SpikeTransmission.scala 35:20]
  wire  _T_50 = spikeEncoder_io_rst_5 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_5 = ~_T_50; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_5 = rstReadySel_5 & spikeRegs_5; // @[SpikeTransmission.scala 44:38]
  wire  _T_53 = ~spikeUpdate_5; // @[SpikeTransmission.scala 46:10]
  wire  _T_54 = 3'h5 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_56 = {3'h2,neuronIdMSB_5,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_35 = _T_54 ? _T_56 : _GEN_29; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_36 = _T_3 | maskRegs_6; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_37 = io_ready ? spikeEncoder_io_mask_6 : _GEN_36; // @[SpikeTransmission.scala 35:20]
  wire  _T_59 = spikeEncoder_io_rst_6 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_6 = ~_T_59; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_6 = rstReadySel_6 & spikeRegs_6; // @[SpikeTransmission.scala 44:38]
  wire  _T_62 = ~spikeUpdate_6; // @[SpikeTransmission.scala 46:10]
  wire  _T_63 = 3'h6 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_65 = {3'h2,neuronIdMSB_6,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_41 = _T_63 ? _T_65 : _GEN_35; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_42 = _T_3 | maskRegs_7; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_43 = io_ready ? spikeEncoder_io_mask_7 : _GEN_42; // @[SpikeTransmission.scala 35:20]
  wire  _T_68 = spikeEncoder_io_rst_7 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_7 = ~_T_68; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_7 = rstReadySel_7 & spikeRegs_7; // @[SpikeTransmission.scala 44:38]
  wire  _T_71 = ~spikeUpdate_7; // @[SpikeTransmission.scala 46:10]
  wire  _T_72 = 3'h7 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_74 = {3'h2,neuronIdMSB_7,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  PriorityMaskRstEncoder spikeEncoder ( // @[SpikeTransmission.scala 22:28]
    .io_reqs_0(spikeEncoder_io_reqs_0),
    .io_reqs_1(spikeEncoder_io_reqs_1),
    .io_reqs_2(spikeEncoder_io_reqs_2),
    .io_reqs_3(spikeEncoder_io_reqs_3),
    .io_reqs_4(spikeEncoder_io_reqs_4),
    .io_reqs_5(spikeEncoder_io_reqs_5),
    .io_reqs_6(spikeEncoder_io_reqs_6),
    .io_reqs_7(spikeEncoder_io_reqs_7),
    .io_value(spikeEncoder_io_value),
    .io_mask_0(spikeEncoder_io_mask_0),
    .io_mask_1(spikeEncoder_io_mask_1),
    .io_mask_2(spikeEncoder_io_mask_2),
    .io_mask_3(spikeEncoder_io_mask_3),
    .io_mask_4(spikeEncoder_io_mask_4),
    .io_mask_5(spikeEncoder_io_mask_5),
    .io_mask_6(spikeEncoder_io_mask_6),
    .io_mask_7(spikeEncoder_io_mask_7),
    .io_rst_0(spikeEncoder_io_rst_0),
    .io_rst_1(spikeEncoder_io_rst_1),
    .io_rst_2(spikeEncoder_io_rst_2),
    .io_rst_3(spikeEncoder_io_rst_3),
    .io_rst_4(spikeEncoder_io_rst_4),
    .io_rst_5(spikeEncoder_io_rst_5),
    .io_rst_6(spikeEncoder_io_rst_6),
    .io_rst_7(spikeEncoder_io_rst_7),
    .io_valid(spikeEncoder_io_valid)
  );
  assign io_data = _T_72 ? _T_74 : _GEN_41; // @[SpikeTransmission.scala 29:12 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15]
  assign io_valid = spikeEncoder_io_valid; // @[SpikeTransmission.scala 30:12]
  assign spikeEncoder_io_reqs_0 = maskRegs_0 & spikeRegs_0; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_1 = maskRegs_1 & spikeRegs_1; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_2 = maskRegs_2 & spikeRegs_2; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_3 = maskRegs_3 & spikeRegs_3; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_4 = maskRegs_4 & spikeRegs_4; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_5 = maskRegs_5 & spikeRegs_5; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_6 = maskRegs_6 & spikeRegs_6; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_7 = maskRegs_7 & spikeRegs_7; // @[SpikeTransmission.scala 27:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  spikeRegs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  spikeRegs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  spikeRegs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  spikeRegs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  spikeRegs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  spikeRegs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  spikeRegs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  spikeRegs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  neuronIdMSB_0 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  neuronIdMSB_1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  neuronIdMSB_2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  neuronIdMSB_3 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  neuronIdMSB_4 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  neuronIdMSB_5 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  neuronIdMSB_6 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  neuronIdMSB_7 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  maskRegs_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  maskRegs_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  maskRegs_2 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  maskRegs_3 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  maskRegs_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  maskRegs_5 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  maskRegs_6 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  maskRegs_7 = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      spikeRegs_0 <= 1'h0;
    end else if (_T_8) begin
      spikeRegs_0 <= io_spikes_0;
    end
    if (reset) begin
      spikeRegs_1 <= 1'h0;
    end else if (_T_17) begin
      spikeRegs_1 <= io_spikes_1;
    end
    if (reset) begin
      spikeRegs_2 <= 1'h0;
    end else if (_T_26) begin
      spikeRegs_2 <= io_spikes_2;
    end
    if (reset) begin
      spikeRegs_3 <= 1'h0;
    end else if (_T_35) begin
      spikeRegs_3 <= io_spikes_3;
    end
    if (reset) begin
      spikeRegs_4 <= 1'h0;
    end else if (_T_44) begin
      spikeRegs_4 <= io_spikes_4;
    end
    if (reset) begin
      spikeRegs_5 <= 1'h0;
    end else if (_T_53) begin
      spikeRegs_5 <= io_spikes_5;
    end
    if (reset) begin
      spikeRegs_6 <= 1'h0;
    end else if (_T_62) begin
      spikeRegs_6 <= io_spikes_6;
    end
    if (reset) begin
      spikeRegs_7 <= 1'h0;
    end else if (_T_71) begin
      spikeRegs_7 <= io_spikes_7;
    end
    if (reset) begin
      neuronIdMSB_0 <= 5'h0;
    end else if (_T_8) begin
      neuronIdMSB_0 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_1 <= 5'h0;
    end else if (_T_17) begin
      neuronIdMSB_1 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_2 <= 5'h0;
    end else if (_T_26) begin
      neuronIdMSB_2 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_3 <= 5'h0;
    end else if (_T_35) begin
      neuronIdMSB_3 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_4 <= 5'h0;
    end else if (_T_44) begin
      neuronIdMSB_4 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_5 <= 5'h0;
    end else if (_T_53) begin
      neuronIdMSB_5 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_6 <= 5'h0;
    end else if (_T_62) begin
      neuronIdMSB_6 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_7 <= 5'h0;
    end else if (_T_71) begin
      neuronIdMSB_7 <= io_n;
    end
    maskRegs_0 <= reset | _GEN_1;
    maskRegs_1 <= reset | _GEN_7;
    maskRegs_2 <= reset | _GEN_13;
    maskRegs_3 <= reset | _GEN_19;
    maskRegs_4 <= reset | _GEN_25;
    maskRegs_5 <= reset | _GEN_31;
    maskRegs_6 <= reset | _GEN_37;
    maskRegs_7 <= reset | _GEN_43;
  end
endmodule
module Neurons(
  input        clock,
  output       io_inOut,
  input  [9:0] io_spikeCnt,
  output [9:0] io_aAddr,
  output       io_aEna,
  input  [9:0] io_aData,
  output [4:0] io_n,
  output       io_spikes_0,
  output       io_spikes_1,
  output       io_spikes_2,
  output       io_spikes_3,
  output       io_spikes_4,
  output       io_spikes_5,
  output       io_spikes_6,
  output       io_spikes_7
);
  wire  newBlock_clock; // @[Neurons.scala 50:24]
  wire  newBlock_reset; // @[Neurons.scala 50:24]
  wire  newBlock_io_inOut; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_spikeCnt; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_aAddr; // @[Neurons.scala 50:24]
  wire  newBlock_io_aEna; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_aData; // @[Neurons.scala 50:24]
  wire [4:0] newBlock_io_n; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_0; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_1; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_2; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_3; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_4; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_5; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_6; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_7; // @[Neurons.scala 50:24]
  neuron_top #(.io_coreID(2)) newBlock ( // @[Neurons.scala 50:24]
    .clock(newBlock_clock),
    .reset(newBlock_reset),
    .io_inOut(newBlock_io_inOut),
    .io_spikeCnt(newBlock_io_spikeCnt),
    .io_aAddr(newBlock_io_aAddr),
    .io_aEna(newBlock_io_aEna),
    .io_aData(newBlock_io_aData),
    .io_n(newBlock_io_n),
    .io_spikes_0(newBlock_io_spikes_0),
    .io_spikes_1(newBlock_io_spikes_1),
    .io_spikes_2(newBlock_io_spikes_2),
    .io_spikes_3(newBlock_io_spikes_3),
    .io_spikes_4(newBlock_io_spikes_4),
    .io_spikes_5(newBlock_io_spikes_5),
    .io_spikes_6(newBlock_io_spikes_6),
    .io_spikes_7(newBlock_io_spikes_7)
  );
  assign io_inOut = newBlock_io_inOut; // @[Neurons.scala 53:27]
  assign io_aAddr = newBlock_io_aAddr; // @[Neurons.scala 55:27]
  assign io_aEna = newBlock_io_aEna; // @[Neurons.scala 56:27]
  assign io_n = newBlock_io_n; // @[Neurons.scala 59:27]
  assign io_spikes_0 = newBlock_io_spikes_0; // @[Neurons.scala 60:16]
  assign io_spikes_1 = newBlock_io_spikes_1; // @[Neurons.scala 61:16]
  assign io_spikes_2 = newBlock_io_spikes_2; // @[Neurons.scala 62:16]
  assign io_spikes_3 = newBlock_io_spikes_3; // @[Neurons.scala 63:16]
  assign io_spikes_4 = newBlock_io_spikes_4; // @[Neurons.scala 64:16]
  assign io_spikes_5 = newBlock_io_spikes_5; // @[Neurons.scala 65:16]
  assign io_spikes_6 = newBlock_io_spikes_6; // @[Neurons.scala 66:16]
  assign io_spikes_7 = newBlock_io_spikes_7; // @[Neurons.scala 67:16]
  assign newBlock_clock = clock; // @[Neurons.scala 51:27]
  assign newBlock_reset = 1'h0;
  assign newBlock_io_spikeCnt = io_spikeCnt; // @[Neurons.scala 54:27]
  assign newBlock_io_aData = io_aData; // @[Neurons.scala 57:27]
endmodule
module NeuronCore(
  input         clock,
  input         reset,
  input         io_grant,
  output        io_req,
  output [10:0] io_tx,
  input  [10:0] io_rx
);
  wire  interface__clock; // @[NeuronCore.scala 14:26]
  wire  interface__reset; // @[NeuronCore.scala 14:26]
  wire  interface__io_grant; // @[NeuronCore.scala 14:26]
  wire  interface__io_reqOut; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_tx; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_rx; // @[NeuronCore.scala 14:26]
  wire [9:0] interface__io_axonID; // @[NeuronCore.scala 14:26]
  wire  interface__io_valid; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_spikeID; // @[NeuronCore.scala 14:26]
  wire  interface__io_ready; // @[NeuronCore.scala 14:26]
  wire  interface__io_reqIn; // @[NeuronCore.scala 14:26]
  wire  axonSystem_clock; // @[NeuronCore.scala 15:26]
  wire  axonSystem_reset; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_axonIn; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_axonValid; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_inOut; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_spikeCnt; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_rAddr; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_rEna; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_rData; // @[NeuronCore.scala 15:26]
  wire  spikeTrans_clock; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_reset; // @[NeuronCore.scala 16:26]
  wire [10:0] spikeTrans_io_data; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_ready; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_valid; // @[NeuronCore.scala 16:26]
  wire [4:0] spikeTrans_io_n; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_0; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_1; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_2; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_3; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_4; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_5; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_6; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_7; // @[NeuronCore.scala 16:26]
  wire  neurons_clock; // @[NeuronCore.scala 17:26]
  wire  neurons_io_inOut; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_spikeCnt; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_aAddr; // @[NeuronCore.scala 17:26]
  wire  neurons_io_aEna; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_aData; // @[NeuronCore.scala 17:26]
  wire [4:0] neurons_io_n; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_0; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_1; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_2; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_3; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_4; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_5; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_6; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_7; // @[NeuronCore.scala 17:26]
  BusInterface_2 interface_ ( // @[NeuronCore.scala 14:26]
    .clock(interface__clock),
    .reset(interface__reset),
    .io_grant(interface__io_grant),
    .io_reqOut(interface__io_reqOut),
    .io_tx(interface__io_tx),
    .io_rx(interface__io_rx),
    .io_axonID(interface__io_axonID),
    .io_valid(interface__io_valid),
    .io_spikeID(interface__io_spikeID),
    .io_ready(interface__io_ready),
    .io_reqIn(interface__io_reqIn)
  );
  AxonSystem axonSystem ( // @[NeuronCore.scala 15:26]
    .clock(axonSystem_clock),
    .reset(axonSystem_reset),
    .io_axonIn(axonSystem_io_axonIn),
    .io_axonValid(axonSystem_io_axonValid),
    .io_inOut(axonSystem_io_inOut),
    .io_spikeCnt(axonSystem_io_spikeCnt),
    .io_rAddr(axonSystem_io_rAddr),
    .io_rEna(axonSystem_io_rEna),
    .io_rData(axonSystem_io_rData)
  );
  TransmissionSystem_2 spikeTrans ( // @[NeuronCore.scala 16:26]
    .clock(spikeTrans_clock),
    .reset(spikeTrans_reset),
    .io_data(spikeTrans_io_data),
    .io_ready(spikeTrans_io_ready),
    .io_valid(spikeTrans_io_valid),
    .io_n(spikeTrans_io_n),
    .io_spikes_0(spikeTrans_io_spikes_0),
    .io_spikes_1(spikeTrans_io_spikes_1),
    .io_spikes_2(spikeTrans_io_spikes_2),
    .io_spikes_3(spikeTrans_io_spikes_3),
    .io_spikes_4(spikeTrans_io_spikes_4),
    .io_spikes_5(spikeTrans_io_spikes_5),
    .io_spikes_6(spikeTrans_io_spikes_6),
    .io_spikes_7(spikeTrans_io_spikes_7)
  );
  Neurons neurons ( // @[NeuronCore.scala 17:26]
    .clock(neurons_clock),
    .io_inOut(neurons_io_inOut),
    .io_spikeCnt(neurons_io_spikeCnt),
    .io_aAddr(neurons_io_aAddr),
    .io_aEna(neurons_io_aEna),
    .io_aData(neurons_io_aData),
    .io_n(neurons_io_n),
    .io_spikes_0(neurons_io_spikes_0),
    .io_spikes_1(neurons_io_spikes_1),
    .io_spikes_2(neurons_io_spikes_2),
    .io_spikes_3(neurons_io_spikes_3),
    .io_spikes_4(neurons_io_spikes_4),
    .io_spikes_5(neurons_io_spikes_5),
    .io_spikes_6(neurons_io_spikes_6),
    .io_spikes_7(neurons_io_spikes_7)
  );
  assign io_req = interface__io_reqOut; // @[NeuronCore.scala 20:27]
  assign io_tx = interface__io_tx; // @[NeuronCore.scala 21:27]
  assign interface__clock = clock;
  assign interface__reset = reset;
  assign interface__io_grant = io_grant; // @[NeuronCore.scala 19:27]
  assign interface__io_rx = io_rx; // @[NeuronCore.scala 22:27]
  assign interface__io_spikeID = spikeTrans_io_data; // @[NeuronCore.scala 25:27]
  assign interface__io_reqIn = spikeTrans_io_valid; // @[NeuronCore.scala 27:27]
  assign axonSystem_clock = clock;
  assign axonSystem_reset = reset;
  assign axonSystem_io_axonIn = interface__io_axonID; // @[NeuronCore.scala 23:27]
  assign axonSystem_io_axonValid = interface__io_valid; // @[NeuronCore.scala 24:27]
  assign axonSystem_io_inOut = neurons_io_inOut; // @[NeuronCore.scala 29:27]
  assign axonSystem_io_rAddr = neurons_io_aAddr; // @[NeuronCore.scala 31:27]
  assign axonSystem_io_rEna = neurons_io_aEna; // @[NeuronCore.scala 32:27]
  assign spikeTrans_clock = clock;
  assign spikeTrans_reset = reset;
  assign spikeTrans_io_ready = interface__io_ready; // @[NeuronCore.scala 26:27]
  assign spikeTrans_io_n = neurons_io_n; // @[NeuronCore.scala 35:27]
  assign spikeTrans_io_spikes_0 = neurons_io_spikes_0; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_1 = neurons_io_spikes_1; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_2 = neurons_io_spikes_2; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_3 = neurons_io_spikes_3; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_4 = neurons_io_spikes_4; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_5 = neurons_io_spikes_5; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_6 = neurons_io_spikes_6; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_7 = neurons_io_spikes_7; // @[NeuronCore.scala 37:29]
  assign neurons_clock = clock;
  assign neurons_io_spikeCnt = axonSystem_io_spikeCnt; // @[NeuronCore.scala 30:27]
  assign neurons_io_aData = axonSystem_io_rData; // @[NeuronCore.scala 33:27]
endmodule
module BusInterface_3(
  input         clock,
  input         reset,
  input         io_grant,
  output        io_reqOut,
  output [10:0] io_tx,
  input  [10:0] io_rx,
  output [9:0]  io_axonID,
  output        io_valid,
  input  [10:0] io_spikeID,
  output        io_ready,
  input         io_reqIn
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  _T = ~io_grant; // @[BusInterface.scala 28:28]
  reg [2:0] synROMReg; // @[BusInterface.scala 38:27]
  reg [7:0] axonIDLSB; // @[BusInterface.scala 41:27]
  wire  enaROM = |io_rx; // @[BusInterface.scala 43:22]
  assign io_reqOut = io_reqIn & _T; // @[BusInterface.scala 28:13]
  assign io_tx = io_grant ? io_spikeID : 11'h0; // @[BusInterface.scala 23:9 BusInterface.scala 25:11]
  assign io_axonID = {synROMReg[1:0],axonIDLSB}; // @[BusInterface.scala 52:13]
  assign io_valid = synROMReg[2]; // @[BusInterface.scala 51:13]
  assign io_ready = io_grant; // @[BusInterface.scala 29:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  synROMReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  axonIDLSB = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      synROMReg <= 3'h0;
    end else if (enaROM) begin
      if (3'h4 == io_rx[10:8]) begin
        synROMReg <= 3'h0;
      end else if (3'h3 == io_rx[10:8]) begin
        synROMReg <= 3'h0;
      end else if (3'h2 == io_rx[10:8]) begin
        synROMReg <= 3'h4;
      end else begin
        synROMReg <= 3'h0;
      end
    end else begin
      synROMReg <= 3'h0;
    end
    if (reset) begin
      axonIDLSB <= 8'h0;
    end else begin
      axonIDLSB <= io_rx[7:0];
    end
  end
endmodule
module TransmissionSystem_3(
  input         clock,
  input         reset,
  output [10:0] io_data,
  input         io_ready,
  output        io_valid,
  input  [4:0]  io_n,
  input         io_spikes_0,
  input         io_spikes_1,
  input         io_spikes_2,
  input         io_spikes_3,
  input         io_spikes_4,
  input         io_spikes_5,
  input         io_spikes_6,
  input         io_spikes_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire  spikeEncoder_io_reqs_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_reqs_7; // @[SpikeTransmission.scala 22:28]
  wire [2:0] spikeEncoder_io_value; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_mask_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_0; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_1; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_2; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_3; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_4; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_5; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_6; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_rst_7; // @[SpikeTransmission.scala 22:28]
  wire  spikeEncoder_io_valid; // @[SpikeTransmission.scala 22:28]
  reg  spikeRegs_0; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_1; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_2; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_3; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_4; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_5; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_6; // @[SpikeTransmission.scala 18:29]
  reg  spikeRegs_7; // @[SpikeTransmission.scala 18:29]
  reg [4:0] neuronIdMSB_0; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_1; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_2; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_3; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_4; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_5; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_6; // @[SpikeTransmission.scala 19:29]
  reg [4:0] neuronIdMSB_7; // @[SpikeTransmission.scala 19:29]
  reg  maskRegs_0; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_1; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_2; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_3; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_4; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_5; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_6; // @[SpikeTransmission.scala 20:29]
  reg  maskRegs_7; // @[SpikeTransmission.scala 20:29]
  wire  _T_3 = ~spikeEncoder_io_valid; // @[SpikeTransmission.scala 37:16]
  wire  _GEN_0 = _T_3 | maskRegs_0; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_1 = io_ready ? spikeEncoder_io_mask_0 : _GEN_0; // @[SpikeTransmission.scala 35:20]
  wire  _T_5 = spikeEncoder_io_rst_0 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_0 = ~_T_5; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_0 = rstReadySel_0 & spikeRegs_0; // @[SpikeTransmission.scala 44:38]
  wire  _T_8 = ~spikeUpdate_0; // @[SpikeTransmission.scala 46:10]
  wire  _T_9 = 3'h0 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_11 = {3'h3,neuronIdMSB_0,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_5 = _T_9 ? _T_11 : 11'h0; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_6 = _T_3 | maskRegs_1; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_7 = io_ready ? spikeEncoder_io_mask_1 : _GEN_6; // @[SpikeTransmission.scala 35:20]
  wire  _T_14 = spikeEncoder_io_rst_1 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_1 = ~_T_14; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_1 = rstReadySel_1 & spikeRegs_1; // @[SpikeTransmission.scala 44:38]
  wire  _T_17 = ~spikeUpdate_1; // @[SpikeTransmission.scala 46:10]
  wire  _T_18 = 3'h1 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_20 = {3'h3,neuronIdMSB_1,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_11 = _T_18 ? _T_20 : _GEN_5; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_12 = _T_3 | maskRegs_2; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_13 = io_ready ? spikeEncoder_io_mask_2 : _GEN_12; // @[SpikeTransmission.scala 35:20]
  wire  _T_23 = spikeEncoder_io_rst_2 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_2 = ~_T_23; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_2 = rstReadySel_2 & spikeRegs_2; // @[SpikeTransmission.scala 44:38]
  wire  _T_26 = ~spikeUpdate_2; // @[SpikeTransmission.scala 46:10]
  wire  _T_27 = 3'h2 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_29 = {3'h3,neuronIdMSB_2,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_17 = _T_27 ? _T_29 : _GEN_11; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_18 = _T_3 | maskRegs_3; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_19 = io_ready ? spikeEncoder_io_mask_3 : _GEN_18; // @[SpikeTransmission.scala 35:20]
  wire  _T_32 = spikeEncoder_io_rst_3 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_3 = ~_T_32; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_3 = rstReadySel_3 & spikeRegs_3; // @[SpikeTransmission.scala 44:38]
  wire  _T_35 = ~spikeUpdate_3; // @[SpikeTransmission.scala 46:10]
  wire  _T_36 = 3'h3 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_38 = {3'h3,neuronIdMSB_3,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_23 = _T_36 ? _T_38 : _GEN_17; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_24 = _T_3 | maskRegs_4; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_25 = io_ready ? spikeEncoder_io_mask_4 : _GEN_24; // @[SpikeTransmission.scala 35:20]
  wire  _T_41 = spikeEncoder_io_rst_4 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_4 = ~_T_41; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_4 = rstReadySel_4 & spikeRegs_4; // @[SpikeTransmission.scala 44:38]
  wire  _T_44 = ~spikeUpdate_4; // @[SpikeTransmission.scala 46:10]
  wire  _T_45 = 3'h4 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_47 = {3'h3,neuronIdMSB_4,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_29 = _T_45 ? _T_47 : _GEN_23; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_30 = _T_3 | maskRegs_5; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_31 = io_ready ? spikeEncoder_io_mask_5 : _GEN_30; // @[SpikeTransmission.scala 35:20]
  wire  _T_50 = spikeEncoder_io_rst_5 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_5 = ~_T_50; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_5 = rstReadySel_5 & spikeRegs_5; // @[SpikeTransmission.scala 44:38]
  wire  _T_53 = ~spikeUpdate_5; // @[SpikeTransmission.scala 46:10]
  wire  _T_54 = 3'h5 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_56 = {3'h3,neuronIdMSB_5,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_35 = _T_54 ? _T_56 : _GEN_29; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_36 = _T_3 | maskRegs_6; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_37 = io_ready ? spikeEncoder_io_mask_6 : _GEN_36; // @[SpikeTransmission.scala 35:20]
  wire  _T_59 = spikeEncoder_io_rst_6 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_6 = ~_T_59; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_6 = rstReadySel_6 & spikeRegs_6; // @[SpikeTransmission.scala 44:38]
  wire  _T_62 = ~spikeUpdate_6; // @[SpikeTransmission.scala 46:10]
  wire  _T_63 = 3'h6 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_65 = {3'h3,neuronIdMSB_6,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  wire [10:0] _GEN_41 = _T_63 ? _T_65 : _GEN_35; // @[SpikeTransmission.scala 56:41]
  wire  _GEN_42 = _T_3 | maskRegs_7; // @[SpikeTransmission.scala 37:39]
  wire  _GEN_43 = io_ready ? spikeEncoder_io_mask_7 : _GEN_42; // @[SpikeTransmission.scala 35:20]
  wire  _T_68 = spikeEncoder_io_rst_7 & io_ready; // @[SpikeTransmission.scala 43:50]
  wire  rstReadySel_7 = ~_T_68; // @[SpikeTransmission.scala 43:25]
  wire  spikeUpdate_7 = rstReadySel_7 & spikeRegs_7; // @[SpikeTransmission.scala 44:38]
  wire  _T_71 = ~spikeUpdate_7; // @[SpikeTransmission.scala 46:10]
  wire  _T_72 = 3'h7 == spikeEncoder_io_value; // @[SpikeTransmission.scala 56:14]
  wire [10:0] _T_74 = {3'h3,neuronIdMSB_7,spikeEncoder_io_value}; // @[SpikeTransmission.scala 57:62]
  PriorityMaskRstEncoder spikeEncoder ( // @[SpikeTransmission.scala 22:28]
    .io_reqs_0(spikeEncoder_io_reqs_0),
    .io_reqs_1(spikeEncoder_io_reqs_1),
    .io_reqs_2(spikeEncoder_io_reqs_2),
    .io_reqs_3(spikeEncoder_io_reqs_3),
    .io_reqs_4(spikeEncoder_io_reqs_4),
    .io_reqs_5(spikeEncoder_io_reqs_5),
    .io_reqs_6(spikeEncoder_io_reqs_6),
    .io_reqs_7(spikeEncoder_io_reqs_7),
    .io_value(spikeEncoder_io_value),
    .io_mask_0(spikeEncoder_io_mask_0),
    .io_mask_1(spikeEncoder_io_mask_1),
    .io_mask_2(spikeEncoder_io_mask_2),
    .io_mask_3(spikeEncoder_io_mask_3),
    .io_mask_4(spikeEncoder_io_mask_4),
    .io_mask_5(spikeEncoder_io_mask_5),
    .io_mask_6(spikeEncoder_io_mask_6),
    .io_mask_7(spikeEncoder_io_mask_7),
    .io_rst_0(spikeEncoder_io_rst_0),
    .io_rst_1(spikeEncoder_io_rst_1),
    .io_rst_2(spikeEncoder_io_rst_2),
    .io_rst_3(spikeEncoder_io_rst_3),
    .io_rst_4(spikeEncoder_io_rst_4),
    .io_rst_5(spikeEncoder_io_rst_5),
    .io_rst_6(spikeEncoder_io_rst_6),
    .io_rst_7(spikeEncoder_io_rst_7),
    .io_valid(spikeEncoder_io_valid)
  );
  assign io_data = _T_72 ? _T_74 : _GEN_41; // @[SpikeTransmission.scala 29:12 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15 SpikeTransmission.scala 57:15]
  assign io_valid = spikeEncoder_io_valid; // @[SpikeTransmission.scala 30:12]
  assign spikeEncoder_io_reqs_0 = maskRegs_0 & spikeRegs_0; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_1 = maskRegs_1 & spikeRegs_1; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_2 = maskRegs_2 & spikeRegs_2; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_3 = maskRegs_3 & spikeRegs_3; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_4 = maskRegs_4 & spikeRegs_4; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_5 = maskRegs_5 & spikeRegs_5; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_6 = maskRegs_6 & spikeRegs_6; // @[SpikeTransmission.scala 27:24]
  assign spikeEncoder_io_reqs_7 = maskRegs_7 & spikeRegs_7; // @[SpikeTransmission.scala 27:24]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  spikeRegs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  spikeRegs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  spikeRegs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  spikeRegs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  spikeRegs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  spikeRegs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  spikeRegs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  spikeRegs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  neuronIdMSB_0 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  neuronIdMSB_1 = _RAND_9[4:0];
  _RAND_10 = {1{`RANDOM}};
  neuronIdMSB_2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  neuronIdMSB_3 = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  neuronIdMSB_4 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  neuronIdMSB_5 = _RAND_13[4:0];
  _RAND_14 = {1{`RANDOM}};
  neuronIdMSB_6 = _RAND_14[4:0];
  _RAND_15 = {1{`RANDOM}};
  neuronIdMSB_7 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  maskRegs_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  maskRegs_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  maskRegs_2 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  maskRegs_3 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  maskRegs_4 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  maskRegs_5 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  maskRegs_6 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  maskRegs_7 = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      spikeRegs_0 <= 1'h0;
    end else if (_T_8) begin
      spikeRegs_0 <= io_spikes_0;
    end
    if (reset) begin
      spikeRegs_1 <= 1'h0;
    end else if (_T_17) begin
      spikeRegs_1 <= io_spikes_1;
    end
    if (reset) begin
      spikeRegs_2 <= 1'h0;
    end else if (_T_26) begin
      spikeRegs_2 <= io_spikes_2;
    end
    if (reset) begin
      spikeRegs_3 <= 1'h0;
    end else if (_T_35) begin
      spikeRegs_3 <= io_spikes_3;
    end
    if (reset) begin
      spikeRegs_4 <= 1'h0;
    end else if (_T_44) begin
      spikeRegs_4 <= io_spikes_4;
    end
    if (reset) begin
      spikeRegs_5 <= 1'h0;
    end else if (_T_53) begin
      spikeRegs_5 <= io_spikes_5;
    end
    if (reset) begin
      spikeRegs_6 <= 1'h0;
    end else if (_T_62) begin
      spikeRegs_6 <= io_spikes_6;
    end
    if (reset) begin
      spikeRegs_7 <= 1'h0;
    end else if (_T_71) begin
      spikeRegs_7 <= io_spikes_7;
    end
    if (reset) begin
      neuronIdMSB_0 <= 5'h0;
    end else if (_T_8) begin
      neuronIdMSB_0 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_1 <= 5'h0;
    end else if (_T_17) begin
      neuronIdMSB_1 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_2 <= 5'h0;
    end else if (_T_26) begin
      neuronIdMSB_2 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_3 <= 5'h0;
    end else if (_T_35) begin
      neuronIdMSB_3 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_4 <= 5'h0;
    end else if (_T_44) begin
      neuronIdMSB_4 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_5 <= 5'h0;
    end else if (_T_53) begin
      neuronIdMSB_5 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_6 <= 5'h0;
    end else if (_T_62) begin
      neuronIdMSB_6 <= io_n;
    end
    if (reset) begin
      neuronIdMSB_7 <= 5'h0;
    end else if (_T_71) begin
      neuronIdMSB_7 <= io_n;
    end
    maskRegs_0 <= reset | _GEN_1;
    maskRegs_1 <= reset | _GEN_7;
    maskRegs_2 <= reset | _GEN_13;
    maskRegs_3 <= reset | _GEN_19;
    maskRegs_4 <= reset | _GEN_25;
    maskRegs_5 <= reset | _GEN_31;
    maskRegs_6 <= reset | _GEN_37;
    maskRegs_7 <= reset | _GEN_43;
  end
endmodule
module Neurons_1(
  input        clock,
  output       io_inOut,
  input  [9:0] io_spikeCnt,
  output [9:0] io_aAddr,
  output       io_aEna,
  input  [9:0] io_aData,
  output [4:0] io_n,
  output       io_spikes_0,
  output       io_spikes_1,
  output       io_spikes_2,
  output       io_spikes_3,
  output       io_spikes_4,
  output       io_spikes_5,
  output       io_spikes_6,
  output       io_spikes_7
);
  wire  newBlock_clock; // @[Neurons.scala 50:24]
  wire  newBlock_reset; // @[Neurons.scala 50:24]
  wire  newBlock_io_inOut; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_spikeCnt; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_aAddr; // @[Neurons.scala 50:24]
  wire  newBlock_io_aEna; // @[Neurons.scala 50:24]
  wire [9:0] newBlock_io_aData; // @[Neurons.scala 50:24]
  wire [4:0] newBlock_io_n; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_0; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_1; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_2; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_3; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_4; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_5; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_6; // @[Neurons.scala 50:24]
  wire  newBlock_io_spikes_7; // @[Neurons.scala 50:24]
  neuron_top #(.io_coreID(3)) newBlock ( // @[Neurons.scala 50:24]
    .clock(newBlock_clock),
    .reset(newBlock_reset),
    .io_inOut(newBlock_io_inOut),
    .io_spikeCnt(newBlock_io_spikeCnt),
    .io_aAddr(newBlock_io_aAddr),
    .io_aEna(newBlock_io_aEna),
    .io_aData(newBlock_io_aData),
    .io_n(newBlock_io_n),
    .io_spikes_0(newBlock_io_spikes_0),
    .io_spikes_1(newBlock_io_spikes_1),
    .io_spikes_2(newBlock_io_spikes_2),
    .io_spikes_3(newBlock_io_spikes_3),
    .io_spikes_4(newBlock_io_spikes_4),
    .io_spikes_5(newBlock_io_spikes_5),
    .io_spikes_6(newBlock_io_spikes_6),
    .io_spikes_7(newBlock_io_spikes_7)
  );
  assign io_inOut = newBlock_io_inOut; // @[Neurons.scala 53:27]
  assign io_aAddr = newBlock_io_aAddr; // @[Neurons.scala 55:27]
  assign io_aEna = newBlock_io_aEna; // @[Neurons.scala 56:27]
  assign io_n = newBlock_io_n; // @[Neurons.scala 59:27]
  assign io_spikes_0 = newBlock_io_spikes_0; // @[Neurons.scala 60:16]
  assign io_spikes_1 = newBlock_io_spikes_1; // @[Neurons.scala 61:16]
  assign io_spikes_2 = newBlock_io_spikes_2; // @[Neurons.scala 62:16]
  assign io_spikes_3 = newBlock_io_spikes_3; // @[Neurons.scala 63:16]
  assign io_spikes_4 = newBlock_io_spikes_4; // @[Neurons.scala 64:16]
  assign io_spikes_5 = newBlock_io_spikes_5; // @[Neurons.scala 65:16]
  assign io_spikes_6 = newBlock_io_spikes_6; // @[Neurons.scala 66:16]
  assign io_spikes_7 = newBlock_io_spikes_7; // @[Neurons.scala 67:16]
  assign newBlock_clock = clock; // @[Neurons.scala 51:27]
  assign newBlock_reset = 1'h0;
  assign newBlock_io_spikeCnt = io_spikeCnt; // @[Neurons.scala 54:27]
  assign newBlock_io_aData = io_aData; // @[Neurons.scala 57:27]
endmodule
module NeuronCore_1(
  input         clock,
  input         reset,
  input         io_grant,
  output        io_req,
  output [10:0] io_tx,
  input  [10:0] io_rx
);
  wire  interface__clock; // @[NeuronCore.scala 14:26]
  wire  interface__reset; // @[NeuronCore.scala 14:26]
  wire  interface__io_grant; // @[NeuronCore.scala 14:26]
  wire  interface__io_reqOut; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_tx; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_rx; // @[NeuronCore.scala 14:26]
  wire [9:0] interface__io_axonID; // @[NeuronCore.scala 14:26]
  wire  interface__io_valid; // @[NeuronCore.scala 14:26]
  wire [10:0] interface__io_spikeID; // @[NeuronCore.scala 14:26]
  wire  interface__io_ready; // @[NeuronCore.scala 14:26]
  wire  interface__io_reqIn; // @[NeuronCore.scala 14:26]
  wire  axonSystem_clock; // @[NeuronCore.scala 15:26]
  wire  axonSystem_reset; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_axonIn; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_axonValid; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_inOut; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_spikeCnt; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_rAddr; // @[NeuronCore.scala 15:26]
  wire  axonSystem_io_rEna; // @[NeuronCore.scala 15:26]
  wire [9:0] axonSystem_io_rData; // @[NeuronCore.scala 15:26]
  wire  spikeTrans_clock; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_reset; // @[NeuronCore.scala 16:26]
  wire [10:0] spikeTrans_io_data; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_ready; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_valid; // @[NeuronCore.scala 16:26]
  wire [4:0] spikeTrans_io_n; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_0; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_1; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_2; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_3; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_4; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_5; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_6; // @[NeuronCore.scala 16:26]
  wire  spikeTrans_io_spikes_7; // @[NeuronCore.scala 16:26]
  wire  neurons_clock; // @[NeuronCore.scala 17:26]
  wire  neurons_io_inOut; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_spikeCnt; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_aAddr; // @[NeuronCore.scala 17:26]
  wire  neurons_io_aEna; // @[NeuronCore.scala 17:26]
  wire [9:0] neurons_io_aData; // @[NeuronCore.scala 17:26]
  wire [4:0] neurons_io_n; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_0; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_1; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_2; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_3; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_4; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_5; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_6; // @[NeuronCore.scala 17:26]
  wire  neurons_io_spikes_7; // @[NeuronCore.scala 17:26]
  BusInterface_3 interface_ ( // @[NeuronCore.scala 14:26]
    .clock(interface__clock),
    .reset(interface__reset),
    .io_grant(interface__io_grant),
    .io_reqOut(interface__io_reqOut),
    .io_tx(interface__io_tx),
    .io_rx(interface__io_rx),
    .io_axonID(interface__io_axonID),
    .io_valid(interface__io_valid),
    .io_spikeID(interface__io_spikeID),
    .io_ready(interface__io_ready),
    .io_reqIn(interface__io_reqIn)
  );
  AxonSystem axonSystem ( // @[NeuronCore.scala 15:26]
    .clock(axonSystem_clock),
    .reset(axonSystem_reset),
    .io_axonIn(axonSystem_io_axonIn),
    .io_axonValid(axonSystem_io_axonValid),
    .io_inOut(axonSystem_io_inOut),
    .io_spikeCnt(axonSystem_io_spikeCnt),
    .io_rAddr(axonSystem_io_rAddr),
    .io_rEna(axonSystem_io_rEna),
    .io_rData(axonSystem_io_rData)
  );
  TransmissionSystem_3 spikeTrans ( // @[NeuronCore.scala 16:26]
    .clock(spikeTrans_clock),
    .reset(spikeTrans_reset),
    .io_data(spikeTrans_io_data),
    .io_ready(spikeTrans_io_ready),
    .io_valid(spikeTrans_io_valid),
    .io_n(spikeTrans_io_n),
    .io_spikes_0(spikeTrans_io_spikes_0),
    .io_spikes_1(spikeTrans_io_spikes_1),
    .io_spikes_2(spikeTrans_io_spikes_2),
    .io_spikes_3(spikeTrans_io_spikes_3),
    .io_spikes_4(spikeTrans_io_spikes_4),
    .io_spikes_5(spikeTrans_io_spikes_5),
    .io_spikes_6(spikeTrans_io_spikes_6),
    .io_spikes_7(spikeTrans_io_spikes_7)
  );
  Neurons_1 neurons ( // @[NeuronCore.scala 17:26]
    .clock(neurons_clock),
    .io_inOut(neurons_io_inOut),
    .io_spikeCnt(neurons_io_spikeCnt),
    .io_aAddr(neurons_io_aAddr),
    .io_aEna(neurons_io_aEna),
    .io_aData(neurons_io_aData),
    .io_n(neurons_io_n),
    .io_spikes_0(neurons_io_spikes_0),
    .io_spikes_1(neurons_io_spikes_1),
    .io_spikes_2(neurons_io_spikes_2),
    .io_spikes_3(neurons_io_spikes_3),
    .io_spikes_4(neurons_io_spikes_4),
    .io_spikes_5(neurons_io_spikes_5),
    .io_spikes_6(neurons_io_spikes_6),
    .io_spikes_7(neurons_io_spikes_7)
  );
  assign io_req = interface__io_reqOut; // @[NeuronCore.scala 20:27]
  assign io_tx = interface__io_tx; // @[NeuronCore.scala 21:27]
  assign interface__clock = clock;
  assign interface__reset = reset;
  assign interface__io_grant = io_grant; // @[NeuronCore.scala 19:27]
  assign interface__io_rx = io_rx; // @[NeuronCore.scala 22:27]
  assign interface__io_spikeID = spikeTrans_io_data; // @[NeuronCore.scala 25:27]
  assign interface__io_reqIn = spikeTrans_io_valid; // @[NeuronCore.scala 27:27]
  assign axonSystem_clock = clock;
  assign axonSystem_reset = reset;
  assign axonSystem_io_axonIn = interface__io_axonID; // @[NeuronCore.scala 23:27]
  assign axonSystem_io_axonValid = interface__io_valid; // @[NeuronCore.scala 24:27]
  assign axonSystem_io_inOut = neurons_io_inOut; // @[NeuronCore.scala 29:27]
  assign axonSystem_io_rAddr = neurons_io_aAddr; // @[NeuronCore.scala 31:27]
  assign axonSystem_io_rEna = neurons_io_aEna; // @[NeuronCore.scala 32:27]
  assign spikeTrans_clock = clock;
  assign spikeTrans_reset = reset;
  assign spikeTrans_io_ready = interface__io_ready; // @[NeuronCore.scala 26:27]
  assign spikeTrans_io_n = neurons_io_n; // @[NeuronCore.scala 35:27]
  assign spikeTrans_io_spikes_0 = neurons_io_spikes_0; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_1 = neurons_io_spikes_1; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_2 = neurons_io_spikes_2; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_3 = neurons_io_spikes_3; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_4 = neurons_io_spikes_4; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_5 = neurons_io_spikes_5; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_6 = neurons_io_spikes_6; // @[NeuronCore.scala 37:29]
  assign spikeTrans_io_spikes_7 = neurons_io_spikes_7; // @[NeuronCore.scala 37:29]
  assign neurons_clock = clock;
  assign neurons_io_spikeCnt = axonSystem_io_spikeCnt; // @[NeuronCore.scala 30:27]
  assign neurons_io_aData = axonSystem_io_rData; // @[NeuronCore.scala 33:27]
endmodule
module OutputCore(
  input         clock,
  input         reset,
  output [7:0]  io_offCCData,
  output        io_offCCValid,
  input         io_offCCReady,
  input         io_grant,
  output        io_req,
  output [10:0] io_tx,
  input  [10:0] io_rx
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire  interface__clock; // @[OutputCore.scala 25:26]
  wire  interface__reset; // @[OutputCore.scala 25:26]
  wire  interface__io_grant; // @[OutputCore.scala 25:26]
  wire  interface__io_reqOut; // @[OutputCore.scala 25:26]
  wire [10:0] interface__io_tx; // @[OutputCore.scala 25:26]
  wire [10:0] interface__io_rx; // @[OutputCore.scala 25:26]
  wire [9:0] interface__io_axonID; // @[OutputCore.scala 25:26]
  wire  interface__io_valid; // @[OutputCore.scala 25:26]
  wire [10:0] interface__io_spikeID; // @[OutputCore.scala 25:26]
  wire  interface__io_ready; // @[OutputCore.scala 25:26]
  wire  interface__io_reqIn; // @[OutputCore.scala 25:26]
  reg [7:0] queMem [0:15]; // @[OutputCore.scala 28:28]
  wire [7:0] queMem__T_1_r_data; // @[OutputCore.scala 28:28]
  wire [3:0] queMem__T_1_r_addr; // @[OutputCore.scala 28:28]
  wire [7:0] queMem__T_1_w_data; // @[OutputCore.scala 28:28]
  wire [3:0] queMem__T_1_w_addr; // @[OutputCore.scala 28:28]
  wire  queMem__T_1_w_mask; // @[OutputCore.scala 28:28]
  wire  queMem__T_1_w_en; // @[OutputCore.scala 28:28]
  reg  queMem__T_1_r_en_pipe_0;
  reg [3:0] queMem__T_1_r_addr_pipe_0;
  reg [7:0] offCCData; // @[OutputCore.scala 21:27]
  reg  offCCValid; // @[OutputCore.scala 22:27]
  reg  readComing; // @[OutputCore.scala 35:27]
  reg [3:0] rAddr; // @[OutputCore.scala 38:22]
  reg [3:0] wAddr; // @[OutputCore.scala 39:22]
  reg [3:0] items; // @[OutputCore.scala 40:22]
  wire  _T_8 = ~offCCValid; // @[OutputCore.scala 84:14]
  wire  _T_9 = ~readComing; // @[OutputCore.scala 84:29]
  wire  _T_10 = _T_8 & _T_9; // @[OutputCore.scala 84:26]
  wire  _T_11 = items > 4'h0; // @[OutputCore.scala 84:50]
  wire  _T_12 = _T_10 & _T_11; // @[OutputCore.scala 84:41]
  wire  wr = interface__io_valid; // @[OutputCore.scala 76:28]
  wire [7:0] readData = queMem__T_1_r_data; // @[OutputCore.scala 64:14]
  wire  ena = interface__io_valid | _T_12; // @[OutputCore.scala 76:28]
  wire  _GEN_8 = ena & wr; // @[OutputCore.scala 62:13]
  wire  _T_2 = offCCValid & io_offCCReady; // @[OutputCore.scala 72:19]
  wire  _GEN_10 = _T_2 ? 1'h0 : offCCValid; // @[OutputCore.scala 72:36]
  wire [3:0] _T_5 = wAddr + 4'h1; // @[OutputCore.scala 81:22]
  wire [3:0] _T_7 = items + 4'h1; // @[OutputCore.scala 82:22]
  wire [3:0] _T_14 = rAddr + 4'h1; // @[OutputCore.scala 88:20]
  wire [3:0] _T_16 = items - 4'h1; // @[OutputCore.scala 89:20]
  wire  _GEN_27 = readComing | _GEN_10; // @[OutputCore.scala 95:19]
  wire  _GEN_31 = ~_GEN_8;
  BusInterface_3 interface_ ( // @[OutputCore.scala 25:26]
    .clock(interface__clock),
    .reset(interface__reset),
    .io_grant(interface__io_grant),
    .io_reqOut(interface__io_reqOut),
    .io_tx(interface__io_tx),
    .io_rx(interface__io_rx),
    .io_axonID(interface__io_axonID),
    .io_valid(interface__io_valid),
    .io_spikeID(interface__io_spikeID),
    .io_ready(interface__io_ready),
    .io_reqIn(interface__io_reqIn)
  );
  assign queMem__T_1_r_addr = queMem__T_1_r_addr_pipe_0;
  assign queMem__T_1_r_data = queMem[queMem__T_1_r_addr]; // @[OutputCore.scala 28:28]
  assign queMem__T_1_w_data = interface__io_axonID[7:0];
  assign queMem__T_1_w_addr = interface__io_valid ? wAddr : rAddr;
  assign queMem__T_1_w_mask = interface__io_valid;
  assign queMem__T_1_w_en = ena & _GEN_8;
  assign io_offCCData = offCCData; // @[OutputCore.scala 60:17]
  assign io_offCCValid = offCCValid; // @[OutputCore.scala 59:17]
  assign io_req = interface__io_reqOut; // @[OutputCore.scala 53:27]
  assign io_tx = interface__io_tx; // @[OutputCore.scala 54:27]
  assign interface__clock = clock;
  assign interface__reset = reset;
  assign interface__io_grant = io_grant; // @[OutputCore.scala 52:27]
  assign interface__io_rx = io_rx; // @[OutputCore.scala 55:27]
  assign interface__io_spikeID = 11'h0; // @[OutputCore.scala 57:27]
  assign interface__io_reqIn = 1'h0; // @[OutputCore.scala 56:27]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    queMem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  queMem__T_1_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  queMem__T_1_r_addr_pipe_0 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  offCCData = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  offCCValid = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  readComing = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  rAddr = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  wAddr = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  items = _RAND_8[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(queMem__T_1_w_en & queMem__T_1_w_mask) begin
      queMem[queMem__T_1_w_addr] <= queMem__T_1_w_data; // @[OutputCore.scala 28:28]
    end
    queMem__T_1_r_en_pipe_0 <= ena & _GEN_31;
    if (ena & _GEN_31) begin
      if (interface__io_valid) begin
        queMem__T_1_r_addr_pipe_0 <= wAddr;
      end else begin
        queMem__T_1_r_addr_pipe_0 <= rAddr;
      end
    end
    if (reset) begin
      offCCData <= 8'h0;
    end else if (readComing) begin
      offCCData <= readData;
    end
    if (reset) begin
      offCCValid <= 1'h0;
    end else begin
      offCCValid <= _GEN_27;
    end
    if (reset) begin
      readComing <= 1'h0;
    end else if (interface__io_valid) begin
      readComing <= 1'h0;
    end else begin
      readComing <= _T_12;
    end
    if (reset) begin
      rAddr <= 4'h0;
    end else if (!(interface__io_valid)) begin
      if (_T_12) begin
        rAddr <= _T_14;
      end
    end
    if (reset) begin
      wAddr <= 4'h0;
    end else if (interface__io_valid) begin
      wAddr <= _T_5;
    end
    if (reset) begin
      items <= 4'h0;
    end else if (interface__io_valid) begin
      items <= _T_7;
    end else if (_T_12) begin
      items <= _T_16;
    end
  end
endmodule
module BusArbiter(
  input   clock,
  input   reset,
  input   io_reqs_0,
  input   io_reqs_1,
  input   io_reqs_2,
  input   io_reqs_3,
  input   io_reqs_4,
  output  io_grants_0,
  output  io_grants_1,
  output  io_grants_2,
  output  io_grants_3,
  output  io_grants_4
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  reg  maskRegs_0; // @[BusArbiter.scala 13:27]
  reg  maskRegs_1; // @[BusArbiter.scala 13:27]
  reg  maskRegs_2; // @[BusArbiter.scala 13:27]
  reg  maskRegs_3; // @[BusArbiter.scala 13:27]
  reg  maskRegs_4; // @[BusArbiter.scala 13:27]
  reg  grantRegs_0; // @[BusArbiter.scala 15:27]
  reg  grantRegs_1; // @[BusArbiter.scala 15:27]
  reg  grantRegs_2; // @[BusArbiter.scala 15:27]
  reg  grantRegs_3; // @[BusArbiter.scala 15:27]
  reg  grantRegs_4; // @[BusArbiter.scala 15:27]
  wire  maskedReqs_4 = maskRegs_4 & io_reqs_4; // @[BusArbiter.scala 38:34]
  wire  maskedReqs_3 = maskRegs_3 & io_reqs_3; // @[BusArbiter.scala 38:34]
  wire  maskedReqs_2 = maskRegs_2 & io_reqs_2; // @[BusArbiter.scala 38:34]
  wire  maskedReqs_1 = maskRegs_1 & io_reqs_1; // @[BusArbiter.scala 38:34]
  wire  maskedReqs_0 = maskRegs_0 & io_reqs_0; // @[BusArbiter.scala 38:34]
  wire [1:0] _GEN_6 = maskedReqs_2 ? 2'h2 : {{1'd0}, maskedReqs_1}; // @[BusArbiter.scala 42:25]
  wire [1:0] _GEN_8 = maskedReqs_3 ? 2'h3 : _GEN_6; // @[BusArbiter.scala 42:25]
  wire [2:0] value = maskedReqs_4 ? 3'h4 : {{1'd0}, _GEN_8}; // @[BusArbiter.scala 42:25]
  wire  mask_4 = value == 3'h0; // @[BusArbiter.scala 28:14]
  wire  mask_3 = mask_4 | maskedReqs_4; // @[BusArbiter.scala 34:28]
  wire  mask_2 = mask_3 | maskedReqs_3; // @[BusArbiter.scala 34:28]
  wire  mask_1 = mask_2 | maskedReqs_2; // @[BusArbiter.scala 34:28]
  wire  mask_0 = mask_1 | maskedReqs_1; // @[BusArbiter.scala 34:28]
  wire  _GEN_3 = maskedReqs_1 | maskedReqs_0; // @[BusArbiter.scala 42:25]
  wire  _GEN_5 = maskedReqs_2 | _GEN_3; // @[BusArbiter.scala 42:25]
  wire  _GEN_7 = maskedReqs_3 | _GEN_5; // @[BusArbiter.scala 42:25]
  wire  oneReq = maskedReqs_4 | _GEN_7; // @[BusArbiter.scala 42:25]
  wire  _T_12 = 3'h0 == value; // @[BusArbiter.scala 49:14]
  wire  grants_0 = _T_12 & oneReq; // @[BusArbiter.scala 49:24]
  wire  _T_14 = 3'h1 == value; // @[BusArbiter.scala 49:14]
  wire  grants_1 = _T_14 & oneReq; // @[BusArbiter.scala 49:24]
  wire  _T_16 = 3'h2 == value; // @[BusArbiter.scala 49:14]
  wire  grants_2 = _T_16 & oneReq; // @[BusArbiter.scala 49:24]
  wire  _T_18 = 3'h3 == value; // @[BusArbiter.scala 49:14]
  wire  grants_3 = _T_18 & oneReq; // @[BusArbiter.scala 49:24]
  wire  _T_20 = 3'h4 == value; // @[BusArbiter.scala 49:14]
  wire  grants_4 = _T_20 & oneReq; // @[BusArbiter.scala 49:24]
  assign io_grants_0 = grantRegs_0; // @[BusArbiter.scala 55:13]
  assign io_grants_1 = grantRegs_1; // @[BusArbiter.scala 55:13]
  assign io_grants_2 = grantRegs_2; // @[BusArbiter.scala 55:13]
  assign io_grants_3 = grantRegs_3; // @[BusArbiter.scala 55:13]
  assign io_grants_4 = grantRegs_4; // @[BusArbiter.scala 55:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  maskRegs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  maskRegs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  maskRegs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maskRegs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  maskRegs_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  grantRegs_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  grantRegs_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  grantRegs_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  grantRegs_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  grantRegs_4 = _RAND_9[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    maskRegs_0 <= reset | mask_0;
    maskRegs_1 <= reset | mask_1;
    maskRegs_2 <= reset | mask_2;
    maskRegs_3 <= reset | mask_3;
    maskRegs_4 <= reset | mask_4;
    if (reset) begin
      grantRegs_0 <= 1'h0;
    end else begin
      grantRegs_0 <= grants_0;
    end
    if (reset) begin
      grantRegs_1 <= 1'h0;
    end else begin
      grantRegs_1 <= grants_1;
    end
    if (reset) begin
      grantRegs_2 <= 1'h0;
    end else begin
      grantRegs_2 <= grants_2;
    end
    if (reset) begin
      grantRegs_3 <= 1'h0;
    end else begin
      grantRegs_3 <= grants_3;
    end
    if (reset) begin
      grantRegs_4 <= 1'h0;
    end else begin
      grantRegs_4 <= grants_4;
    end
  end
endmodule
module NeuromorphicProcessor(
  input   clock,
  input   reset,
  output  io_uartTx,
  input   io_uartRx
);
  wire  offCC_clock; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_reset; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_tx; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_rx; // @[NeuromorphicProcessor.scala 13:21]
  wire [23:0] offCC_io_inC0Data; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC0Valid; // @[NeuromorphicProcessor.scala 13:21]
  wire [23:0] offCC_io_inC1Data; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC1Valid; // @[NeuromorphicProcessor.scala 13:21]
  wire [7:0] offCC_io_outCData; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_outCValid; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_outCReady; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC0HSin; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC0HSout; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC1HSin; // @[NeuromorphicProcessor.scala 13:21]
  wire  offCC_io_inC1HSout; // @[NeuromorphicProcessor.scala 13:21]
  wire  inCores_0_clock; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_reset; // @[NeuromorphicProcessor.scala 16:44]
  wire [23:0] inCores_0_io_offCCData; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_io_offCCValid; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_io_offCCHSin; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_io_offCCHSout; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_io_grant; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_0_io_req; // @[NeuromorphicProcessor.scala 16:44]
  wire [10:0] inCores_0_io_tx; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_clock; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_reset; // @[NeuromorphicProcessor.scala 16:44]
  wire [23:0] inCores_1_io_offCCData; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_io_offCCValid; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_io_offCCHSin; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_io_offCCHSout; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_io_grant; // @[NeuromorphicProcessor.scala 16:44]
  wire  inCores_1_io_req; // @[NeuromorphicProcessor.scala 16:44]
  wire [10:0] inCores_1_io_tx; // @[NeuromorphicProcessor.scala 16:44]
  wire  neuCores_0_clock; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_0_reset; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_0_io_grant; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_0_io_req; // @[NeuromorphicProcessor.scala 17:45]
  wire [10:0] neuCores_0_io_tx; // @[NeuromorphicProcessor.scala 17:45]
  wire [10:0] neuCores_0_io_rx; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_1_clock; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_1_reset; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_1_io_grant; // @[NeuromorphicProcessor.scala 17:45]
  wire  neuCores_1_io_req; // @[NeuromorphicProcessor.scala 17:45]
  wire [10:0] neuCores_1_io_tx; // @[NeuromorphicProcessor.scala 17:45]
  wire [10:0] neuCores_1_io_rx; // @[NeuromorphicProcessor.scala 17:45]
  wire  outCore_clock; // @[NeuromorphicProcessor.scala 18:23]
  wire  outCore_reset; // @[NeuromorphicProcessor.scala 18:23]
  wire [7:0] outCore_io_offCCData; // @[NeuromorphicProcessor.scala 18:23]
  wire  outCore_io_offCCValid; // @[NeuromorphicProcessor.scala 18:23]
  wire  outCore_io_offCCReady; // @[NeuromorphicProcessor.scala 18:23]
  wire  outCore_io_grant; // @[NeuromorphicProcessor.scala 18:23]
  wire  outCore_io_req; // @[NeuromorphicProcessor.scala 18:23]
  wire [10:0] outCore_io_tx; // @[NeuromorphicProcessor.scala 18:23]
  wire [10:0] outCore_io_rx; // @[NeuromorphicProcessor.scala 18:23]
  wire  busArbiter_clock; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_reset; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_reqs_0; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_reqs_1; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_reqs_2; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_reqs_3; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_reqs_4; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_grants_0; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_grants_1; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_grants_2; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_grants_3; // @[NeuromorphicProcessor.scala 43:26]
  wire  busArbiter_io_grants_4; // @[NeuromorphicProcessor.scala 43:26]
  wire [10:0] dataBusOr_0 = inCores_0_io_tx | inCores_1_io_tx; // @[NeuromorphicProcessor.scala 49:36]
  wire [10:0] dataBusOr_1 = dataBusOr_0 | neuCores_0_io_tx; // @[NeuromorphicProcessor.scala 52:38]
  wire [10:0] dataBusOr_2 = dataBusOr_1 | neuCores_1_io_tx; // @[NeuromorphicProcessor.scala 52:38]
  OffChipCom offCC ( // @[NeuromorphicProcessor.scala 13:21]
    .clock(offCC_clock),
    .reset(offCC_reset),
    .io_tx(offCC_io_tx),
    .io_rx(offCC_io_rx),
    .io_inC0Data(offCC_io_inC0Data),
    .io_inC0Valid(offCC_io_inC0Valid),
    .io_inC1Data(offCC_io_inC1Data),
    .io_inC1Valid(offCC_io_inC1Valid),
    .io_outCData(offCC_io_outCData),
    .io_outCValid(offCC_io_outCValid),
    .io_outCReady(offCC_io_outCReady),
    .io_inC0HSin(offCC_io_inC0HSin),
    .io_inC0HSout(offCC_io_inC0HSout),
    .io_inC1HSin(offCC_io_inC1HSin),
    .io_inC1HSout(offCC_io_inC1HSout)
  );
  InputCore inCores_0 ( // @[NeuromorphicProcessor.scala 16:44]
    .clock(inCores_0_clock),
    .reset(inCores_0_reset),
    .io_offCCData(inCores_0_io_offCCData),
    .io_offCCValid(inCores_0_io_offCCValid),
    .io_offCCHSin(inCores_0_io_offCCHSin),
    .io_offCCHSout(inCores_0_io_offCCHSout),
    .io_grant(inCores_0_io_grant),
    .io_req(inCores_0_io_req),
    .io_tx(inCores_0_io_tx)
  );
  InputCore_1 inCores_1 ( // @[NeuromorphicProcessor.scala 16:44]
    .clock(inCores_1_clock),
    .reset(inCores_1_reset),
    .io_offCCData(inCores_1_io_offCCData),
    .io_offCCValid(inCores_1_io_offCCValid),
    .io_offCCHSin(inCores_1_io_offCCHSin),
    .io_offCCHSout(inCores_1_io_offCCHSout),
    .io_grant(inCores_1_io_grant),
    .io_req(inCores_1_io_req),
    .io_tx(inCores_1_io_tx)
  );
  NeuronCore neuCores_0 ( // @[NeuromorphicProcessor.scala 17:45]
    .clock(neuCores_0_clock),
    .reset(neuCores_0_reset),
    .io_grant(neuCores_0_io_grant),
    .io_req(neuCores_0_io_req),
    .io_tx(neuCores_0_io_tx),
    .io_rx(neuCores_0_io_rx)
  );
  NeuronCore_1 neuCores_1 ( // @[NeuromorphicProcessor.scala 17:45]
    .clock(neuCores_1_clock),
    .reset(neuCores_1_reset),
    .io_grant(neuCores_1_io_grant),
    .io_req(neuCores_1_io_req),
    .io_tx(neuCores_1_io_tx),
    .io_rx(neuCores_1_io_rx)
  );
  OutputCore outCore ( // @[NeuromorphicProcessor.scala 18:23]
    .clock(outCore_clock),
    .reset(outCore_reset),
    .io_offCCData(outCore_io_offCCData),
    .io_offCCValid(outCore_io_offCCValid),
    .io_offCCReady(outCore_io_offCCReady),
    .io_grant(outCore_io_grant),
    .io_req(outCore_io_req),
    .io_tx(outCore_io_tx),
    .io_rx(outCore_io_rx)
  );
  BusArbiter busArbiter ( // @[NeuromorphicProcessor.scala 43:26]
    .clock(busArbiter_clock),
    .reset(busArbiter_reset),
    .io_reqs_0(busArbiter_io_reqs_0),
    .io_reqs_1(busArbiter_io_reqs_1),
    .io_reqs_2(busArbiter_io_reqs_2),
    .io_reqs_3(busArbiter_io_reqs_3),
    .io_reqs_4(busArbiter_io_reqs_4),
    .io_grants_0(busArbiter_io_grants_0),
    .io_grants_1(busArbiter_io_grants_1),
    .io_grants_2(busArbiter_io_grants_2),
    .io_grants_3(busArbiter_io_grants_3),
    .io_grants_4(busArbiter_io_grants_4)
  );
  assign io_uartTx = offCC_io_tx; // @[NeuromorphicProcessor.scala 22:13]
  assign offCC_clock = clock;
  assign offCC_reset = reset;
  assign offCC_io_rx = io_uartRx; // @[NeuromorphicProcessor.scala 23:15]
  assign offCC_io_outCData = outCore_io_offCCData; // @[NeuromorphicProcessor.scala 37:28]
  assign offCC_io_outCValid = outCore_io_offCCValid; // @[NeuromorphicProcessor.scala 38:28]
  assign offCC_io_inC0HSin = inCores_0_io_offCCHSout; // @[NeuromorphicProcessor.scala 29:28]
  assign offCC_io_inC1HSin = inCores_1_io_offCCHSout; // @[NeuromorphicProcessor.scala 35:28]
  assign inCores_0_clock = clock;
  assign inCores_0_reset = reset;
  assign inCores_0_io_offCCData = offCC_io_inC0Data; // @[NeuromorphicProcessor.scala 25:28]
  assign inCores_0_io_offCCValid = offCC_io_inC0Valid; // @[NeuromorphicProcessor.scala 26:28]
  assign inCores_0_io_offCCHSin = offCC_io_inC0HSout; // @[NeuromorphicProcessor.scala 28:28]
  assign inCores_0_io_grant = busArbiter_io_grants_0; // @[NeuromorphicProcessor.scala 63:31]
  assign inCores_1_clock = clock;
  assign inCores_1_reset = reset;
  assign inCores_1_io_offCCData = offCC_io_inC1Data; // @[NeuromorphicProcessor.scala 31:28]
  assign inCores_1_io_offCCValid = offCC_io_inC1Valid; // @[NeuromorphicProcessor.scala 32:28]
  assign inCores_1_io_offCCHSin = offCC_io_inC1HSout; // @[NeuromorphicProcessor.scala 34:28]
  assign inCores_1_io_grant = busArbiter_io_grants_1; // @[NeuromorphicProcessor.scala 63:31]
  assign neuCores_0_clock = clock;
  assign neuCores_0_reset = reset;
  assign neuCores_0_io_grant = busArbiter_io_grants_2; // @[NeuromorphicProcessor.scala 67:34]
  assign neuCores_0_io_rx = dataBusOr_2 | outCore_io_tx; // @[NeuromorphicProcessor.scala 65:34]
  assign neuCores_1_clock = clock;
  assign neuCores_1_reset = reset;
  assign neuCores_1_io_grant = busArbiter_io_grants_3; // @[NeuromorphicProcessor.scala 67:34]
  assign neuCores_1_io_rx = dataBusOr_2 | outCore_io_tx; // @[NeuromorphicProcessor.scala 65:34]
  assign outCore_clock = clock;
  assign outCore_reset = reset;
  assign outCore_io_offCCReady = offCC_io_outCReady; // @[NeuromorphicProcessor.scala 39:28]
  assign outCore_io_grant = busArbiter_io_grants_4; // @[NeuromorphicProcessor.scala 71:28]
  assign outCore_io_rx = dataBusOr_2 | outCore_io_tx; // @[NeuromorphicProcessor.scala 69:28]
  assign busArbiter_clock = clock;
  assign busArbiter_reset = reset;
  assign busArbiter_io_reqs_0 = inCores_0_io_req; // @[NeuromorphicProcessor.scala 62:29]
  assign busArbiter_io_reqs_1 = inCores_1_io_req; // @[NeuromorphicProcessor.scala 62:29]
  assign busArbiter_io_reqs_2 = neuCores_0_io_req; // @[NeuromorphicProcessor.scala 66:29]
  assign busArbiter_io_reqs_3 = neuCores_1_io_req; // @[NeuromorphicProcessor.scala 66:29]
  assign busArbiter_io_reqs_4 = outCore_io_req; // @[NeuromorphicProcessor.scala 70:29]
endmodule
