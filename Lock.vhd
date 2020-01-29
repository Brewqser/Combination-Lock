library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Lock is
	 port(
		 Pressed : in STD_LOGIC;
		 clr : in STD_LOGIC;
		 clk : in STD_LOGIC; 
		 lockCode : in STD_LOGIC;
		 setCode : in STD_LOGIC;
		 resetCode : in STD_LOGIC;
		 Value : in STD_LOGIC_VECTOR(4 downto 0);
		 Value0 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value1 : out STD_LOGIC_VECTOR(4 downto 0);	
		 Value2 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value3 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value4 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value5 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value6 : out STD_LOGIC_VECTOR(4 downto 0);
		 Value7 : out STD_LOGIC_VECTOR(4 downto 0);
		 LED_RGB : out STD_LOGIC_VECTOR(2 downto 0)
	     );
end Lock;									 

architecture Lock of Lock is
													
	type MEM is array (0 to 7) of STD_LOGIC_VECTOR(4 downto 0);
	type state_type is (initialize, enterCode, checkCode, badCode, goodCode, initCodeChange, enterNewCode, changeCode);
	
	signal Code : MEM;
	signal GuessedCode : MEM;
	signal it : integer range 0 to 8 := 0;
	signal good : std_logic := '1';		 
	signal state : state_type := initialize;
	signal press : STD_LOGIC := '0';
	
begin
	process (clr, clk)
	begin
		if clr = '1' then
			Code <= ("00000","00010","00100","00110","01000","01010","01100","01110");
			state <= initialize;
			
		else	
			if clk'event and clk = '1' then
				
				case state is
					when initialize =>
						GuessedCode <= ("10000","10000","10000","10000","10000","10000","10000","10000");
						it <= 0;
						good <= '1';
						LED_RGB <= "000";
						state <= enterCode;
						press <= '1';
					
					when enterCode =>
						if resetCode = '1' and press = '0' then
							state <= initialize;
							press <= '1';
						elsif Pressed = '1' and press = '0' then
							press <= '1';
							GuessedCode(it) <= Value; 
									
							if Code(it) = Value then
								-- nothing
							else
								good <= '0';
							end if;	 
							
							it <= it + 1;
							
							if it = 7 then
								state <= checkCode;
							end if;
							
						elsif Pressed = '0' and resetCode = '0' then 
							press <= '0';
						end if;
						
					when checkCode =>
				
						if good = '0' then 
							LED_RGB <= "100";
							state <= badCode;
						elsif good = '1' then
							LED_RGB <= "010";
							state <= goodCode;
						end if;
						press <= '1';

					when badCode =>
					
						if Pressed = '1' and press = '0' then 
							press <= '1';
							state <= initialize;
						elsif Pressed = '0' then 
							press <= '0';
						end if;
					
					when goodCode =>
					
						if setCode = '1' and press = '0' then
							press <= '1';
							state <= initCodeChange;
						elsif lockCode = '1' and press = '0' then 
							press <= '1';
							state <= initialize;
						elsif lockCode = '0' and setCode = '0' then 
							press <= '0';
						end if;
						
					when initCodeChange => 
					
						GuessedCode <= ("10000","10000","10000","10000","10000","10000","10000","10000");
						it <= 0;
						good <= '1';
						LED_RGB <= "001"; 
						state <= enterNewCode;
						press <= '1';
						
					when enterNewCode =>
					
						if resetCode = '1' and press = '0' then
							state <= initCodeChange;
							press <= '1';
						elsif Pressed = '1' and press = '0' then
							press <= '1';
							GuessedCode(it) <= Value; 
										 
							it <= it + 1;
							
							if it = 7 then
								state <= changeCode;
							end if;
							
						elsif Pressed = '0' and resetCode = '0' then 
							press <= '0';
						end if;
						
					when changeCode =>
					
						Code <= GuessedCode;
						press <= '1';		
						state <= checkCode;
						
					when others =>
						state <= initialize;
				
				end case;
			end if;	 		
	   end if;
	
	end process;
	
	Value0 <= GuessedCode(0);
	Value1 <= GuessedCode(1);
	Value2 <= GuessedCode(2);
	Value3 <= GuessedCode(3);
	Value4 <= GuessedCode(4);
	Value5 <= GuessedCode(5);
	Value6 <= GuessedCode(6);
	Value7 <= GuessedCode(7);	
	

end Lock;
