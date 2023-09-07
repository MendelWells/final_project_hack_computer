module register(
	input	logic 		clk,
	input	logic 		rst,
	input	logic 		load,
	input	logic [15:0]data_in,
	output	logic [15:0]data_out 
	
	);
	
	always_ff @(posedge clk or posedge rst) begin
		if (rst)
			data_out <=16'b0;
		else if (load)
			data_out <= data_in[15:0];
	end 
	
endmodule// register