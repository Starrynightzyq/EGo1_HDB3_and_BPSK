// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Jan 16 20:39:42 2019
// Host        : ZYQ-Mac-Win running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_tlast_gen_0_0_sim_netlist.v
// Design      : system_tlast_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "system_tlast_gen_0_0,tlast_gen,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "tlast_gen,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (aclk,
    resetn,
    pkt_length,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tlast,
    m_axis_tdata);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis:s_axis, ASSOCIATED_RESET resetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 resetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME resetn, POLARITY ACTIVE_LOW" *) input resetn;
  input [8:0]pkt_length;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) input [15:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef" *) output [15:0]m_axis_tdata;

  wire aclk;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [8:0]pkt_length;
  wire resetn;
  wire [15:0]s_axis_tdata;
  wire s_axis_tvalid;

  assign m_axis_tdata[15:0] = s_axis_tdata;
  assign m_axis_tvalid = s_axis_tvalid;
  assign s_axis_tready = m_axis_tready;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tlast_gen inst
       (.aclk(aclk),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .pkt_length(pkt_length),
        .resetn(resetn),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_tlast_gen
   (m_axis_tlast,
    aclk,
    s_axis_tvalid,
    m_axis_tready,
    resetn,
    pkt_length);
  output m_axis_tlast;
  input aclk;
  input s_axis_tvalid;
  input m_axis_tready;
  input resetn;
  input [8:0]pkt_length;

  wire aclk;
  wire \cnt[8]_i_1_n_0 ;
  wire \cnt[8]_i_4_n_0 ;
  wire [8:0]cnt_reg__0;
  wire m_axis_tlast;
  wire m_axis_tlast_carry__0_i_1_n_0;
  wire m_axis_tlast_carry__0_i_2_n_0;
  wire m_axis_tlast_carry__0_i_3_n_0;
  wire m_axis_tlast_carry__0_i_4_n_0;
  wire m_axis_tlast_carry__0_n_0;
  wire m_axis_tlast_carry__0_n_1;
  wire m_axis_tlast_carry__0_n_2;
  wire m_axis_tlast_carry__0_n_3;
  wire m_axis_tlast_carry__1_i_1_n_0;
  wire m_axis_tlast_carry__1_i_2_n_0;
  wire m_axis_tlast_carry__1_i_3_n_0;
  wire m_axis_tlast_carry__1_i_4_n_0;
  wire m_axis_tlast_carry__1_n_2;
  wire m_axis_tlast_carry__1_n_3;
  wire m_axis_tlast_carry_i_1_n_0;
  wire m_axis_tlast_carry_i_2_n_0;
  wire m_axis_tlast_carry_i_3_n_0;
  wire m_axis_tlast_carry_i_4_n_0;
  wire m_axis_tlast_carry_i_5_n_0;
  wire m_axis_tlast_carry_i_6_n_0;
  wire m_axis_tlast_carry_i_7_n_0;
  wire m_axis_tlast_carry_n_0;
  wire m_axis_tlast_carry_n_1;
  wire m_axis_tlast_carry_n_2;
  wire m_axis_tlast_carry_n_3;
  wire m_axis_tready;
  wire new_sample;
  wire [8:0]p_0_in;
  wire [8:0]pkt_length;
  wire resetn;
  wire s_axis_tvalid;
  wire [3:0]NLW_m_axis_tlast_carry_O_UNCONNECTED;
  wire [3:0]NLW_m_axis_tlast_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_m_axis_tlast_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_m_axis_tlast_carry__1_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg__0[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt_reg__0[0]),
        .I1(cnt_reg__0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg__0[0]),
        .I1(cnt_reg__0[1]),
        .I2(cnt_reg__0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg__0[1]),
        .I1(cnt_reg__0[0]),
        .I2(cnt_reg__0[2]),
        .I3(cnt_reg__0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt[4]_i_1 
       (.I0(cnt_reg__0[2]),
        .I1(cnt_reg__0[0]),
        .I2(cnt_reg__0[1]),
        .I3(cnt_reg__0[3]),
        .I4(cnt_reg__0[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt[5]_i_1 
       (.I0(cnt_reg__0[3]),
        .I1(cnt_reg__0[1]),
        .I2(cnt_reg__0[0]),
        .I3(cnt_reg__0[2]),
        .I4(cnt_reg__0[4]),
        .I5(cnt_reg__0[5]),
        .O(p_0_in[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[6]_i_1 
       (.I0(\cnt[8]_i_4_n_0 ),
        .I1(cnt_reg__0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[7]_i_1 
       (.I0(\cnt[8]_i_4_n_0 ),
        .I1(cnt_reg__0[6]),
        .I2(cnt_reg__0[7]),
        .O(p_0_in[7]));
  LUT4 #(
    .INIT(16'h80FF)) 
    \cnt[8]_i_1 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .I2(m_axis_tlast),
        .I3(resetn),
        .O(\cnt[8]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \cnt[8]_i_2 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .O(new_sample));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[8]_i_3 
       (.I0(cnt_reg__0[6]),
        .I1(\cnt[8]_i_4_n_0 ),
        .I2(cnt_reg__0[7]),
        .I3(cnt_reg__0[8]),
        .O(p_0_in[8]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt[8]_i_4 
       (.I0(cnt_reg__0[5]),
        .I1(cnt_reg__0[3]),
        .I2(cnt_reg__0[1]),
        .I3(cnt_reg__0[0]),
        .I4(cnt_reg__0[2]),
        .I5(cnt_reg__0[4]),
        .O(\cnt[8]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[0] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[0]),
        .Q(cnt_reg__0[0]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[1] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[1]),
        .Q(cnt_reg__0[1]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[2] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[2]),
        .Q(cnt_reg__0[2]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[3] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[3]),
        .Q(cnt_reg__0[3]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[4] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[4]),
        .Q(cnt_reg__0[4]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[5] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[5]),
        .Q(cnt_reg__0[5]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[6] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[6]),
        .Q(cnt_reg__0[6]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[7] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[7]),
        .Q(cnt_reg__0[7]),
        .R(\cnt[8]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt_reg[8] 
       (.C(aclk),
        .CE(new_sample),
        .D(p_0_in[8]),
        .Q(cnt_reg__0[8]),
        .R(\cnt[8]_i_1_n_0 ));
  CARRY4 m_axis_tlast_carry
       (.CI(1'b0),
        .CO({m_axis_tlast_carry_n_0,m_axis_tlast_carry_n_1,m_axis_tlast_carry_n_2,m_axis_tlast_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_m_axis_tlast_carry_O_UNCONNECTED[3:0]),
        .S({m_axis_tlast_carry_i_1_n_0,m_axis_tlast_carry_i_2_n_0,m_axis_tlast_carry_i_3_n_0,m_axis_tlast_carry_i_4_n_0}));
  CARRY4 m_axis_tlast_carry__0
       (.CI(m_axis_tlast_carry_n_0),
        .CO({m_axis_tlast_carry__0_n_0,m_axis_tlast_carry__0_n_1,m_axis_tlast_carry__0_n_2,m_axis_tlast_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_m_axis_tlast_carry__0_O_UNCONNECTED[3:0]),
        .S({m_axis_tlast_carry__0_i_1_n_0,m_axis_tlast_carry__0_i_2_n_0,m_axis_tlast_carry__0_i_3_n_0,m_axis_tlast_carry__0_i_4_n_0}));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__0_i_1
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__0_i_2
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__0_i_3
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__0_i_4
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__0_i_4_n_0));
  CARRY4 m_axis_tlast_carry__1
       (.CI(m_axis_tlast_carry__0_n_0),
        .CO({NLW_m_axis_tlast_carry__1_CO_UNCONNECTED[3],m_axis_tlast,m_axis_tlast_carry__1_n_2,m_axis_tlast_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_m_axis_tlast_carry__1_O_UNCONNECTED[3:0]),
        .S({1'b0,m_axis_tlast_carry__1_i_1_n_0,m_axis_tlast_carry__1_i_2_n_0,m_axis_tlast_carry__1_i_3_n_0}));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__1_i_1
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__1_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__1_i_2
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__1_i_2_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry__1_i_3
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry__1_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    m_axis_tlast_carry__1_i_4
       (.I0(pkt_length[4]),
        .I1(pkt_length[2]),
        .I2(pkt_length[0]),
        .I3(pkt_length[1]),
        .I4(pkt_length[3]),
        .I5(pkt_length[5]),
        .O(m_axis_tlast_carry__1_i_4_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry_i_1
       (.I0(pkt_length[7]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(pkt_length[8]),
        .O(m_axis_tlast_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9600)) 
    m_axis_tlast_carry_i_2
       (.I0(cnt_reg__0[6]),
        .I1(m_axis_tlast_carry__1_i_4_n_0),
        .I2(pkt_length[6]),
        .I3(m_axis_tlast_carry_i_5_n_0),
        .O(m_axis_tlast_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h8002200808800220)) 
    m_axis_tlast_carry_i_3
       (.I0(m_axis_tlast_carry_i_6_n_0),
        .I1(pkt_length[5]),
        .I2(m_axis_tlast_carry_i_7_n_0),
        .I3(pkt_length[4]),
        .I4(cnt_reg__0[5]),
        .I5(cnt_reg__0[4]),
        .O(m_axis_tlast_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h4002100808400210)) 
    m_axis_tlast_carry_i_4
       (.I0(cnt_reg__0[0]),
        .I1(pkt_length[2]),
        .I2(pkt_length[0]),
        .I3(pkt_length[1]),
        .I4(cnt_reg__0[2]),
        .I5(cnt_reg__0[1]),
        .O(m_axis_tlast_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h8484844221212118)) 
    m_axis_tlast_carry_i_5
       (.I0(cnt_reg__0[7]),
        .I1(cnt_reg__0[8]),
        .I2(pkt_length[7]),
        .I3(m_axis_tlast_carry__1_i_4_n_0),
        .I4(pkt_length[6]),
        .I5(pkt_length[8]),
        .O(m_axis_tlast_carry_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hAAA95556)) 
    m_axis_tlast_carry_i_6
       (.I0(pkt_length[3]),
        .I1(pkt_length[1]),
        .I2(pkt_length[0]),
        .I3(pkt_length[2]),
        .I4(cnt_reg__0[3]),
        .O(m_axis_tlast_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    m_axis_tlast_carry_i_7
       (.I0(pkt_length[2]),
        .I1(pkt_length[0]),
        .I2(pkt_length[1]),
        .I3(pkt_length[3]),
        .O(m_axis_tlast_carry_i_7_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
