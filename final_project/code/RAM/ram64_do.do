quit -sim
vlib work
vlog demux8.sv
vlog register.sv
vlog mux8_16_bit.sv
vlog ram64.sv
vlog ram_test/ram64_tb.sv
vsim -voptargs=+acc=lprn ram64_tb -t ns
add wave -position end  sim:/ram64_tb/clk
add wave -position end  sim:/ram64_tb/rst_n
add wave -position end  sim:/ram64_tb/load
add wave -position end  sim:/ram64_tb/address
add wave -position end  sim:/ram64_tb/data_in
add wave -position end  sim:/ram64_tb/data_out
add wave -position end  sim:/ram64_tb/dut/mem
add wave -position end  sim:/ram64_tb/tb_mem




