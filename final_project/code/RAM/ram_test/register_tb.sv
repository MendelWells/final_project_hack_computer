`timescale 1ns / 1ps
module register_tb();
  
  // Declare signals for the testbench
  logic clk, rst_n, load;
  logic [15:0] data_in, data_out_expected, data_out_actual;
  
  // Instantiate the register module
  register dut (
    .clk(clk),
    .rst_n(rst_n),
    .load(load),
    .data_in(data_in),
    .data_out(data_out_actual)
  );
  
  // Define clock parameters
  parameter PERIOD = 10;
  parameter HALF_PERIOD = PERIOD / 2;
  
  // Create clock signal
  always #HALF_PERIOD clk = ~clk;
  
  // Initialize signals
  initial begin
    clk = 1;
    rst_n = 0;
    load = 0;
    data_in = 0;
    data_out_expected = 0;
    #PERIOD;
	data_in = 16'h8888;
	
	// Wait for the 3 clock to stabilize
	#PERIOD;
	#PERIOD;
	#PERIOD;
	
    
    
    // Test case 0: load while rst_n =0
	data_in = 16'h8888;
	load=1;
	#PERIOD;
    data_out_expected = 0;
	compare_actual_expected(data_out_actual,data_out_expected);
	
    // Test case 1: Load data into the register
    rst_n = 1;
	load = 1;
	data_in = 16'hABCD;
	//data_out_expected = 16'b0;
    #PERIOD;
    load = 0;
    data_out_expected = 16'hABCD;
	compare_actual_expected(data_out_actual,data_out_expected);
    #PERIOD;
	
    // Test case 2: Load new data into the register
	load = 1;   
	data_in = 16'h1234;
   
    //data_out_expected = 16'hABCD;
    #PERIOD;
    load = 0;
    data_out_expected = 16'h1234;
    compare_actual_expected(data_out_actual,data_out_expected);
	#PERIOD;
	#PERIOD;
	
    // Test case 3: Reset the register
    rst_n = 0;
    #PERIOD;
	#PERIOD;
    rst_n = 1;
    data_out_expected = 0;
    compare_actual_expected(data_out_actual,data_out_expected);
    // Check the output
    #PERIOD;
  end
task compare_actual_expected (input  logic [15:0] data_out_actual, input  logic [15:0] data_out_expected);
  
  if (data_out_actual !== data_out_expected) begin
      $error("Test failed: expected data_out = %h, actual data_out = %h", data_out_expected, data_out_actual);
    end else begin
      $display("Test passed: data_out = %h", data_out_actual);
    end
  
  
endtask  
  
endmodule
