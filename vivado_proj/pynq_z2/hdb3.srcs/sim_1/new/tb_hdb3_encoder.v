`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 15:39:26
// Design Name: 
// Module Name: tb_hdb3_encoder
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


module tb_hdb3_encoder();

	reg clk;
	reg rst_p;

	reg data_i;
	reg data_i_valid;

	// wire [1:0] data_o;
	wire BP;
	wire BN;
	wire data_o_valid;

	hdb3_encoder u_test_hdb3_encoder (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(data_i),
		.data_i_valid(data_i_valid),
		.BP(BP),
		.BN(BN),
		.data_o_valid(data_o_valid)
		);

	localparam T = 10;

	always begin
		#(T/2) clk = !clk;
	end

	//1	0	0	0	0	1	0	0	0	0	1	1	0	0	0	0	1

	initial begin
		clk = 1'b0;
		rst_p = 1'b1;
		data_i = 1'b0;
		data_i_valid = 1'b0;

		#(T*2) rst_p = 1'b0;
		data_i_valid = 1'b1;
		data_i = 1'b1;

		#(T) data_i = 1'b0;
		#(T) data_i = 1'b1;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b1;
		#(T) data_i = 1'b1;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b1;
		#(T) data_i = 1'b1;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;
		#(T) data_i = 1'b0;

		#(T) data_i_valid = 1'b0;

		#(T*20) $finish;
	end

endmodule
