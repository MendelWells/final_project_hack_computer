`timescale 1ns / 1ps
module alu_tb_edge();
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
	
	logic test_out = 1'b1;        // indicate that it is test is pass 
	logic test_zr = 1'b1;        // indicate that it is test is pass 
	logic test_ng = 1'b1;        // indicate that it is test is pass 
  
   
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


always @* begin
	if (out == exp_out)
		test_out =1'b1;
	else
		test_out =1'b0;
		
	if (zr == exp_zr)
		test_zr =1'b1;
	else
		test_zr =1'b0;
		
	if (ng == exp_ng)
		test_ng =1'b1;
	else
		test_ng =1'b0;

	

end
	logic [17:0][5:0] test_table;

	always_comb test_table[0][5:0] =  6'b101010 ;  
	always_comb test_table[1][5:0] =  6'b111111 ;  
	always_comb test_table[2][5:0] =  6'b111010 ;  
	always_comb test_table[3][5:0] =  6'b001100 ;  
	always_comb test_table[4][5:0] =  6'b110000 ;  
	always_comb test_table[5][5:0] =  6'b001101 ;  
	always_comb test_table[6][5:0] =  6'b110001 ;  
	always_comb test_table[7][5:0] =  6'b001111 ;  
	always_comb test_table[8][5:0] =  6'b110011 ;  
	always_comb test_table[9][5:0] =  6'b011111 ;  
	always_comb test_table[10][5:0]=  6'b110111 ;  
	always_comb test_table[11][5:0]=  6'b001110 ;  
	always_comb test_table[12][5:0]=  6'b110010 ;	
	always_comb test_table[13][5:0]=  6'b000010 ;  
	always_comb test_table[14][5:0]=  6'b010011 ;  
	always_comb test_table[15][5:0]=  6'b000111 ;  
	always_comb test_table[16][5:0]=  6'b000000 ;  
	always_comb test_table[17][5:0]=  6'b010101 ;  
	
	
parameter TIME_OUT = (650 * 3 * 18 * 4 +650 * 100) ;

initial begin
	for (int i=0;i<18;i++) begin


		// case_1 x=16'b0 ;y=16'b0	 
		repeat(3) begin
		// zero before test
		#50;
		ctrl    = 6'b0;
		x = 16'b0;
		y = 16'b0;
		#200;
		// set ctrl values for test
		ctrl    = test_table[i];
		x 		= 16'b0;
		y 		= 16'b0;
		#200;
		// zero after test
		ctrl    = 6'b0;	
		x = 16'b0;
		y = 16'b0;
		#200;
		end
		
		
		// case_2 x=16'hffff ;y=16'fffff
		repeat(3) begin
		// zero before test
		#50;
		ctrl    = 6'b0;
		x 		= 16'b0;
		y 		= 16'b0;
		#200;
		// set ctrl values for test
		ctrl    = test_table[i];
		x = 16'hffff;//Two's compliment -1
		y = 16'hffff;//Two's compliment -1
		#200;
		// zero after test
		ctrl    = 6'b0;	
		x = 16'b0;
		y = 16'b0;
		#200;
		end
		
		
		// case_3 x=16'hffff ;y=16'b0
		repeat(3) begin
		// zero before test
		#50;
		ctrl    = 6'b0;
		x = 16'b0;
		y = 16'b0;
		#200;
		// set ctrl values for test
		ctrl    = test_table[i];
		x 		= 16'hffff;
		y 		= 16'b0;
		#200;
		// zero after test
		ctrl    = 6'b0;	
		x = 16'b0;
		y = 16'b0;
		#200;
		end
		
		// case_4 x=16'b0 ;y=16'hffff
		repeat(3) begin
		// zero before test
		#50;
		ctrl    = 6'b0;
		x = 16'b0;
		y = 16'b0;
		#200;
		// set ctrl values for test
		ctrl    = test_table[i];
		x 		= 16'b0;
		y 		= 16'hffff;
		#200;
		// zero after test
		ctrl    = 6'b0;	
		x = 16'b0;
		y = 16'b0;
		#200;
		end
		
		
	end	
	// random value of ctrl, to check values that not appear in the table
		repeat(100) begin
		// zero before test
		#50;
		ctrl    = 6'b0;
		x = 16'b0;
		y = 16'b0;
		#200;
		// set ctrl values for test
		ctrl    = $urandom();
		x 		= $urandom();
		y 		= $urandom();
		#200;
		// zero after test
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