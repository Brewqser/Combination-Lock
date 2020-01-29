SetActiveLib -work
comp -include "$dsn\src\Top.bde" 
comp -include "$dsn\src\TestBench\top_tb.vhd" 
asim +access +r TESTBENCH_FOR_Top 
wave 
wave -noreg clk
wave -noreg ce
wave -noreg clr
wave -noreg lockCode
wave -noreg resetCode
wave -noreg setCode
wave -noreg Row
wave -noreg Col
wave -noreg segOut
wave -noreg anode
wave -noreg LED_RGB
run 10000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 
											  