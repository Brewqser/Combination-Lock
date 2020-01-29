SetActiveLib -work
comp -include "$dsn\src\Top_Lock.bde" 
comp -include "$dsn\src\TestBench\top_Lock_tb.vhd" 
asim +access +r TESTBENCH_FOR_Top_Lock 
wave
wave -noreg Pressed
wave -noreg clk	   
wave -noreg clr
wave -noreg lockCode
wave -noreg resetCode
wave -noreg setCode
wave -noreg Value
wave -noreg Value0
wave -noreg Value1
wave -noreg Value2
wave -noreg Value3
wave -noreg Value4
wave -noreg Value5
wave -noreg Value6
wave -noreg Value7
wave -noreg LED_RGB
run 8000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 
