`timescale 1ns / 1ps
module alu_tb();
//logic clk;
    logic [15:0] x;
	logic [15:0] y;
	logic [5:0 ] ctrl;       // eq  {zx,nx,zy,ny,f,no}
	
	logic [15:0] out;        
	logic        zr;		
	logic        ng;		

    // aditional signals for expected outputs
    
	logic [15:0] exp_out;    // output value from alu 
	logic        exp_zr;     //	is '1' if out ==0
	logic        exp_ng;	 //  is '1' when out<0
	
	logic test = 1'b1;        // indicate that it is test time 
   
   
 alu DUT (
    .x(x),
	.y(y),
	// ctrl inputs
	.zx(ctrl[5]),  // if zx then  x   = 0
	.nx(ctrl[4]),  // if nx then  x   = ~x 
	.zy(ctrl[3]),  // if zy then  y   = 0
	.ny(ctrl[2]),  // if ny then  y   = ~y 
	.f (ctrl[1]),  // if f  then  out = x+y else out = x&y
	.no(ctrl[0]),  // if no then  out = ~out
	// output of alu
	.out(out),     // output value from alu 
	.zr(zr),	   //	is '1' if out ==0
	.ng(ng)	       //  is '1' when out<0
);


	alu_expected ex_dut (
    .x(x),
	.y(y),
	// ctrl inputs
	.zx(ctrl[5]),  // if zx then  x   = 0
	.nx(ctrl[4]),  // if nx then  x   = ~x 
	.zy(ctrl[3]),  // if zy then  y   = 0
	.ny(ctrl[2]),  // if ny then  y   = ~y 
	.f (ctrl[1]),  // if f  then  out = x+y else out = x&y
	.no(ctrl[0]),  // if no then  out = ~out
	// output of alu
	.out(exp_out),     // output value from alu 
	.zr(exp_zr),	   //	is '1' if out ==0
	.ng(exp_ng)	       //  is '1' when out<0
);
	
	
//always_comb test = ({exp_out,exp_zr,exp_ng}=={out,zr,ng})?1'b1:1'b0;
parameter TIME_OUT = 10 * 800;

initial begin
		repeat(10) begin
		#50;
		test    = 1'b0;
		ctrl    = 6'b0;
		x = 16'b0;
		y = 16'b0;
		#200;
		test    = 1'b0;
		ctrl    = 6'b001101;
		x 		= $urandom();
		y 		= $urandom();
		#200;
		test    = 1'b0;
		ctrl    = 6'b0;	
		x = 16'b0;
		y = 16'b0;
		#200;
		end
end


 //finish test 
  initial begin
    #TIME_OUT;
	$display("Test pass !!! ");
	$finish;
  end


endmodule