import chisel3._
import chisel3.util._
import Constants._
import spray.json._
import chisel3.util.experimental.loadMemoryFromFile
import firrtl.annotations.MemoryLoadFileType




class neuron_top(coreID : Int) extends BlackBox(Map("io_coreID" -> coreID)) { {
  val io = IO(new Bundle() {
    //Clock and Reset Ports must be explicitly declared
    val clock     = Input(Clock())
    val reset     = Input(Reset())
    //For axon system
    val io_inOut    = Output(Bool())
    val io_spikeCnt = Input(UInt(AXONIDWIDTH.W))
    val io_aAddr    = Output(UInt(AXONIDWIDTH.W))
    val io_aEna     = Output(Bool())
    val io_aData    = Input(UInt(AXONIDWIDTH.W))
    //For spike transmission system
    val io_n        = Output(UInt(N.W))
    val io_spikes_0 = Output(Bool())
    val io_spikes_1 = Output(Bool())
    val io_spikes_2 = Output(Bool())
    val io_spikes_3 = Output(Bool())
    val io_spikes_4 = Output(Bool())
    val io_spikes_5 = Output(Bool())
    val io_spikes_6 = Output(Bool())
    val io_spikes_7 = Output(Bool())
  })
}

class Neurons(coreID: Int) extends Module {
  val io = IO(new Bundle {
    //For axon system
    val inOut    = Output(Bool())
    val spikeCnt = Input(UInt(AXONIDWIDTH.W))
    val aAddr    = Output(UInt(AXONIDWIDTH.W))
    val aEna     = Output(Bool())
    val aData    = Input(UInt(AXONIDWIDTH.W))
    //For spike transmission system
    val n        = Output(UInt(N.W))
    val spikes   = Output(Vec(EVALUNITS, Bool()))
  })

  val newBlock = Module(new neuron_top(coreID))
  newBlock.io.clock       := clock
  // newBlock.io.reset       := reset
  io.inOut                := newBlock.io.io_inOut
  newBlock.io.io_spikeCnt := io.spikeCnt
  io.aAddr                := newBlock.io.io_aAddr
  io.aEna                 := newBlock.io.io_aEna
  newBlock.io.io_aData    := io.aData

  io.n                    := newBlock.io.io_n
  io.spikes(0) := newBlock.io.io_spikes_0
  io.spikes(1) := newBlock.io.io_spikes_1
  io.spikes(2) := newBlock.io.io_spikes_2
  io.spikes(3) := newBlock.io.io_spikes_3
  io.spikes(4) := newBlock.io.io_spikes_4
  io.spikes(5) := newBlock.io.io_spikes_5
  io.spikes(6) := newBlock.io.io_spikes_6
  io.spikes(7) := newBlock.io.io_spikes_7

}

