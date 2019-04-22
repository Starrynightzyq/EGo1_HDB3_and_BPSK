`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/22 16:03:38
// Design Name: 
// Module Name: data_mem
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


module data_mem #(parameter DTAT_NUM = 800)(
	input clk,
	input ce,
	output reg data_o,
	output reg data_o_valid 
    );

	reg [0:0] inst_mem[0:DTAT_NUM-1];
	reg [$clog2(DTAT_NUM)-1:0] addr;

	initial $readmemb ( "C:/MyFiles/EGo1_HDB3_and_BPSK/matlab_proj/data.txt", inst_mem );

	always @ (posedge clk) begin
		if (ce == 1'b0) begin
			data_o <= 1'b0;
			data_o_valid <= 1'b0;
			addr <= 12'b0;
		end else if(addr < DTAT_NUM) begin
			data_o <= inst_mem[addr];
			data_o_valid <= 1'b1;
			addr <= addr + 12'b1;
		end else begin
			data_o <= 1'b0;
			data_o_valid <= 1'b0;
			addr <= addr;
		end
	end

endmodule
