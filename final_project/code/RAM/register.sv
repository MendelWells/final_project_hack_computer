module register(
	input	logic 		clk,
	input	logic 		rst_n,
	input	logic 		load,
	input	logic [15:0]data_in,
	output	logic [15:0]data_out 
	
	);
	
	always_ff @(posedge clk or negedge rst_n) begin
		if (~rst_n)
			data_out <=16'b0;
		else if (load)
			data_out <= data_in[15:0];
	end 
	
endmodule// register