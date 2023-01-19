module alu_op_out(
	// data input
	input   logic [15:0] a,
	input   logic [15:0] b,
	// ctrl inputs
	input   logic 		 f,  // if f  then  out = x+y else out = x&y
	input	logic 		 no, // if no then  out = ~out
	// output of alu
	output  logic [15:0] out // output value from alu
	
);
// Note we are prioretising no

logic [15:0] out_intr;

always_comb out_intr = f ? (a+b) : (a&b);
always_comb out  	 = no ? (~out_intr):out_intr;


endmodule // alu
