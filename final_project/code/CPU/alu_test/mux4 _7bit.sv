module mux4_7bit (
	input   logic [1:0][6:0] data_in,
	input   logic [1:0]		 sel,
	output  logic [6:0]     data_out
	);
	
	always @(sel,data_in)begin
		case (sel)
			2'b00 :  data_out  <= data_in[0];  
			2'b01 :  data_out  <= data_in[1];    
			2'b10 :  data_out  <= data_in[2];
			2'b11 :  data_out  <= data_in[3]; 
		endcase
	end
endmodule// mux4