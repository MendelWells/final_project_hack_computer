`include "demux8.sv"
`include "register.sv"

module ram8(
		input	logic 	      clk,
		input	logic 	      rst_n,
		input	logic         load,
		input	logic   [2:0 ]addres,
		input	logic   [15:0]data_in,
		output	logic   [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[2:0][15:0]mem;	
	logic 	[7:0]Y;     // output of demux 
	
	
    //------------------------------
	//     block instance   
	//------------------------------

	// demux to set the load of the register according to right the the addres
	demux8 demux8_inst(
		.din(1'b01),
		.sel(addres),
		.Y(Y)
		);
	
	
	// memory 
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		register register_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(Y[i]),
				.data_in(data_in), 
				.data_out (mem[i])
			);
		end
		
	endgenerate
	
	
	// mux8_16_bit for the output of the ram
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (addres),
		.data_out(data_out)
		);
    	
endmodule//ram8	
		
		
		
		
		