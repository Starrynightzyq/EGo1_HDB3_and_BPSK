library ieee;
use ieee.std_logic_1164.all;

entity Polar is 
port(Clk:in std_logic;Data_In:std_logic_vector(1 downto 0);
	 Hdb3:out std_logic_vector(1 downto 0));
end Polar;

architecture Polar of Polar is
signal FlagP:integer range 0 to 1;
begin
	process(Clk)
	begin
		if(Clk='1' and Clk'event)then
			if("01"=Data_In or "10"=Data_In)then
				FlagP<=FlagP+1;
				if(1=FlagP)then
					Hdb3<="10";
				else Hdb3<="01";
				end if;
			elsif("11"=Data_In) then
				if(1=FlagP)then
					Hdb3<="01";
				else Hdb3<="10";
				end if;
			elsif("00"=Data_In)then
				Hdb3<="00";
			end if;		
	end if;
	end process;
end Polar;