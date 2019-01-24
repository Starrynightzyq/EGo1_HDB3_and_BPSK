`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 18:36:53
// Design Name: 
// Module Name: tb_add_v
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


module tb_add_v();

	reg clk;
	reg rst_p;

	reg data_i;
	reg data_i_valid;

	wire [1:0] data_o;
	wire data_o_valid;

	add_v u_test_adda_v (
		.clk(clk),
		.rst_p(rst_p),
		.data_i(data_i),
		.data_i_valid(data_i_valid),
		.data_o(data_o),
		.data_o_valid(data_o_valid)
		);

	localparam T = 10;

	always begin
		#(T/2) clk = !clk;
	end

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
		#(T) data_i = 1'b1;
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

		#(T) data_i_valid = 1'b0;

		#(T*5) $finish;
	end

endmodule
