module Polar(Clk,Data_In,Hdb3);
input Clk;
input[1:0]Data_In;
output reg[1:0]Hdb3;
reg FlagP;

always@(posedge Clk)
begin
	if(2'b01==Data_In||2'b10==Data_In)
	begin
		FlagP<=FlagP+1'b1;  //FlagP stands for if we should make the code number negetive
		if(1'b1==FlagP)    //if FlagP is 1,we should output -1
			Hdb3<=2'b10;
		else Hdb3<=2'b01;
	end
	else if(2'b11==Data_In) //if it is 'v',we should make sure it is the same polar of the pre 'b' or '1'
	begin
		if(1'b1==FlagP)  //if FlagP is 1,we should output +1
			Hdb3<=2'b01;
		else Hdb3<=2'b10;
	end
	else if(2'b00==Data_In)  //here stay the same
			Hdb3<=2'b00;
end

endmodule