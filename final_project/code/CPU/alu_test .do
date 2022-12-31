vlib work
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/a_op.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_op_out.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu.sv}                                       
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_expected.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_tb_1.sv}
vsim -gui work.alu_tb_1
add wave -position end  sim:/alu_tb_1/test
add wave -position end  sim:/alu_tb_1/x
add wave -position end  sim:/alu_tb_1/y
add wave -position end  sim:/alu_tb_1/ctrl
add wave -position end  sim:/alu_tb_1/out
add wave -position end  sim:/alu_tb_1/exp_out
add wave -position end  sim:/alu_tb_1/zr
add wave -position end  sim:/alu_tb_1/ng
add wave -position end  sim:/alu_tb_1/exp_zr
add wave -position end  sim:/alu_tb_1/exp_ng
run 100 us
