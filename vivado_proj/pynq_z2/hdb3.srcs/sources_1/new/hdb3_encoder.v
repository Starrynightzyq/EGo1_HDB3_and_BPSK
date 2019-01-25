`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 14:18:01
// Design Name: 
// Module Name: hdb3_encoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: hdb3 编码器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hdb3_encoder #(
	parameter FIRST_POLAR = 1	/*1 表示第一个非0符取+1，0表示第一个非0符取-1*/
	)(
	input clk,
	input rst_p,

	input data_i,
	input data_i_valid,

	output BP,
	output BN,
	output data_o_valid
    );

	wire [1:0] v_data_o;
	wire v_data_o_valid;
	wire [1:0] b_data_o;
	wire b_data_o_valid;

	add_v u_adda_v (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(data_i),
		.data_i_valid(data_i_valid),
		.data_o(v_data_o),
		.data_o_valid(v_data_o_valid)
		);

	add_b u_adda_b (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(v_data_o),
		.data_i_valid(v_data_o_valid),
		.data_o(b_data_o),
		.data_o_valid(b_data_o_valid)
		);
	
	polar #(
		.FIRST_POLAR(FIRST_POLAR)
		) u_polar (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(b_data_o),
		.data_i_valid(b_data_o_valid),
		// .data_o(data_o),
		.BP(BP),
		.BN(BN),
		.data_o_valid(data_o_valid)
		);

endmodule
