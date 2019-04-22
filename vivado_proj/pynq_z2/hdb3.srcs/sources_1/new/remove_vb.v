`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 19:10:42
// Design Name: 
// Module Name: remove_vb
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


module remove_vb(
	input clk,
	input rst_p,

	input data_i_p,
	input data_i_n,
	input data_i_valid,

	output reg [1:0] data_o,
	output reg data_o_valid
    );

	reg [1:0] data_i_1 = 1'b0; // 输入打两拍
	reg [1:0] data_i_2 = 1'b0;
	reg data_i_valid_1 = 1'b0;
	reg data_i_valid_2 = 1'b0;
	reg [1:0] buffer [4:0];	//移位寄存器
	reg buffer_valid [4:0];

	// 输入打两拍
	always @(posedge clk) begin
		data_i_1 <= {data_i_p, data_i_n};
		data_i_2 <= data_i_1;
	end

	always @(posedge clk) begin
		data_i_valid_1 <= data_i_valid;
		data_i_valid_2 <= data_i_valid_1;
	end

	// 缓存
	always_ff @(posedge clk) begin : proc_buffer
		buffer[0] <= data_i_2;
		buffer[1] <= buffer[0];
		buffer[2] <= buffer[1];
		buffer[3] <= buffer[2];
		buffer[4] <= buffer[3];
	end
	
	always @(posedge clk) begin
		buffer_valid[0] <= data_i_valid_2;
		buffer_valid[1] <= buffer_valid[0];
		buffer_valid[2] <= buffer_valid[1];
		buffer_valid[3] <= buffer_valid[2];
		buffer_valid[4] <= buffer_valid[3];
	end

	always @(posedge clk or negedge rst_p) begin : proc_
		if(~rst_p) begin
			 <= 0;
		end else begin
			 <= ;
		end
	end


endmodule
