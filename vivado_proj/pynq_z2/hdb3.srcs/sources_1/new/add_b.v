`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 18:52:27
// Design Name: 
// Module Name: add_b
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 加 b 操作
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_b(
	input clk,
	input rst_p,

	input [1:0] data_i,
	input data_i_valid,

	output reg [1:0] data_o,
	output reg data_o_valid
    );

	reg [1:0] buffer [2:0];	//移位寄存器
	reg buffer_valid [2:0];
	reg count01;		//01计数器
	reg first_v;		//11计数器
	reg appear_v;		//v 出现，用来处理第一个 v 前的情况
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

	always @(posedge clk) begin
		buffer[0] <= data_i_2;
		buffer[1] <= buffer[0];
		buffer[2] <= buffer[1];
	end

	always @(posedge clk) begin
		buffer_valid[0] <= data_i_valid_2;
		buffer_valid[1] <= buffer_valid[0];
		buffer_valid[2] <= buffer_valid[1];
	end

	always @(posedge clk or posedge rst_p) begin
		if (rst_p) begin
			// reset
			count01 <= 1'b0;
			first_v <= 1'b0;
			appear_v <= 1'b0;
		end
		else if (data_i_valid_2) begin
			if (data_i_2 == 2'b11) begin 	//11 -> v
				count01 <= 1'b0;
				first_v <= 1'b0;
				appear_v <= 1'b1;
			end else if (data_i_2 == 2'b01) begin 	//01 -> 1
				count01 <= count01 + 1'b1;
				first_v <= 1'b1;
			end else begin
				first_v <= 1'b1;
			end
		end
	end

	always @(posedge clk or posedge rst_p) begin
		if (rst_p) begin
			// reset
			data_o <= 2'b0;
			data_o_valid <= 1'b0;
		end
		else if (buffer_valid[2]) begin
			data_o_valid <= 1'b1;
			if ((count01 == 1'b0) && (first_v == 1'b1) && (data_i_2 == 2'b11) && (appear_v == 1'b1)) begin
				data_o <= 2'b10;		//b
			end else begin
				data_o <= buffer[2];
			end
		end else begin
			data_o_valid <= 1'b0;
		end
	end

endmodule
