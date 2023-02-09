`timescale 1ns / 1ps

module testbenchCj();
  
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
 // logic  [2:0] temp;
  parameter TIME_OUT = (120 * 10) ;
  parameter CLK_CYCLE = 10;


	logic [2:0][2:0] test_table;
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
	always_comb test_table[0][2:0] =  3'b000 ;  // No Jump :
	always_comb test_table[1][2:0] =  3'b001 ;  // JGT     :ALU output greater than 0
	always_comb test_table[2][2:0] =  3'b010 ;  // JEQ     :ALU output equals 0
	always_comb test_table[3][2:0] =  3'b011 ;  // JGE     :ALU output greater than or equal 0
	always_comb test_table[4][2:0] =  3'b100 ;  // JLT     :ALU output less than 0 
	always_comb test_table[5][2:0] =  3'b101 ;  // JNE     :ALU output not equal 0
	always_comb test_table[6][2:0] =  3'b110 ;  // JLE     :ALU output less than or equal 0
	always_comb test_table[7][2:0] =  3'b111 ;  // JMP     :Unconditional  branch

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
	a=1;
	#CLK_CYCLE
	#CLK_CYCLE
	#CLK_CYCLE
//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= 
	for (int i=0;i<8;i++) begin
		alu_ctrl = $urandom();	
		ddd = $urandom();
		jjj=i;
		instruction ={3'b111,a,alu_ctrl,ddd,jjj};   //ALU output greater than 0
		force testbenchCj.dut.A_reg=16'h00AB;      // force to see if pc valu change to A_reg
		// out<0 => zr=0,ng=1
		force testbenchCj.dut.zr = 0;
		force testbenchCj.dut.ng = 1;
		#CLK_CYCLE
		// out=0 => zr=1,ng=0
		force testbenchCj.dut.zr = 1;
		force testbenchCj.dut.ng = 0;
		#CLK_CYCLE
		// out>0 => zr,ng=0
		force testbenchCj.dut.zr = 0;
		force testbenchCj.dut.ng = 0;
		#CLK_CYCLE;
		// zr,ng=1 No Jump realy a posebely cannot be also zero and also negative
		//force testbenchCj.dut.zr = 1;
		//force testbenchCj.dut.ng = 1;
		//#CLK_CYCLE;
	end
end
  
  //finish test 
  initial begin
    #TIME_OUT;
	$display("Test pass !!! ");
	$finish;
  end
 
endmodule
