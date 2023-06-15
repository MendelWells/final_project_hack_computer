`timescale 1ns / 1ps
module ram4k_tb();

	// Inputs
	logic clk;
	logic rst_n;
	logic load;
	logic [11:0] address;
	logic [15:0] data_in;
	
	// Outputs
	logic [15:0] data_out;

	logic [4095:0][15:0] tb_mem;
	always_ff @( posedge clk or negedge rst_n) begin
		if(~rst_n)
		  tb_mem <= 4095'b0;
		else
			tb_mem[address] <= data_out;
		end	

	// Instantiate the unit under test (DUT)
	ram4k dut (
		.clk(clk),
		.rst_n(rst_n),
		.load(load),
		.address(address),
		.data_in(data_in),
		.data_out(data_out)
	);
	
	// Clock period definition
	parameter PERIOD = 10;
	
	
	// Clock generation
	always # (PERIOD / 2) clk = ~clk;
	
	// Write and read operations
	initial begin
	// Reset inputs
		clk = 0;
		rst_n = 0;
		load = 0;
		address = 0;
		data_in = 16'h0000;
		// Wait for 2 clock cycles
		#(2 * PERIOD) 
		// Deassert reset
		rst_n = 1;
		#(2 * PERIOD) 
		// Write some data to memory
		
		// Read data from memory
		load = 1;
		address = 12'h0;
		data_in =  16'h1234;
		//#( PERIOD) assert(data_out == 16'h1234);
		#(2* PERIOD)
		address = 12'd2500;
		data_in = 16'h5678;
		#(2 * PERIOD)
		//#(PERIOD) assert(data_out == 16'h5678);
		// Write more data to memory
		address = 12'd3000;
		data_in = 16'habcd;
		#(2 * PERIOD)
		//#(PERIOD) assert(data_out == 16'habcd);
		#(2 * PERIOD)
		// write to same address
		address = 12'd450;
		data_in = 16'hdcba;
		#(2 * PERIOD)
		// write to same address with out load 
		address = 12'd662;
		load = 1'b0;
		data_in = 16'hbbbb;
		//#(PERIOD) assert(data_out == 16'hdcba);
		#(2 * PERIOD)
		load = 1;
		address = 12'h707;
		data_in  = 16'hdef0;
		//#(PERIOD) assert(data_out == 16'hdef0);
		
	end
	
	always @(data_out) 
		$display("Memory in address: %d       is = %h   at time = %8t ns",address,data_out,$time);
	
endmodule
