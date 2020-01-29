library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity top_tb is
end top_tb;

architecture TB_ARCHITECTURE of top_tb is
	-- Component declaration of the tested unit
	component Top
	port(
		clk : in STD_LOGIC;	 
		ce : in STD_LOGIC;
		clr : in STD_LOGIC;
		lockCode : in STD_LOGIC;
		resetCode : in STD_LOGIC; 
		setCode : in STD_LOGIC;
        Row : in STD_LOGIC_VECTOR(3 downto 0);
        Col : out STD_LOGIC_VECTOR(3 downto 0);
        anode : out STD_LOGIC_VECTOR(7 downto 0);
        segOut : out STD_LOGIC_VECTOR(6 downto 0);
	    LED_RGB : out STD_LOGIC_VECTOR(2 downto 0)
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity	
	signal clk : STD_LOGIC := '1'; 
	signal ce : STD_LOGIC := '1';
	signal clr : STD_LOGIC;
	signal lockCode : STD_LOGIC;
	signal resetCode : STD_LOGIC;
	signal setCode : STD_LOGIC;
	signal Row: STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Col: STD_LOGIC_VECTOR(3 downto 0);
	signal anode: STD_LOGIC_VECTOR(7 downto 0);
	signal segOut: STD_LOGIC_VECTOR(6 downto 0);
	signal LED_RGB :  STD_LOGIC_VECTOR(2 downto 0);

begin

	-- Unit Under Test port map
	UUT : Top
		port map (
			clk => clk,
			ce => ce,
			clr => clr,
			lockCode => lockCode,
			resetCode => resetCode,
			setCode => setCode,
			Row=>Row,
			Col=>Col,
			anode=>anode,
			segOut=>segOut,
			LED_RGB => LED_RGB
		);

	--Below VHDL code is an inserted .\compile\Initial.vhs
	--User can modify it ....
	
clk_process : process
begin 
	
	clk <= not clk;
	wait for 50 ns;	
	
end process; 

clr_process : process
begin 
	
	clr <= '1';
	wait for 75 ns;
	clr <= '0';
	wait;
	
end process; 

Row_process : process
begin			
	
	Row <= "1110";
	wait for 5000 ns;  
	Row <= "1011";
	wait for 950 ns;
	Row <= "1101";
	wait for 950 ns;
	Row <= "1110";
	wait for 950 ns;  
	
end process;

resetCode_process : process
begin 
	
	resetCode <= '0';
	wait for 1100 ns;
	resetCode <= '1';
	wait for 100 ns;
	resetCode <= '0';
	wait;
	
end process;

lockCode_process : process
begin 
	
	lockCode <= '0';
	wait for 5600ns;
	lockCode <= '1';
	wait for 100 ns;
	lockCode <= '0';
	wait;
	
end process;

setCode_process : process
begin 
	
	setCode <= '0';
	wait;
	
end process;	  	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_Top of top_tb is
	for TB_ARCHITECTURE
		for UUT : Top
			use entity work.Top(Top);
		end for;
	end for;
end TESTBENCH_FOR_Top;

