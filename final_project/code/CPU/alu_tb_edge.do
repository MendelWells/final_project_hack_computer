vlib work
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/a_op.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_op_out.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu.sv}                                       
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_expected.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_tb_edge.sv}
vsim -gui work.alu_tb_edge
add wave -position end  sim:/alu_tb_edge/x
add wave -position end  sim:/alu_tb_edge/y
add wave -position end  sim:/alu_tb_edge/ctrl
add wave -position end  sim:/alu_tb_edge/out
add wave -position end  sim:/alu_tb_edge/exp_out
add wave -position end  sim:/alu_tb_edge/zr
add wave -position end  sim:/alu_tb_edge/ng
add wave -position end  sim:/alu_tb_edge/exp_zr
add wave -position end  sim:/alu_tb_edge/exp_ng
add wave -position end  sim:/alu_tb_edge/test_out
add wave -position end  sim:/alu_tb_edge/test_zr
add wave -position end  sim:/alu_tb_edge/test_ng
run 100 us
