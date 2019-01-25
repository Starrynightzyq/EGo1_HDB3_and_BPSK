`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 15:22:36
// Design Name: 
// Module Name: tb_polar
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


module tb_polar();

	reg clk;
	reg rst_p;

	reg [1:0] data_i;
	reg data_i_valid;

	// wire [1:0] data_o;
	wire BP;
	wire BN;
	wire data_o_valid;

	polar u_test_polar (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(data_i),
		.data_i_valid(data_i_valid),
		// .data_o(data_o),
		.BP(BP),
		.BN(BN),
		.data_o_valid(data_o_valid)
		);

	localparam T = 10;

	always begin
		#(T/2) clk = !clk;
	end

	initial begin
		clk = 1'b0;
		rst_p = 1'b1;
		data_i = 2'b0;
		data_i_valid = 1'b0;

		#(T*2) rst_p = 1'b0;
		data_i_valid = 1'b1;
		data_i = 2'b1;

		#(T) data_i = 2'b0;
		#(T) data_i = 2'b1;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b1;
		#(T) data_i = 2'b1;
		#(T) data_i = 2'b10;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b11;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b1;
		#(T) data_i = 2'b1;
		#(T) data_i = 2'b10;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b0;
		#(T) data_i = 2'b11;
		#(T) data_i = 2'b1;

		#(T) data_i_valid = 1'b0;

		#(T*7) $finish;
	end

endmodule
