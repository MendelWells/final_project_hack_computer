quit -sim
vlib work
vlog demux8.sv
vlog register.sv
vlog mux8_16_bit.sv
vlog ram512.sv
vlog ram_test/ram16k_tb.sv
vsim -voptargs=+acc=lprn ram16k_tb -t ns
add wave -position end  sim:/ram16k_tb/clk
add wave -position end  sim:/ram16k_tb/rst_n
add wave -position end  sim:/ram16k_tb/load
add wave -position end  sim:/ram16k_tb/address
add wave -position end  sim:/ram16k_tb/data_in
add wave -position end  sim:/ram16k_tb/data_out
add wave -position end  sim:/ram16k_tb/dut/mem
add wave -position end  sim:/ram16k_tb/tb_mem




