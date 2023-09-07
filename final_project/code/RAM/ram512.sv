module ram512(
		input	logic clk,
		input	logic rst,
		input	logic load,
		input	logic [8:0]addres  ,
		input	logic [15:0]data_in  ,
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
    		ram64 ram64_inst
    		(
	    		.clk(clk),
				.rst(rst),
				.load(load),
				.addres(addres[5:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
		end
		
	endgenerate
	
	// mux8_16_bit for the output of  each ram64
	
	
	mux8_16_bit  mux8_16_bit_inst(
		.data_in (mem),
		.sel (addres[8:6]),
		.data_out(data_out)
		);
	
	
endmodule // ram512