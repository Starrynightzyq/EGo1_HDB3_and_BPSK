`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/03 19:33:30
// Design Name: 
// Module Name: VGA_control
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


module VGA_control(
input vga_clk,
input rst,
output hsync,
output vsync,
output dat_act,
output reg[11:0]hcount=0,
output reg[11:0]vcount=0



    );
    wire hcount_over;
    wire vcount_over;
//    reg[9:0]hcount;
//    reg[9:0]vcount;
  /*  parameter hsync_end=10'd135,
    hdat_begin=10'd295,
    hdat_end=12'd1319,
    hpixel_end=12'd1343,
    vsync_end=10'd5,
    vdat_begin=10'd34,
    vdat_end=12'd802,
    vline_end=12'd805;*/
/*parameter hsync_end=12'd95,
    hdat_begin=12'd143,
    hdat_end=12'd783,
    hpixel_end=12'd799,
    vsync_end=12'd1,
    vdat_begin=12'd34,
    vdat_end=12'd514,
    vline_end=12'd524;*/
    
    parameter hsync_end=12'd119,
        hdat_begin=12'd183,
        hdat_end=12'd983,
        hpixel_end=12'd1039,
        vsync_end=12'd5,
        vdat_begin=12'd28,
        vdat_end=12'd628,
        vline_end=12'd665;
 
    always@(posedge vga_clk,negedge rst)begin
        if(!rst)
            hcount=10'd0;
        else if(hcount_over) begin
            hcount=10'd0;
        end   
        else begin
            hcount=hcount+1;
        end   
    end  
    assign hcount_over=(hcount==hpixel_end)?1'b1:1'b0;        
    always@(posedge vga_clk,negedge rst) begin
        if(!rst)
            vcount=0;
        else if(hcount_over) begin
            if(vcount_over) begin
                vcount=10'd0;
             end
             else begin
                vcount=vcount+1;
             end   
        end
   end                       
   assign vcount_over=(vcount== vline_end)?1'b1:1'b0;         
   assign dat_act=(hcount>=hdat_begin)&&(hcount<=hdat_end)&&(vcount>=vdat_begin)&&(vcount<=vdat_end); 
   assign hsync=(hcount>hsync_end);
   assign vsync=(vcount>vsync_end); 
    
    
endmodule

