module ram512(
		input	logic clk,
		input	logic rst_n,
		input	logic load,
		input	logic [8:0]address  ,
		input	logic [15:0]data_in  ,
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
		.sel(address[8:6]),// 110010
		.Y(Y)
		);
	
	
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		ram64 ram64_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(Y[i]),
				.address(address[5:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
		end
		
	endgenerate
	
	// mux8_16_bit for the output of  each ram64
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (address[8:6]),
		.data_out(data_out)
		);
	
	
endmodule // ram512