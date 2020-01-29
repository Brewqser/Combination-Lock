SetActiveLib -work
comp -include "$dsn\src\Top_KYPDDecoder.bde" 
comp -include "$dsn\src\TestBench\top_KYPDDecoder_tb.vhd" 
asim +access +r TESTBENCH_FOR_Top_KYPDDecoder 
wave 
wave -noreg clk
wave -noreg ce
wave -noreg clr
wave -noreg Row
wave -noreg Col
wave -noreg DecodeOut
wave -noreg Pressed
run 4000.00 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\tutorvhdl_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_tutorvhdl 
