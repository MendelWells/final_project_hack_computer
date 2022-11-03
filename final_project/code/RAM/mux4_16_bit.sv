module mux4_16_bit (
	input 	logic [1:0][15:0]data_in,
	input   logic [1:0]		 sel ,
	output  logic [15:0]     data_out
	);
	
	always @(sel,data_in)begin
		case (sel)
			2'b00 :  data_out[15:0]  <= data_in[0][15:0];  
			2'b01 :  data_out[15:0]  <= data_in[1][15:0];    
			2'b10 :  data_out[15:0]  <= data_in[2][15:0];
			2'b11 :  data_out[15:0]  <= data_in[3][15:0]; 
		endcase
	end
endmodule// mux4_16_bit