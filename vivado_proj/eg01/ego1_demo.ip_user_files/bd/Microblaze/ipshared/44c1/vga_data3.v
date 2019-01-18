`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/11 08:31:21
// Design Name: 
// Module Name: vga_data3
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


module vga_data3(
input vga_clk,
input rst,
input dat_act,
input [11:0]hcount,
input [11:0]vcount,
output reg[11:0]data=0

    );
    wire[11:0]x_dis;
    wire[11:0]y_dis;
    assign x_dis=hcount-183;
    assign y_dis=vcount-28;  
    reg [11:0] count=0;
    
     always@(posedge vga_clk)
       begin
           if(!dat_act) 
               begin
                   data<=0;
               end   
           else begin
               if(y_dis==300||y_dis==360||y_dis==420||y_dis==480||y_dis==540||y_dis==240||y_dis==180||y_dis==120||y_dis==60)
                   data<=12'hfff;     
               else 
                   if((y_dis>=60)&&(y_dis<=540))
   
                       if(x_dis==0||x_dis==40||x_dis==80||x_dis==120||x_dis==160||x_dis==200||x_dis==240||x_dis==280||x_dis==320||x_dis==360||x_dis==400||x_dis==440||x_dis==480||x_dis==520||x_dis==560||x_dis==600||x_dis==640||x_dis==680||x_dis==720||x_dis==760||x_dis==800)
                           data<=12'hfff;
                       else data<=12'h000;
                       end
                       end
endmodule
