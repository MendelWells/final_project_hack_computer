module jump_condition(
		input  logic j0,
		input  logic j1,
		input  logic j2,
		input  logic zr,
		input  logic ng,
		output logic jump
);


    always @ ( j0 , j1 , j2, ng , zr) begin
		 
		 case ({j2,j1,j0})
			3'b000 : jump <= 1'b0;    // no jump
			
			3'b001 : if ( ~zr & ~ng ) // greater then zero
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b010 : if ( zr & ~ng )  // eqel to zero 
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b011 : if ( zr | ~ng )   // JGE
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b100 : if ( ~zr & ng )   // JLT
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b101 : if ( ~zr )  // JNE
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b110 : if ( zr | ng ) // JLE
						jump <= 1'b1;
					 else
						jump <= 1'b0;
						
			3'b111 :  jump <= 1'b1;  // Unconditional Jump
		 
		endcase

	end 
 
endmodule