`timescale 1ns / 1ps
module ram8_tb();

	// Inputs
	logic clk;
	logic rst_n;
	logic load;
	logic [2:0] address;
	logic [15:0] data_in;
	
	// Outputs
	logic [15:0] data_out;
	
	// Instantiate the unit under test (DUT)
	ram8 dut (
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
		address = 3'h0;
		data_in =  16'h1234;
		//#( PERIOD) assert(data_out == 16'h1234);
		#(2* PERIOD)
		address = 3'h5;
		data_in = 16'h5678;
		#(2 * PERIOD)
		//#(PERIOD) assert(data_out == 16'h5678);
		// Write more data to memory
		address = 3'h3;
		data_in = 16'habcd;
		#(2 * PERIOD)
		//#(PERIOD) assert(data_out == 16'habcd);
		#(2 * PERIOD)
		// write to same address
		//address = 3'h3;
		data_in = 16'hdcba;
		#(2 * PERIOD)
		// write to same address with out load 
		//address = 3'h3;
		load = 1'b0;
		data_in = 16'hbbbb;
		//#(PERIOD) assert(data_out == 16'hdcba);
		#(2 * PERIOD)
		load = 1;
		address = 3'h7;
		data_in  = 16'hdef0;
		//#(PERIOD) assert(data_out == 16'hdef0);
	end
	
endmodule
