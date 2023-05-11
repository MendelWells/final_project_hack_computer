quit -sim
vlib work
vlog demux8.sv
vlog register.sv
vlog mux8_16_bit.sv
vlog ram512.sv
vlog ram_test/ram512_tb.sv
vsim -voptargs=+acc=lprn ram512_tb -t ns
add wave -position end  sim:/ram512_tb/clk
add wave -position end  sim:/ram512_tb/rst_n
add wave -position end  sim:/ram512_tb/load
add wave -position end  sim:/ram512_tb/address
add wave -position end  sim:/ram512_tb/data_in
add wave -position end  sim:/ram512_tb/data_out
add wave -position end  sim:/ram512_tb/dut/mem
add wave -position end  sim:/ram512_tb/tb_mem




