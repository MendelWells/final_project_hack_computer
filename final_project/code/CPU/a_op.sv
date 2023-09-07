module a_op(
	// data input
	input   logic [15:0] a,
	// ctrl inputs
	input   logic 		 za, // if za then  a   = 0
	input   logic 		 na, // if na then  a   = ~a 
	
	// output of alu
	output  logic [15:0] out_a // output value from alu 
	
);
// Note we are prioretising na

logic [15:0] a_intr;

always_comb  a_intr = za ? 16'b0 : a;

always_comb  out_a = na?(~a_intr):a_intr;


endmodule
