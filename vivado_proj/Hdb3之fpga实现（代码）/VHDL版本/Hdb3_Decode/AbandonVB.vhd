library ieee;
use ieee.std_logic_1164.all;

entity AbandonVB is 
port(Clk:in std_logic;Hdb3:in std_logic_vector(1 downto 0);
	 Data_OutP:out std_logic_vector(1 downto 0));
end AbandonVB;

architecture AbandonVB of AbandonVB is
type array_5 is array(4 downto 0) of std_logic_vector(1 downto 0);
shared variable Buf:array_5;
shared variable Count_0:integer range 0 to 3;

begin
	process(Clk)
	begin
		if(Clk='1' and Clk'event)then
			Buf(4):=Buf(3);
			Buf(3):=Buf(2);
			Buf(2):=Buf(1);
			Buf(1):=Buf(0);
			Buf(0):=Hdb3;
			if("00"=Buf(0))then
				Count_0:=Count_0+1;
			elsif(2=Count_0 and ("00"=(Buf(0) xor Buf(3))))then
				Buf(3):="00";
				Buf(0):="00";
				Count_0:=0;
			elsif(3=Count_0 and ("00"=(Buf(0) xor Buf(4))))then
				Buf(0):="00";
				Count_0:=0;
			else Count_0:=0;	
			end if;
			Data_OutP<=Buf(4);
		end if;	
	end process;

end AbandonVB;