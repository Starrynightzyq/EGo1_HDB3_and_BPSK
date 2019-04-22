`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 20:45:25
// Design Name: 
// Module Name: hdb3
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


module hdb3(
	input clk,
	input rst_p,

	input data_i,
	input data_i_valid,

	output data_o,
	output data_o_valid
    );

	wire BP;
	wire BN;
	wire encoder_data_o_valid;

	hdb3_encoder u_hdb3_encoder (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(data_i),
		.data_i_valid(data_i_valid),
		.BP(BP),
		.BN(BN),
		.data_o_valid(encoder_data_o_valid)
		);


	hdb3_decoder u_hdb3_decoder (
		.clk(clk),
		.rst_p(rst_p),
		.data_i_p(BP),
		.data_i_n(BN),
		.data_i_valid(encoder_data_o_valid),
		.data_o(data_o),
		.data_o_valid(data_o_valid)
		);

endmodule
