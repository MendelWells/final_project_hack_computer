// Note this is moltipald by 4 not 8 due to final RAM is 16K
`include "ram4k.sv"
`include "mux4_16_bit.sv"
module ram16k(
		input	logic 		clk,
		input	logic 		rst_n,
		input	logic 		load,
		input	logic [13:0]address,
		input	logic [15:0]data_in,
		output	logic [15:0]data_out 
	);
	
	//------------------------------
	//     internal signals  
	//------------------------------
	logic 	[3:0][15:0]mem	;
	logic   [7:0]Y;

	
	
    //------------------------------
	//     block instance   
	//------------------------------
	
			// demux to set the load of the register according to right the the addres only 0-3 in use
	demux8 demux8_inst(
		.din(1'b01),
		.sel({1'b0,address[13:12]}), 
		.Y(Y)
		);
	
	genvar             i;
  	generate
    	for (i=0; i<4; i++) begin	
    		ram4k ram4k_inst
    		(
	    		.clk(clk),
				.rst_n(rst_n),
				.load(Y[i]& load),
				.address(address[11:0]),
				.data_in(data_in), 
				.data_out(mem[i])
			);
		end
		
	endgenerate
	
	// mux4_16_bit for the output of  each ram4k
	
	
	mux4_16_bit  mux4_16_bit_inst(
		.data_in (mem),
		.sel (address[13:12]),
		.data_out(data_out)
		);
	
	
endmodule // ram16k