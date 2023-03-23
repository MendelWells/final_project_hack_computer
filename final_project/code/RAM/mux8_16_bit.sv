module mux8_16_bit (
	input 	logic [7:0][15:0]data_in ,
	input   logic [2:0]      sel ,
	output  logic [15:0]     data_out
	);
	always @(sel,data_in)begin
		case (sel)
			3'b000 :  data_out[15:0]  <= data_in[0][15:0];  
			3'b001 :  data_out[15:0]  <= data_in[1][15:0];    
			3'b010 :  data_out[15:0]  <= data_in[2][15:0];
			3'b011 :  data_out[15:0]  <= data_in[3][15:0]; 
			3'b100 :  data_out[15:0]  <= data_in[4][15:0]; 
			3'b101 :  data_out[15:0]  <= data_in[5][15:0]; 
			3'b110 :  data_out[15:0]  <= data_in[6][15:0]; 
			3'b111 :  data_out[15:0]  <= data_in[7][15:0]; 
		endcase
	end
endmodule// mux8_16_bit