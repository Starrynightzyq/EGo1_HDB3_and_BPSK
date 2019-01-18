`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/28 11:21:07
// Design Name: 
// Module Name: vga_char_display
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


module vga_char_display(
    input clk,
    input rst,
    input dat_act,
    input [11:0]hcount,
    input [11:0]vcount,
    input [5:0]num1,
    input [5:0]num2,
    input [5:0]num3,
//    input [5:0]num4,
//    input [5:0]num5,
//    input [5:0]num6,
//    input [5:0]num7,
    output reg[11:0]data=0
    );


// 屏幕中央两个字符的显示区域
parameter up_pos1 = 578;
parameter down_pos1 = 585;
parameter left_pos1 = 185;
parameter right_pos1 = 219;

//parameter up_pos2 = 586;
//parameter down_pos2 = 593;
//parameter left_pos2 = 185;
//parameter right_pos2 = 226;

wire [7:0] p[35:0];
//wire [7:0] q[13:0];

ram_set u_ram_1 (
    .clk(clk),
    .rst(rst),
    .data(6'b00_1010),
    .col0(p[0]),
    .col1(p[1]),
    .col2(p[2]),
    .col3(p[3]),
    .col4(p[4]),
    .col5(p[5]),
    .col6(p[6])
);
ram_set U0 (
    .clk(clk),
    .rst(rst),
    .data(6'b11_1111),
    .col0(p[7]),
    .col1(p[8]),
    .col2(p[9]),
    .col3(p[10]),
    .col4(p[11]),
    .col5(p[12]),
    .col6(p[13])
);
ram_set U1 (
    .clk(clk),
    .rst(rst),
    .data(num1),
    .col0(p[14]),
    .col1(p[15]),
    .col2(p[16]),
    .col3(p[17]),
    .col4(p[18]),
    .col5(p[19]),
    .col6(p[20])
);
ram_set U2 (
    .clk(clk),
    .rst(rst),
    .data(num2),
    .col0(p[21]),
    .col1(p[22]),
    .col2(p[23]),
    .col3(p[24]),
    .col4(p[25]),
    .col5(p[26]),
    .col6(p[27])
);
ram_set U3 (
    .clk(clk),
    .rst(rst),
    .data(num3),
    .col0(p[28]),
    .col1(p[29]),
    .col2(p[30]),
    .col3(p[31]),
    .col4(p[32]),
    .col5(p[33]),
    .col6(p[34])
);

//ram_set u_ram_2 (
//    .clk(clk),
//    .rst(rst),
//    .data(6'b00_1010),
//    .col0(q[0]),
//    .col1(q[1]),
//    .col2(q[2]),
//    .col3(q[3]),
//    .col4(q[4]),
//    .col5(q[5]),
//    .col6(q[6])
//);
//ram_set u0 (
//    .clk(clk),
//    .rst(rst),
//    .data(6'b11_1111),
//    .col0(q[7]),
//    .col1(q[8]),
//    .col2(q[9]),
//    .col3(q[10]),
//    .col4(q[11]),
//    .col5(q[12]),
//    .col6(q[13])
//);
//ram_set u1 (
//    .clk(clk),
//    .rst(rst),
//    .data(num4),
//    .col0(q[7]),
//    .col1(q[8]),
//    .col2(q[9]),
//    .col3(q[10]),
//    .col4(q[11]),
//    .col5(q[12]),
//    .col6(q[13])
//);
//ram_set u2 (
//    .clk(clk),
//    .rst(rst),
//    .data(num5),
//    .col0(q[7]),
//    .col1(q[8]),
//    .col2(q[9]),
//    .col3(q[10]),
//    .col4(q[11]),
//    .col5(q[12]),
//    .col6(q[13])
//);
//ram_set u3 (
//    .clk(clk),
//    .rst(rst),
//    .data(num6),
//    .col0(q[7]),
//    .col1(q[8]),
//    .col2(q[9]),
//    .col3(q[10]),
//    .col4(q[11]),
//    .col5(q[12]),
//    .col6(q[13])
//);
//ram_set u4 (
//    .clk(clk),
//    .rst(rst),
//    .data(num7),
//    .col0(q[7]),
//    .col1(q[8]),
//    .col2(q[9]),
//    .col3(q[10]),
//    .col4(q[11]),
//    .col5(q[12]),
//    .col6(q[13])
//);

always@(posedge clk)
begin
        if(!dat_act) 
        begin
            data<=0;
        end 
        else begin
        
        if (vcount>=up_pos1 && vcount<=down_pos1 && hcount>=left_pos1 && hcount<=right_pos1) begin
            if (p[hcount-left_pos1][vcount-up_pos1]) begin
                data<=12'hfff;
            end
            else begin
                data<=0;
            end     
        end
        
//        if (vcount>=up_pos2 && vcount<=down_pos2 && hcount>=left_pos2 && hcount<=right_pos2) begin
//            if (q[hcount-left_pos2][vcount-up_pos2]) begin
//                data<=12'hfff;
//            end
//            else begin
//                data<=0;
//            end     
//        end

        end 
end
endmodule
