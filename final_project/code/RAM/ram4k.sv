module ram4k(
		input	logic clk,
		input	logic rst_n,
		input	logic load,
		input	logic [11:0]address,
		input	logic [15:0]data_in,
		output	logic [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[7:0][15:0]mem	;
	
	logic   [7:0]Y;
	
    //------------------------------
	//     block instance   
	//------------------------------
		// demux to set the load of the register according to right the the address
	demux8 demux8_inst(
		.din(1'b01),
		.sel(address[11:9]),
		.Y(Y)
		);
	
	
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		ram512 ram512_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(Y[i]& load),
				.address(address[8:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
			end
	endgenerate
		

	
	// mux8_16_bit for the output of  each ram512
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (address[11:9]),
		.data_out(data_out)
		);
	
	
endmodule // ram4k
