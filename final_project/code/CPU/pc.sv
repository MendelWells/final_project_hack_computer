module pc(
	input	logic clk,
	input	logic rst,
	input	logic load,         // detrmined by jump condition
	input	logic [14:0] data_in,
	output	logic [14:0] data_out 
	); 
	
	
		always_ff @(posedge clk or posedge rst) begin
		if (rst)
			data_out <=15'b0;
		else if (load)
			data_out <= data_in[14:0];
		
	    else 
			data_out<= data_out + 1;
	
	end 

	
endmodule// pc
	