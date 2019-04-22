`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 20:50:37
// Design Name: 
// Module Name: tb_hdb3
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


module tb_hdb3();

	reg clk;
	reg rst_p;
	wire data_i;
	wire data_i_valid;
	wire data_o;
	wire data_o_valid;

	data_mem u_data_mem (
		.clk(clk),
		.ce(!rst_p),
		.data_o(data_i),
		.data_o_valid(data_i_valid)
		);

	hdb3 u_test_hdb3 (
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

		#(T*2) rst_p = 1'b0;

		#(T*900) $finish;
	end

endmodule
