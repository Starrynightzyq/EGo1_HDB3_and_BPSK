module AddB(Clk,Data_In,Data_OutB);
input Clk;
input[1:0] Data_In;
output reg[1:0] Data_OutB;
reg[1:0] Buffer[4];
reg FirstV;
reg Count_Even;//Count_Even only can be assigned as 0 or 1;so 0 is stand for even,1 is stand for odd

always@(posedge Clk)
Data_OutB=(FirstV==1'b1&&Count_Even==1'b0&&Buffer[0]==2'b11)?2'b10:Buffer[3];

always@(posedge Clk)    //take in turn of coming into the register Buffer;
begin
	Buffer[0]<=Data_In;
	Buffer[1]<=Buffer[0];
	Buffer[2]<=Buffer[1];
	Buffer[3]<=Buffer[2];
end

always@(posedge Clk)
begin
	if(2'b01==Buffer[3])            //here we judge the high bit of Buffer,because Data_OutB 									 
		Count_Even<=Count_Even+1'b1;		//is usually assigned as Buffer[3];
	else if(2'b11==Buffer[0])	//here we judge the low bit of Buffer,because if Buffer[0] 
		Count_Even<=1'b0;		//is 2'b11.then Buffer[1],Buffer[2],Buffer[3] is 2'b00,so we 	
end								//should not conut Buffer[3];

always@(posedge Clk)
begin
	if(2'b11==Buffer[0])   //Judeg if it is the first coming of 'v',if it is ,hten FisrtV is 1;
		if(1'b0==FirstV)
			FirstV<=1'b1;
end

endmodule

