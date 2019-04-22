library ieee;
use ieee.std_logic_1164.all;

entity AddB is
port(Clk:in std_logic;Data_In:in std_logic_vector(1 downto 0);
	 Data_OutB:out std_logic_vector(1 downto 0));
end AddB;

architecture AddB of AddB is
type array_4 is array(3 downto 0) of std_logic_vector(1 downto 0);
signal FirstV:std_logic;
signal Buf:array_4;
signal Count_Even:integer range 0 to 1;

begin
	ShuChu:process(Clk)
	begin
		if( Clk='1' and Clk'event)then
			if(FirstV='1' and Count_Even=0 and Buf(0)="11")then
				Data_OutB<="10";
			else Data_OutB<=Buf(3);
			end if;
--			Data_OutB<=(FirstV='1'&&Count_Even=0&&Buf[0]="11")?"10":Buf(3);
		end if;
	end process ShuChu;

	Buff:process(Clk)
	begin
		if( Clk='1' and Clk'event)then
		Buf(0)<=Data_In;
		Buf(1)<=Buf(0);
		Buf(2)<=Buf(1);
		Buf(3)<=Buf(2);
		end if;
	end process Buff;

	Count:process(Clk)
	begin
		if( Clk='1' and Clk'event)then
			if("01"=Buf(3))then            --here we judge the high bit of Buffer,because Data_OutB 									 
				Count_Even<=Count_Even+1;		--is usually assigned as Buffer[3];
			elsif("11"=Buf(0))then	--here we judge the low bit of Buffer,because if Buffer[0] 
				Count_Even<=0;		--is 2'b11.then Buffer[1],Buffer[2],Buffer[3] is 2'b00,so we 	
			end if;					--should not conut Buffer[3];
		end if;
	end process Count;

	JudgeV:process(Clk)
	begin
		if( Clk='1' and Clk'event)then
			if("11"=Buf(0)) then --Judeg if it is the first coming of 'v',if it is ,hten FisrtV is 1;
				if('0'=FirstV)then
					FirstV<='1';
				end if;
			end if;
		end if;
	end process JudgeV;

end Addb;