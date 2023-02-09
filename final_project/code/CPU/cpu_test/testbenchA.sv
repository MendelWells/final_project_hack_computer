`timescale 1ns / 1ps

module testbenchA();
  
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

  logic   [15:0]  mem [164:0];
  parameter TIME_OUT = (120 * 10) ;


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


initial begin
	rst_n = 1'b0;
	#15
    rst_n = 1'b1;
	$readmemb({"../cpu_test/rom.bin"}, mem);
    for (int i=0;i<120;i++)begin
		instruction <= mem[i];
		inM <= $urandom();
		#10;
	end
end
  
  //finish test 
  initial begin
    #TIME_OUT;
	$display("Test pass !!! ");
	$finish;
  end
 
endmodule
