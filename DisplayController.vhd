library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DisplayController is
	port(
		 clk : in STD_LOGIC;
		 ce : in STD_LOGIC;	 
		 clr : in STD_LOGIC;
		 Value0 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value1 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value2 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value3 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value4 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value5 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value6 : in STD_LOGIC_VECTOR(4 downto 0);
		 Value7 : in STD_LOGIC_VECTOR(4 downto 0);
		 anode : out STD_LOGIC_VECTOR(7 downto 0);
		 segOut : out STD_LOGIC_VECTOR(6 downto 0)
	     );
end DisplayController;								

architecture DisplayController of DisplayController is

	signal anode_counter :STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
	signal Value : STD_LOGIC_VECTOR(4 downto 0);

begin
									  
	process(clk,ce,clr)	
	begin  
		if clr = '1' then
			anode_counter <= (others => '0');
		
		elsif clk'event and clk = '1' then 
			if ce = '1' then
				anode_counter <= anode_counter + 1;
			end if;
		end if;		
		
		case anode_counter is 
			when "000" => anode <= "01111111";
	 		when "001" => anode <= "10111111";	 	   
			when "010" => anode <= "11011111";		 		  
			when "011" => anode <= "11101111";		 	 
			when "100" => anode <= "11110111";		 
			when "101" => anode <= "11111011";			
			when "110" => anode <= "11111101";		 
			when "111" => anode <= "11111110";
			when others => anode <= "11111111";
		end case;
		
		case anode_counter is 
			when "000" => Value <= Value0;
	 		when "001" => Value <= Value1;	 	   
			when "010" => Value <= Value2;		 		  
			when "011" => Value <= Value3;		 	 
			when "100" => Value <= Value4;		 
			when "101" => Value <= Value5;			
			when "110" => Value <= Value6;		 
			when "111" => Value <= Value7;
			when others => Value <= "00000";
		end case;
		
	end process;
			
	with Value select segOut <= 	 
				 "1000000" when "00000", --0		   
				 "1111001" when "00001", --1		  
				 "0100100" when "00010", --2		 
				 "0110000" when "00011", --3		 
				 "0011001" when "00100", --4		
				 "0010010" when "00101", --5		
				 "0000010" when "00110", --6		
				 "1111000" when "00111", --7		
				 "0000000" when "01000", --8		
				 "0010000" when "01001", --9			
				 "0001000" when "01010", --A		   
				 "0000011" when "01011", --B			
				 "1000110" when "01100", --C		   
				 "0100001" when "01101", --D		 
				 "0000110" when "01110", --E		  
				 "0001110" when "01111", --F		
				 "0111111" when others;	
						 
end DisplayController;
