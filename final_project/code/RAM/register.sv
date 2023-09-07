module register(
	input	logic 		clk,
	input	logic 		rst,
	input	logic 		load,
	input	logic [15:0]data_in,
	output	logic [15:0]data_out 
	
	);
	
	logic [15:0] data;
	
	always @(posedge clk or posedge rst) begin
		if (rst)
			data <=16'b0;
		else if (load)
			data <= data_in[15:0];
	end 
	
	always_comb data_out = data;
	
endmodule// register