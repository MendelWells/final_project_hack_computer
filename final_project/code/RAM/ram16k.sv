// Note this is moltipald by 4 not 8 due to final RAM is 16K
`include "ram4k.sv"
`include "mux4_16_bit.sv"
module ram16k(
		input	logic 		clk,
		input	logic 		rst,
		input	logic 		load,
		input	logic [13:0]addres,
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
    		ram4k ram4k_inst
    		(
	    		.clk(clk),
				.rst(rst),
				.load(load),
				.addres(addres[11:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
		end
		
	endgenerate
	
	// mux4_16_bit for the output of  each ram4k
	
	
	mux4_16_bit  mux4_16_bit_inst(
		.data_in (mem),
		.sel (addres[13:12]),
		.data_out(data_out)
		);
	
	
endmodule // ram16k