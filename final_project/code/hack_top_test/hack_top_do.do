vlib work
vlog ../RAM/demux8.sv
vlog ../RAM/register.sv
vlog ../RAM/mux8_16_bit.sv
vlog ../RAM/ram8.sv
vlog ../RAM/ram64.sv
vlog ../RAM/ram512.sv
vlog ../RAM/ram4k.sv
vlog ../RAM/ram16k.sv
vlog ../cpu/a_op.sv
vlog ../cpu/alu_op_out.sv
vlog ../cpu/alu.sv
vlog ../cpu/jump_condition.sv
vlog ../cpu/pc.sv
vlog ../cpu/ctrl.sv
vlog ../cpu/cpu.sv
vlog rom_8.v
vlog ../hack_top.sv
vlog tb_hack_top.sv
vsim -voptargs=+acc=lprn tb_hack_top -t ns
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/mem
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/data_in
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/address
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/load
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/clk
add wave -position insertpoint  \
sim:/tb_hack_top/dut/ram16k_inst/rst_n
