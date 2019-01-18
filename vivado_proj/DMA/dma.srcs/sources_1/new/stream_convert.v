`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/09 20:42:32
// Design Name: 
// Module Name: stream_convert
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


module stream_convert #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXIS
		parameter integer C_S_AXIS_TDATA_WIDTH	= 32,

		// Parameters of Axi Master Bus Interface M_AXIS
		parameter integer C_M_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M_AXIS_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXIS
		input wire  s_axis_aclk,
		input wire  s_axis_aresetn,
		output wire  s_axis_tready,
		input wire [15 : 0] s_axis_tdata,	//data
		input wire [4 : 0] s_axis_tid,		//channel
		input wire  s_axis_tvalid,

		// Ports of Axi Master Bus Interface M_AXIS
		input wire  m_axis_aclk,
		input wire  m_axis_aresetn,
		output wire  m_axis_tvalid,
		output wire [C_M_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata,
		output wire [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tstrb,
		output wire  m_axis_tlast,
		input wire  m_axis_tready
	);
	
	reg  axis_tvalid_0;
	reg [C_M_AXIS_TDATA_WIDTH-1 : 0] axis_tdata_0;
	reg [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] axis_tstrb_0;
	reg  axis_tlast_0;

	reg  axis_tvalid_1;
	reg [C_M_AXIS_TDATA_WIDTH-1 : 0] axis_tdata_1;
	reg [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] axis_tstrb_1;
	reg  axis_tlast_1;

	reg  axis_tvalid_2;
	reg [C_M_AXIS_TDATA_WIDTH-1 : 0] axis_tdata_2;
	reg [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] axis_tstrb_2;
	reg  axis_tlast_2;

	always @(posedge m_axis_aclk or negedge m_axis_aresetn) begin
		if (!m_axis_aresetn) begin
			// reset
			axis_tvalid_0 <= 1'b0;
			axis_tvalid_1 <= 1'b0;
			axis_tvalid_2 <= 1'b0;
		end
		else begin
			axis_tvalid_0 <= s_axis_tvalid;
			axis_tvalid_1 <= axis_tvalid_0;
			axis_tvalid_2 <= axis_tvalid_1;
		end
	end

	always @(posedge m_axis_aclk or negedge m_axis_aresetn) begin
		if (!m_axis_aresetn) begin
			// reset
			axis_tdata_0 <= 0;
			axis_tdata_1 <= 0;
			axis_tdata_2 <= 0;
		end
		else begin
			axis_tdata_0 <= {11'b0, s_axis_tid, s_axis_tdata};
			axis_tdata_1 <= axis_tdata_0;
			axis_tdata_2 <= axis_tdata_1;
		end
	end

	always @(posedge m_axis_aclk or negedge m_axis_aresetn) begin
		if (!m_axis_aresetn) begin
			// reset
			axis_tlast_0 <= 1'b1;
			axis_tlast_1 <= 1'b1;
			axis_tlast_2 <= 1'b1;
		end
		else begin
			axis_tlast_0 <= 1'b0;
			axis_tlast_1 <= axis_tlast_0;
			axis_tlast_2 <= axis_tlast_1;
		end
	end

	assign s_axis_tready = 1'b1;
	assign m_axis_tvalid = axis_tvalid_2;
	assign m_axis_tdata = axis_tdata_2;
	assign m_axis_tstrb = 4'b0111;
	assign m_axis_tlast = 1'b0;


endmodule
