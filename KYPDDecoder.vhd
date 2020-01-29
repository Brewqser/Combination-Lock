library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KYPDDecoder is
	 port(
		 clk : in STD_LOGIC;
		 ce : in STD_LOGIC;	 
		 clr : in STD_LOGIC;
		 Row : in STD_LOGIC_VECTOR(3 downto 0);
		 Col : out STD_LOGIC_VECTOR(3 downto 0);
		 Pressed : out STD_LOGIC;
		 DecodeOut : out STD_LOGIC_VECTOR(4 downto 0)
	     );
end KYPDDecoder;

architecture KYPDDecoder of KYPDDecoder is

	signal col_counter : integer range 0 to 7 := 0;
	signal press : STD_LOGIC := '0';

begin
	process(clk,clr)
		
	begin  
		if clr = '1' then
			col_counter <= 0;
			press <= '0';
			
		elsif clk'event and clk = '1' then 
			if ce = '1' then
				if col_counter = 0 then 	   
					Col<= "0111";
					col_counter <= col_counter+1;	
				elsif col_counter = 1 then	
					if Row = "0111" then
						DecodeOut <= "00001"; --1
						press <= '1';
					elsif Row = "1011" then
						DecodeOut <= "00100"; --4 
						press <= '1';
					elsif Row = "1101" then
						DecodeOut <= "00111"; --7
						press <= '1';
					elsif Row = "1110" then
						DecodeOut <= "00000"; --0
						press <= '1';
					else
						col_counter <= col_counter+1;
						press <= '0';
					end if;
				elsif col_counter = 2 then	
					Col<= "1011";
					col_counter <= col_counter+1;
				elsif col_counter = 3 then
					if Row = "0111" then		
						DecodeOut <= "00010"; --2
						press <= '1';
					elsif Row = "1011" then
						DecodeOut <= "00101"; --5
						press <= '1'; 
					elsif Row = "1101" then
						DecodeOut <= "01000"; --8
						press <= '1';
					elsif Row = "1110" then
						DecodeOut <= "01111"; --F
						press <= '1';
					else
						col_counter <= col_counter+1;
						press <= '0';
					end if;	  
				elsif col_counter = 4 then
					Col<= "1101";
					col_counter <= col_counter+1;	
				elsif col_counter = 5 then 
					if Row = "0111" then
						DecodeOut <= "00011"; --3
						press <= '1';	 
					elsif Row = "1011" then
						DecodeOut <= "00110"; --6
						press <= '1';  
					elsif Row = "1101" then
						DecodeOut <= "01001"; --9
						press <= '1';
					elsif Row = "1110" then
						DecodeOut <= "01110"; --E 
						press <= '1';
					else
						col_counter <= col_counter+1;
						press <= '0';
					end if;	
				elsif col_counter = 6 then
					Col<= "1110"; 
					col_counter <= col_counter+1;
				elsif col_counter = 7 then 
					if Row = "0111" then
						DecodeOut <= "01010"; --A
						press <= '1'; 
					elsif Row = "1011" then
						DecodeOut <= "01011"; --B
						press <= '1';
					elsif Row = "1101" then
						DecodeOut <= "01100"; --C
						press <= '1'; 
					elsif Row = "1110" then
						DecodeOut <= "01101"; --D
						press <= '1';
					else
						col_counter <= 0;
						press <= '0';
					end if;
				end if;
			end if;
		 end if;
	end process;
	
	Pressed <= press;

end KYPDDecoder; 
 