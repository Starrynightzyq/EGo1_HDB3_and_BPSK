library ieee;
use ieee.std_logic_1164.all;

entity AddV is
port(Clk:in std_logic;Data_In:in std_logic;Data_OutV:out std_logic_vector(1 downto 0));
end AddV;

architecture AddV of Addv is
--signal Count0:std_logic_vector(0 to 1);
signal Count0:integer range 0 to 3;
begin
	process(Clk)
	begin
	--	wait until Clk='1' and Clk'event;
	if( Clk='1' and Clk'event)then
		if(Data_In='1')then
			Data_OutV<="01";
			Count0<=0;
		elsif(Data_In='0')then
				Count0<=Count0+1;
				if(Count0=3)then
					Count0<=0;
					Data_OutV<="11";
				else Data_OutV<="00";
				end if;
		end if;
	end if;
	end process;
end AddV;