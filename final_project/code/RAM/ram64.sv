// Using  8*ram8  we have total of 64 the upper nibble ([5:3]) of the address 
// Determines which ram8 is in use the lower nibble of the address 
// Is driven to all 8 ram8 
// So address 6'b010100 is going to be the register4 of the second ram8  
`include "ram8.sv"
`include "mux8_16_bit.sv"
module ram64(
		input	logic clk,
		input	logic rst_n,
		input	logic load,
		input	logic [5:0] address,
		input	logic [15:0]data_in,
		output	logic [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[7:0][15:0]mem;
	logic   [7:0]Y;
	
    //------------------------------
	//     block instance   
	//------------------------------
		// demux to set the load of the register according to right the the addres
	demux8 demux8_inst(
		.din(1'b01),
		.sel(address[5:3]),// 110010
		.Y(Y)
		);
	
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		ram8 ram8_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(Y[i]& load),
				.address(address[2:0]),
				.data_in(data_in), 
				.data_out (mem[i])
			);
		end
		
	endgenerate
	
	// mux8_16_bit for the output of  each ram8
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (address[5:3]),
		.data_out(data_out)
		);
	
	
endmodule // ram64