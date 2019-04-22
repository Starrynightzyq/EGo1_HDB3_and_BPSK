library ieee;
use ieee.std_logic_1164.all;

entity Polar is
port(Clk:in std_logic;Data_In:in std_logic_vector(1 downto 0);
		True_Code:out std_logic);
end Polar;

architecture Polar of Polar is
begin
	process(Clk)
	begin
		if(Clk='1' and Clk'event)then
			if("10"=Data_In or "01"=Data_In)then
				True_Code<='1';
			elsif("00"=Data_In)then
				True_Code<='0';
			end if;
		end if;
	end process;
end Polar;