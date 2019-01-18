// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Jan 16 20:39:44 2019
// Host        : ZYQ-Mac-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/MyFiles/EGo1_HDB3_and_BPSK/vivado_proj/DMA/dma.srcs/sources_1/bd/system/ip/system_tlast_gen_0_0/system_tlast_gen_0_0_stub.v
// Design      : system_tlast_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "tlast_gen,Vivado 2018.2" *)
module system_tlast_gen_0_0(aclk, resetn, pkt_length, s_axis_tvalid, 
  s_axis_tready, s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tlast, m_axis_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,resetn,pkt_length[8:0],s_axis_tvalid,s_axis_tready,s_axis_tdata[15:0],m_axis_tvalid,m_axis_tready,m_axis_tlast,m_axis_tdata[15:0]" */;
  input aclk;
  input resetn;
  input [8:0]pkt_length;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output m_axis_tlast;
  output [15:0]m_axis_tdata;
endmodule
