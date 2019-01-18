//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Mon Dec 24 11:17:30 2018
//Host        : ZYQ-Mac-Win running 64-bit major release  (build 9200)
//Command     : generate_target Microblaze_wrapper.bd
//Design      : Microblaze_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Microblaze_wrapper
   (Vauxn0,
    Vauxp0,
    Vn_in,
    Vp_in,
    button_tri_i,
    clk_100MHz,
    hsync,
    reset_rtl_0,
    uart_rtl_0_rxd,
    uart_rtl_0_txd,
    vga_b,
    vga_g,
    vga_r,
    vsync);
  input Vauxn0;
  input Vauxp0;
  input Vn_in;
  input Vp_in;
  input [4:0]button_tri_i;
  input clk_100MHz;
  output hsync;
  input reset_rtl_0;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;
  output [3:0]vga_b;
  output [3:0]vga_g;
  output [3:0]vga_r;
  output vsync;

  wire Vauxn0;
  wire Vauxp0;
  wire Vn_in;
  wire Vp_in;
  wire [4:0]button_tri_i;
  wire clk_100MHz;
  wire hsync;
  wire reset_rtl_0;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;
  wire [3:0]vga_b;
  wire [3:0]vga_g;
  wire [3:0]vga_r;
  wire vsync;

  Microblaze Microblaze_i
       (.Vauxn0(Vauxn0),
        .Vauxp0(Vauxp0),
        .Vn_in(Vn_in),
        .Vp_in(Vp_in),
        .button_tri_i(button_tri_i),
        .clk_100MHz(clk_100MHz),
        .hsync(hsync),
        .reset_rtl_0(reset_rtl_0),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .vga_b(vga_b),
        .vga_g(vga_g),
        .vga_r(vga_r),
        .vsync(vsync));
endmodule
