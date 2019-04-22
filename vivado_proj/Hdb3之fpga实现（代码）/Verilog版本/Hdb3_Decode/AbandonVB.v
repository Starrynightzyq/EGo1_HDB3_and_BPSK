module AbandonVB(Clk,Hdb3,Data_OutP);
input Clk;
input[1:0]Hdb3;
output reg[1:0] Data_OutP;
reg[1:0]Buffer[5];
reg[1:0]Count_0;

always@(posedge Clk)
begin
	Buffer[4]=Buffer[3];
	Buffer[3]=Buffer[2];
	Buffer[2]=Buffer[1];
	Buffer[1]=Buffer[0];
	Buffer[0]=Hdb3;	
	begin
		if(2'b0==Buffer[0])
			Count_0=Count_0+2'b1;
		else if(2'b10==Count_0&&(2'b00==(Buffer[0]^Buffer[3])))
		begin
			Buffer[0]=2'b00;
			Buffer[3]=2'b00;
			Count_0=2'b0;
		end
		else if(2'b11==Count_0&&(2'b00==(Buffer[0]^Buffer[4])))
		begin
			Buffer[0]=2'b0;
			Count_0=2'b0;
		end
	   else// if(2'b01==Buffer[0]||2'b10==Buffer[0]||2'b11==Buffer[0])
			Count_0=2'b0;
	end
	Data_OutP=Buffer[4];	
end

endmodule