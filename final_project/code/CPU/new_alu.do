vlib work
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/a_op.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_op_out.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu.sv}                                       
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_expected.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_tb.sv}
vsim -gui work.alu_tb
add wave -position end  sim:/alu_tb/x
add wave -position end  sim:/alu_tb/y
add wave -position end  sim:/alu_tb/ctrl
add wave -position end  sim:/alu_tb/out
add wave -position end  sim:/alu_tb/exp_out
add wave -position end  sim:/alu_tb/zr
add wave -position end  sim:/alu_tb/ng
add wave -position end  sim:/alu_tb/exp_zr
add wave -position end  sim:/alu_tb/exp_ng
add wave -position end  sim:/alu_tb/test_out
add wave -position end  sim:/alu_tb/test_zr
add wave -position end  sim:/alu_tb/test_ng
run 100 us
