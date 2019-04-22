module Polar(Clk,Data_In,True_Code);
input Clk;
input[1:0]Data_In;
output reg True_Code;
always@(posedge Clk)
begin
	if(2'b01==Data_In||2'b10==Data_In)
		True_Code<=1'b1;
	else if(2'b00==Data_In)
		True_Code<=1'b0;
end

endmodule