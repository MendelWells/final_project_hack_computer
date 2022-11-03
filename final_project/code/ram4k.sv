module ram4k(
		input	logic clk,
		input	logic rst_n,
		input	logic load,
		input	logic [11:0]addres,
		input	logic [15:0]data_in,
		output	logic [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[2:0][15:0]mem	;
	
	
    //------------------------------
	//     block instance   
	//------------------------------
	
	
	genvar             i;
  	generate
    	for (i=0; i<8; i++) begin	
    		ram512 ram512_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(load),
				.addres(addres[8:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
			end
	endgenerate
		

	
	// mux8_16_bit for the output of  each ram512
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (addres[11:9]),
		.data_out(data_out)
		);
	
	
endmodule // ram4k
