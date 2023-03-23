vlib work
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/RAM/register.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/RAM/ram_test/register_tb.sv}
vsim -gui work.register_tb
add wave -position end  sim:/register_tb/rst_n
add wave -position end  sim:/register_tb/clk
add wave -position end  sim:/register_tb/load
add wave -position end  sim:/register_tb/data_in
add wave -position end  sim:/register_tb/data_out_expected
add wave -position end  sim:/register_tb/data_out_actual




