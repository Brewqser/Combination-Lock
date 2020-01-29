library ieee;
use ieee.STD_LOGIC_UNSIGNED.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity top_KYPDDecoder_tb is
end top_KYPDDecoder_tb;

architecture TB_ARCHITECTURE of top_KYPDDecoder_tb is
	-- Component declaration of the tested unit
	component Top_KYPDDecoder
	port(
		clk : in STD_LOGIC;	 
		ce : in STD_LOGIC;
		clr : in STD_LOGIC;
        Row : in STD_LOGIC_VECTOR(3 downto 0);
        Col : out STD_LOGIC_VECTOR(3 downto 0);
		DecodeOut : out STD_LOGIC_VECTOR(4 downto 0);
        Pressed : out STD_LOGIC
		);
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity	
	signal clk : STD_LOGIC := '1'; 
	signal ce : STD_LOGIC := '1';
	signal clr : STD_LOGIC;
	signal Row: STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Col: STD_LOGIC_VECTOR(3 downto 0);
	signal DecodeOut :  STD_LOGIC_VECTOR(4 downto 0);
    signal Pressed :  STD_LOGIC;	

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : Top_KYPDDecoder
		port map (
			clk => clk,
			ce => ce,
			clr => clr,	
			Row=>Row,
			Col=>Col,
			DecodeOut=>DecodeOut,
			Pressed=>Pressed 
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
	wait for 400 ns;
	Row <= "1011";
	wait for 250 ns;
	Row <= "UUUU";
	
	wait for 400 ns;
	Row <= "1101";
	wait for 290 ns;
	Row <= "UUUU"; 	   
	
	wait for 550 ns;
	Row <= "0111";
	wait for 400 ns;
	Row <= "UUUU"; 	  
	
	wait;
	
end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_Top_KYPDDecoder of top_KYPDDecoder_tb is
	for TB_ARCHITECTURE
		for UUT : Top_KYPDDecoder
			use entity work.Top_KYPDDecoder(Top_KYPDDecoder);
		end for;
	end for;
end TESTBENCH_FOR_Top_KYPDDecoder;

