quit -sim
vlib work
vlog demux8.sv
vlog register.sv
vlog mux8_16_bit.sv
vlog ram8.sv
vlog ram_test/ram8_tb.sv
vsim -voptargs=+acc=lprn ram8_tb -t ns
add wave -position end  sim:/ram8_tb/clk
add wave -position end  sim:/ram8_tb/rst_n
add wave -position end  sim:/ram8_tb/load
add wave -position end  sim:/ram8_tb/address
add wave -position end  sim:/ram8_tb/data_in
add wave -position end  sim:/ram8_tb/data_out
add wave -position end  sim:/ram8_tb/dut/mem




