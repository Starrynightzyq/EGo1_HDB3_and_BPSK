module VGA_top(
input clk,
input rst,
input [15:0]sdk_date,
input [15:0]sdk_date2,
input [15:0]x_location,
input WaveUp,
input WaveDown,
input [15:0]Frequency,
input [15:0]Vpp,
input [15:0]Vmax,
input [15:0]Vmin,
input [5:0]num1,
input [5:0]num2,
input [5:0]num3,
output hsync,
output vsync,
output[3:0]vga_r,
output[3:0]vga_g,
output[3:0]vga_b
    );
    wire[11:0] hcount;
    wire[11:0] vcount;
    wire locked;
    wire dat_act;
    wire [11:0]data1,data2,data3;
    assign{vga_r,vga_g,vga_b}=data1|data2|data3;
  
  vga_data2 U0(clk,rst,hcount,vcount,dat_act,sdk_date,sdk_date2,x_location,WaveUp,WaveDown,Frequency,Vpp,Vmax,Vmin,data1);
  VGA_control U1(clk,rst,hsync,vsync,dat_act,hcount,vcount);
  vga_data3 U2(clk,rst,dat_act,hcount,vcount,data2);
  vga_char_display U3(clk,rst,dat_act,hcount,vcount,num1,num2,num3,data3);
endmodule