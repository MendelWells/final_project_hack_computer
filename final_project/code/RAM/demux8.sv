module demux8 (
	input 	logic din,
	input   logic [2:0]sel,
	output  logic [7:0]Y
	);
	always @(sel,din)begin
		case (sel)
			3'b000 : begin 
				Y[0]   <= din;
			 	Y[7:1] <= 1'b0;
	        end
			3'b001 : begin 
				Y[0]   <= 1'b0;
	         	Y[1]   <= din; 
			 	Y[7:2] <= 1'b0;
	        end
			3'b010 : begin 
		     Y[1:0] <= 1'b0;
	         Y[2]   <= din; 
			 Y[7:3] <= 1'b0;
			end
			3'b011 : begin 
				Y[2:0]   <= 1'b0;
	         	Y[3]   <= din; 
			 	Y[7:4] <= 1'b0;
			end
			3'b100 : begin 
				Y[3:0]   <= 1'b0;
	         	Y[4]   <= din; 
			 	Y[7:5] <= 1'b0;
			end
			3'b101 : begin 
				Y[4:0]   <= 1'b0;
	         	Y[5]   <= din; 
			 	Y[7:6] <= 1'b0;
			end
			3'b110 : begin 
		     	Y[5:0]   <= 1'b0;
	         	Y[6]   <= din; 
			 	Y[7] <= 1'b0;
			end
			3'b111 : begin 
		     	Y[6:0]   <= 1'b0;
	         	Y[7]   <= din; 
			end
		endcase
	end	
endmodule// demux8