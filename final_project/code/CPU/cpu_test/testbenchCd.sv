`timescale 1ns / 1ps

module testbenchCd();
  
// inputs cpu
  logic clk;
  logic rst_n;
  logic [15:0] inM;
  logic [15:0] instruction;

// outputs cpu
  logic [15:0] outM;
  logic writeM;
  logic [14:0] addressM;
  logic [14:0] pc;

  logic        a;
  logic  [5:0] alu_ctrl;
  logic  [2:0] ddd;
  logic  [2:0] jjj;
  logic   [15:0]  mem [164:0];
  logic [15:0] temp;
  parameter TIME_OUT = (120 * 10) ;
  parameter CLK_CYCLE = 10;


	logic [2:0][2:0] test_table;
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
	always_comb test_table[0][2:0] =  3'b000 ;  // None    :Output not stored
	always_comb test_table[1][2:0] =  3'b001 ;  //         :M
	always_comb test_table[2][2:0] =  3'b010 ;  //         :D
	always_comb test_table[3][2:0] =  3'b011 ;  //         :D and M
	always_comb test_table[4][2:0] =  3'b100 ;  //         :A
	always_comb test_table[5][2:0] =  3'b101 ;  //         :A and M
	always_comb test_table[6][2:0] =  3'b110 ;  //         :A and D
	always_comb test_table[7][2:0] =  3'b111 ;  //         :A and D and M 

//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
  // instance of the CPU module
  cpu dut (
    .clk(clk),
    .rst_n(rst_n),
    .inM(inM),
    .instruction(instruction),
    .outM(outM),
    .writeM(writeM),
    .addressM(addressM),
    .pc(pc)
  );


//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=   
  // clock generator
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=   

initial begin
	rst_n = 1'b0;
	#15
    rst_n = 1'b1;
	a=0;
   
	#CLK_CYCLE
	#CLK_CYCLE
	#CLK_CYCLE
	
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
	for (int i=0;i<8;i++) begin
		alu_ctrl = $urandom();	
		jjj = $urandom();
		ddd =i;
		a=~a;
		testbenchCd.dut.a_reg_in += 16;
		temp = (16'h0123+i);
		force testbenchCd.dut.a_reg_in = temp;
	    force testbenchCd.dut.inM = 16'hfafa;
		instruction ={3'b111,a,alu_ctrl,ddd,jjj}; //C instruction 
		
		$display("The value of ddd is: %b     \nThe values of load: writeM =%b   load_A =%b   load_D =%b \n", ddd,testbenchCd.dut.writeM,testbenchCd.dut.load_A,testbenchCd.dut.load_D);
		#CLK_CYCLE;// wait one clock cycle
		$display("After Clock cycle:   outM =%d    A_reg =%d    D_reg =%d \n",testbenchCd.dut.outM,testbenchCd.dut.A_reg,testbenchCd.dut.D_reg);
	//	#CLK_CYCLE;
	end
end
  
  //finish test 
  initial begin
    #TIME_OUT;
	$display("Test pass !!! ");
	$finish;
  end
 
endmodule
