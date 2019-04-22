`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/25 14:19:09
// Design Name: 
// Module Name: hdb3_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: hdb3 解码器
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hdb3_decoder(
	input clk,
	input rst_p,

	input data_i_p,
	input data_i_n,
	input data_i_valid,

	output reg data_o,
	output reg data_o_valid
    );

	reg [2:0] data_i_1 = 3'b0; // 输入打两拍
	reg [2:0] data_i_2 = 3'b0;
	reg [2:0] buffer [4:0];	//移位寄存器
	reg [2:0] buffer_next [4:0];	//移位寄存器

	reg[1:0]Count_0;
	reg[2:0]Data_OutP;

	// 输入打两拍
	always @(posedge clk) begin
		data_i_1 <= {data_i_valid, data_i_p, data_i_n};
		data_i_2 <= data_i_1;
	end

/*
	// 缓存
	always @(posedge clk) begin
		buffer[0] <= buffer_next[0];
		buffer[1] <= buffer_next[1];
		buffer[2] <= buffer_next[2];
		buffer[3] <= buffer_next[3];
		buffer[4] <= buffer_next[4];
	end

	// remove v and b
	always @(*) begin
		if(rst_p) begin
			buffer_next[0] = 3'b0;
			buffer_next[1] = 3'b0;
			buffer_next[2] = 3'b0;
			buffer_next[3] = 3'b0;
			buffer_next[4] = 3'b0;
		end else begin
			buffer_next[0] = data_i_2;
			buffer_next[1] = buffer[0];
			buffer_next[2] = buffer[1];
			buffer_next[3] = buffer[2];
			buffer_next[4] = buffer[3];
			if(((buffer_next[4][1:0] == 2'b10 && buffer_next[0][1:0] == 2'b10)
						||(buffer_next[4][1:0] == 2'b01 && buffer_next[0][1:0] == 2'b01))
						&&(buffer_next[3][1:0] == 2'b00 && buffer_next[2][1:0] == 2'b00 && buffer_next[1][1:0] == 2'b00)) begin
				buffer_next[1][1:0] = 2'b0;
				buffer_next[2][1:0] = 2'b0;
				buffer_next[3][1:0] = 2'b0;
				buffer_next[4][1:0] = 2'b0;
			end else if(((buffer_next[4][1:0] == 2'b10 && buffer_next[1][1:0] == 2'b10)
						||(buffer_next[4][1:0] == 2'b01 && buffer_next[1][1:0] == 2'b01))
						&&(buffer_next[3][1:0] == 2'b00 && buffer_next[2][1:0] == 2'b00)) begin
				buffer_next[1][1:0] = 2'b0;
				buffer_next[2][1:0] = 2'b0;
				buffer_next[3][1:0] = 2'b0;
				buffer_next[4][1:0] = 2'b0;
			end
		end
	end
*/

	always@(posedge clk)
	begin
		buffer[4]=buffer[3];
		buffer[3]=buffer[2];
		buffer[2]=buffer[1];
		buffer[1]=buffer[0];
		buffer[0]=data_i_2;	
		begin
			if(2'b0==buffer[0][1:0])
				Count_0=Count_0+2'b1;
			else if(2'b10==Count_0&&(2'b00==(buffer[0][1:0]^buffer[3][1:0])))
			begin
				buffer[0][1:0]=2'b00;
				buffer[3][1:0]=2'b00;
				Count_0=2'b0;
			end
			else if(2'b11==Count_0&&(2'b00==(buffer[0][1:0]^buffer[4][1:0])))
			begin
				buffer[0][1:0]=2'b0;
				Count_0=2'b0;
			end
			else// if(2'b01==buffer[0]||2'b10==buffer[0]||2'b11==buffer[0])
				Count_0=2'b0;
		end
		Data_OutP=buffer[4];	
	end

	// remove polar
	always @(posedge clk or posedge rst_p) begin : proc_data_o
		if(rst_p) begin
			data_o <= 1'b0;
			data_o_valid <= 1'b0;
		end else begin
			data_o <= Data_OutP[0]||Data_OutP[1];
			data_o_valid <= Data_OutP[2];
		end
	end // proc_data_o

endmodule
