vlib work
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/a_op.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/alu_op_out.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/alu.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/counter.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/register.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/mux4.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/rom32.sv}
vlog -reportprogress 300 -work work {C:/Users/Mendel Wells/Desktop/final_project/code/CPU/alu_test/alu_ram64_test_basys3.sv}
vsim -gui work.alu_ram64_test_basys3

