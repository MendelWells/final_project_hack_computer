// simple full adder the sum equal to a + b + carry_in
// carry bit is semply to tell 
// us if there is a carry out in the add 

module full_adder (
	// input
	input 	logic a,
	input 	logic b,
	input 	logic carry_in,
	// outputs
	output	logic sum,
	output  logic carry_out
);

// internal signals 

	logic a_xor_b;
	logic a_and_b;
	logic a_xor_b_and_carry;

//logic


always_comb 	a_xor_b 			= a ^ b; // bitwise XOR
always_comb 	a_and_b 			= a & b; // bitwise AND
always_comb	 	a_xor_b_and_carry	= a_xor_b & carry_in; 
always_comb 	sum					= a_xor_b ^ carry_in;
always_comb 	carry_out			= a_and_b | a_xor_b_and_carry;

endmodule// full_adder
