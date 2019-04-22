`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 22:05:00
// Design Name: 
// Module Name: polar
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 单双极性变换
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module polar #(
	parameter FIRST_POLAR = 1'b0	// 1 表示首位取正，0 表示首位取负
	)(
	input clk,
	input rst_p,

	input [1:0] data_i,
	input data_i_valid,

	// output reg [1:0] data_o,
	output BP,
	output BN,
	output reg data_o_valid
    );

	reg even = FIRST_POLAR;				// 极性标志位
	reg [1:0] data_o; 		// 00 -> 0, 01 -> +1, 10 -> -1
	reg [1:0] data_i_1 = 1'b0;
	reg [1:0] data_i_2 = 1'b0;
	reg data_i_valid_1 = 1'b0;
	reg data_i_valid_2 = 1'b0;

	always @(posedge clk) begin
		data_i_1 <= data_i;
		data_i_2 <= data_i_1;
	end

	always @(posedge clk) begin
		data_i_valid_1 <= data_i_valid;
		data_i_valid_2 <= data_i_valid_1;
	end

	always @(posedge clk or posedge rst_p) begin
		if (rst_p) begin
			// reset
			data_o <= 2'b0;
			even <= FIRST_POLAR;
		end
		else if (data_i_valid_2) begin
			data_o_valid <= 1'b1;
			if (data_i_2 == 2'b00) begin 									// 0 零电平
				data_o <= 2'b00;
			end else if ((data_i_2 == 2'b01) || (data_i_2 == 2'b10)) begin 	// 1 or b 极性交替变化
				if (even == 1'b1) begin
					data_o <= 2'b01;									// +1
					even <= ~even;										// 符号标志位取反
				end else begin
					data_o <= 2'b10;									// -1
					even <= ~even;										// 符号标志位取反
				end
			end else begin 												// v 极性与前一个非 0 位相同
				if (even == 1'b1) begin
					data_o <= 2'b10; 									// -1
				end else begin
					data_o <= 2'b01;									// +1
				end
			end
		end else begin
			data_o_valid <= 1'b0;
		end
	end

	assign {BN, BP} = data_o;

endmodule
