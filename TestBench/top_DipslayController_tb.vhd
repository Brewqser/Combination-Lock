library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity top_DisplayController_tb is
end top_DisplayController_tb;

architecture TB_ARCHITECTURE of top_DisplayController_tb is
	-- Component declaration of the tested unit
	component Top_DisplayController
	port(
		ce : in STD_LOGIC;
        clk : in STD_LOGIC;
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
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity	
	signal clk : STD_LOGIC := '1'; 
	signal ce : STD_LOGIC := '1';
	signal clr : STD_LOGIC;
    signal Value0 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value1 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value2 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value3 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value4 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value5 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value6 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value7 : STD_LOGIC_VECTOR(4 downto 0);
       
	-- Observed signals - signals mapped to the output ports of tested entity
	signal anode : STD_LOGIC_VECTOR(7 downto 0);
    signal segOut : STD_LOGIC_VECTOR(6 downto 0);	

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : Top_DisplayController
		port map (
			clk => clk,
			ce => ce,
			clr => clr,	
			Value0 => Value0,
   			Value1 => Value1,
    		Value2 => Value2,
    		Value3 => Value3,
    		Value4 => Value4,
    		Value5 => Value5,
    		Value6 => Value6,
    		Value7 => Value7,
			anode => anode,
    		segOut => segOut
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

Values_process : process 
begin
	Value0 <= "00001";
	Value1 <= "00100";
	Value2 <= "00011";
	Value3 <= "00111";
	Value4 <= "01001";
	Value5 <= "01100";
	Value6 <= "10000";
	Value7 <= "01101";
	wait for 2000 ns;
	
	Value0 <= "01001";
	Value1 <= "00110";
	Value2 <= "00000";
	Value3 <= "00101";
	Value4 <= "00110";
	Value5 <= "00110";
	Value6 <= "01111";
	Value7 <= "01011";
	wait;
	
end process;
	


end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_Top_DisplayController of top_DisplayController_tb is
	for TB_ARCHITECTURE
		for UUT : Top_DisplayController
			use entity work.Top_DisplayController(Top_DisplayController);
		end for;
	end for;
end TESTBENCH_FOR_Top_DisplayController;

