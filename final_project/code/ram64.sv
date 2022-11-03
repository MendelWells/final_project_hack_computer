// Using  8*ram8  we have total of 64 the upper nibble ([5:3]) of the addres 
// Determines which ram8 is in use the lower nibble of the addres 
// Is driven to all 8 ram8 
// So addres 6'b010100 is going to be the register4 of the second ram8  
`include "ram8.sv"
`include "mux8_16_bit.sv"
module ram64(
		input	logic clk,
		input	logic rst_n,
		input	logic load,
		input	logic [5:0] addres,
		input	logic [15:0]data_in,
		output	logic [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[2:0][15:0]mem;
	
	
    //------------------------------
	//     block instance   
	//------------------------------
	
	
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		ram8 ram8_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(load),
				.addres(addres[2:0]),
				.data_in(data_in), 
				.data_out (mem[i])
			);
		end
		
	endgenerate
	
	// mux8_16_bit for the output of  each ram8
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (addres[5:3]),
		.data_out(data_out)
		);
	
	
endmodule // ram64