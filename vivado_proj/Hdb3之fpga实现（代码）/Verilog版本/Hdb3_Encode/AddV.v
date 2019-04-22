module AddV(Clk,Data_In,Data_OutV);

input Clk,Data_In;
output reg [1:0]Data_OutV;
reg[1:0]Count0;


always@(posedge Clk)
begin
	if(Data_In==1'b1)
		begin
			Data_OutV<=2'b01;
			Count0<=2'b0;
		end
	else if(Data_In==1'b0)
		begin
			Count0<=Count0+2'b1; 
			if(Count0==2'b11)//because it is parall,so it is 3,not 4
			begin
				Count0<=2'b0;
				Data_OutV<=2'b11;
			end
			else Data_OutV<=2'b00;
		end				
end

endmodule

