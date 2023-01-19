module mux4 (
	input   logic [1:0]		 sel,
	output  logic [3:0]     data_out
	);
	
	always @(sel)begin
		case (sel)
			2'b00:  data_out  = 4'b0111;  
			2'b01:  data_out  = 4'b1011;    
			2'b10:  data_out  = 4'b1101;
			2'b11:  data_out  = 4'b1110; 
		endcase
	end
endmodule// mux4