module alu(
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
logic [15:0] x_intr;
logic [15:0] y_intr;

	a_op 	x_op(
		.a(x),
		.za(zx), // if za then  a   = 0
		.na(nx), // if na then  a   = ~a 
		.out_a(x_intr) // output value from alu 
	
	);
  
  
	a_op 	y_op(
		.a(y),
		.za(zy), // if za then  a   = 0
		.na(ny), // if na then  a   = ~a 
		.out_a(y_intr) // output value from alu 
	
	);
   
  
   alu_op_out alu_op_out_inst(
		.a(x_intr),
		.b(y_intr),
		.f(f),  // if f  then  out = x+y else out = x&y
		.no(no), // if no then  out = ~out
		.out(out) // output value from alu
	
	);
	
	always_comb zr = (out == 16'b0) ? 1'b1:1'b0;
	always_comb ng = (out <  16'b0) ? 1'b1:1'b0;
	


endmodule; // alu
