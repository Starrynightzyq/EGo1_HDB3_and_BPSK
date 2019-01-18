`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/24 13:21:24
// Design Name: 
// Module Name: adc_reader
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module adc_reader(
	input clk,
	input rst_p,

	//drp
	output [15:0] di_in,      
	output [6:0] daddr_in,
	output den_in,    
	output dwe_in,    
	input drdy_out,
	input [15:0] do_out,

	input eoc_out,
	input [4:0] channel_out,

	//output
	output [15:0] ad0_o,
	output ad0_valid
    );
endmodule
