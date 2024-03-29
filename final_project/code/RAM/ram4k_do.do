quit -sim
vlib work
vlog demux8.sv
vlog register.sv
vlog mux8_16_bit.sv
vlog ram8.sv
vlog ram64.sv
vlog ram512.sv
vlog ram4k.sv
vlog ram_test/ram4k_tb.sv
vsim -voptargs=+acc=lprn ram4k_tb -t ns
add wave -position end  sim:/ram4k_tb/clk
add wave -position end  sim:/ram4k_tb/rst_n
add wave -position end  sim:/ram4k_tb/load
add wave -position end  sim:/ram4k_tb/address
add wave -position end  sim:/ram4k_tb/data_in
add wave -position end  sim:/ram4k_tb/data_out
add wave -position end  sim:/ram4k_tb/dut/mem
add wave -position end  sim:/ram4k_tb/tb_mem




