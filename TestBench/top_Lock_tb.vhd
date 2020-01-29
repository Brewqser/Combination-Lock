library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity top_Lock_tb is
end top_Lock_tb;

architecture TB_ARCHITECTURE of top_Lock_tb is
	-- Component declaration of the tested unit
	component Top_Lock
	port(
		Pressed : in STD_LOGIC;
        clk : in STD_LOGIC;
        clr : in STD_LOGIC;
		lockCode : in STD_LOGIC;
        resetCode : in STD_LOGIC;
        setCode : in STD_LOGIC;
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
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal Pressed : STD_LOGIC := '1';
	signal clk : STD_LOGIC := '1'; 
	signal ce : STD_LOGIC := '1';
	signal clr : STD_LOGIC;
	signal lockCode : STD_LOGIC;
    signal resetCode : STD_LOGIC;
    signal setCode : STD_LOGIC;
    signal Value : STD_LOGIC_VECTOR(4 downto 0);
    
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Value0 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value1 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value2 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value3 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value4 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value5 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value6 : STD_LOGIC_VECTOR(4 downto 0);
    signal Value7 : STD_LOGIC_VECTOR(4 downto 0);
	signal LED_RGB : STD_LOGIC_VECTOR(2 downto 0);
	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : Top_Lock
	port map (	   
			Pressed => Pressed,
			clk => clk,
			clr => clr,
			lockCode => lockCode,
			resetCode => resetCode,
			setCode => setCode,
			Value => Value,
			Value0 => Value0,
   			Value1 => Value1,
    		Value2 => Value2,
    		Value3 => Value3,
    		Value4 => Value4,
    		Value5 => Value5,
    		Value6 => Value6,
    		Value7 => Value7,
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

Pressed_process : process
begin 
	
	for i in 0 to 10 loop
		Pressed <= not Pressed;
		wait for 100 ns;
	end loop; 
	
	
	wait for 400 ns;
	
	for i in 0 to 39 loop
		Pressed <= not Pressed;
		wait for 100 ns;
	end loop;
	wait;
	
end process;

Value_process : process
begin 
	
	Value <= "00101";
	wait for 3600ns;
	Value <= "00000";
	wait for 200ns;
	Value <= "00010";
	wait for 200ns;
	Value <= "00100";
	wait for 200ns;
	Value <= "00110";
	wait for 200ns;
	Value <= "01000";
	wait for 200ns;
	Value <= "01010";
	wait for 200ns;
	Value <= "01100";
	wait for 200ns;
	Value <= "01110";
	wait;
	
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

configuration TESTBENCH_FOR_Top_Lock of top_Lock_tb is
	for TB_ARCHITECTURE
		for UUT : Top_Lock
			use entity work.Top_Lock(Top_Lock);
		end for;
	end for;
end TESTBENCH_FOR_Top_Lock;

