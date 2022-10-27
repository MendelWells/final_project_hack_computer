`include "full_adder_16bit.sv"
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
 
 // internal signals 
	logic [15:0] x_intr   ;
	logic [15:0] y_intr   ;
	logic [15:0] out_intr ;
	logic [15:0] x_plus_y ; 
 
	
always_ff @( zx, nx, x) begin
		if(zx) begin 
			if(nx) // zx & nx
				x_intr <= 16'b1;
			else  // zx & ~nx
				x_intr <= 16'b0;
			end
		else  begin // ~zx & nx
			if(nx)
				x_intr <= ~x;
			else  // ~nx & ~zx
				x_intr <= x;
			end
		end
	
always_ff @( zy, ny, y) begin
		if(zy) begin 
			if(ny) // zy & ny
				y_intr <= 16'b1;
			else  // zy & ~ny
				y_intr <= 16'b0;
			end
		else  begin // ~zy & ny
			if(ny)
				y_intr <= ~y;
			else  // ~ny & ~zy
				y_intr <= y;
			end
		end


always_comb  out_intr= f ? x_plus_y: (x_intr & y_intr);
	
always_comb  out = no ? (~out_intr) : out_intr;

full_adder_16bit full_adder_16bit_inst
(
	.a (x_intr),
	.b (y_intr),
	.sum(x_plus_y)	
	//.carry_out()
);


always_comb  zr = (out[15:0] == 16'b0) ? 1'b01 : 1'b0;  
always_comb  ng = (out[15:0] < 16'b0) ? 1'b01 : 1'b0;


endmodule; // alu
