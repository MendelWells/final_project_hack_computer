module alu_expected(
	// data inputs
	input   logic [15:0] x,
	input   logic [15:0] y,
	// ctrl inputs
	input   logic 		 zx, // if zx then  x   = 0
	input   logic 		 nx, // if nx then  x   = ~x 
	input   logic 		 zy, // if zy then  y   = 0
	input   logic 		 ny, // if ny then  y   = ~y 
	input   logic 		 f,  // if f  then  out = x+y else out = x&y
	input	logic 		 no, // if no then  out = ~out
	// output of alu
	output  logic [15:0] out, // output value from alu 
	output  logic        zr,		//	is '1' if out ==0
	output  logic        ng		//  is '1' when out<0
);
 
always @(zx,nx,zy,ny,f,no) begin

	case({zx,nx,zy,ny,f,no})
		
	  6'b101010     :   out = 16'b0 ;
	  6'b111111     :   out = 16'b1 ;
	  6'b111010     :   out = -16'b1;
	  6'b001100     :   out = x;
	  6'b110000     :   out = y;
	  6'b001101     :   out = ~x;
	  6'b110001     :   out = ~y;
	  6'b001111     :   out = -x;
	  6'b110011     :   out = -y;
	  6'b011111     :   out = x+1;
	  6'b110111     :   out = y+1;
	  6'b001110     :   out = x-1;
	  6'b110010 	:	out = y-1;
	  6'b000010     :   out = x+y;
	  6'b010011     :   out = x-y;
	  6'b000111     :   out = y-x;
	  6'b000000     :   out = x&y;
	  6'b010101     :   out = x|y;
	  default :out = 16'b0;
	  
	endcase
end
	
	always_comb zr = (out == 16'b0) ? 1'b1:1'b0;
	always_comb ng = (out[15] ==  1'b1) ? 1'b1:1'b0;
	


endmodule // alu_exp
