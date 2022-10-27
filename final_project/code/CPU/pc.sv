module pc(
	input	logic clk,
	input	logic rst_n,
	input	logic load,         // detrmined by jump condition
	input	logic clr,			// clear counter
	input	logic [15:0] data_in,
	output	logic [14:0] data_out 
	); 
	
	
		always_ff @(posedge clk or negedge rst_n) begin
		if (~rst_n)
			data_out <=15'b0;
		else if (load)
			data_out <= data_in[14:0];
		else if (clr)
			data_out <= 15'b0;
	    else 
			data_out<= data_out + 1;
	
	end 

	
endmodule// pc
	