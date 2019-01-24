`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/24 16:23:01
// Design Name: 
// Module Name: add_v
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


module add_v(
	input clk,
	input rst_p,

	input data_i,
	input data_i_valid,

	output reg [1:0] data_o,
	output reg data_o_valid
    );

	reg [1:0] counter;
	reg data_i_1 = 1'b0;
	reg data_i_2 = 1'b0;
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
			counter <= 2'b0;
			data_o <= 2'b0;
			data_o_valid <= 1'b0;
		end
		else if (data_i_valid_2) begin
			data_o_valid <= 1'b1;
			if (data_i_2) begin
				counter <= 2'b0;
				data_o <= 2'b01;				//1
			end else begin
				if (counter == 2'b11) begin
					counter <= 2'b0;
					data_o <= 2'b11;			//v
				end else begin
					counter <= counter + 2'b1;
					data_o <= 2'b00;			//0
				end
			end
		end else begin
			data_o_valid <= 1'b0;
		end
	end

endmodule
