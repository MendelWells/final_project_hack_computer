 module cpu (
    // Clock and Reset
	input   logic clk,
	input   logic rst,
	// From RAM
 	input 	logic 	[15:0] 	inM,  
    // From ROM ( instruction memorey )	
	input 	logic 	[15:0] 	instruction,
	// TO RAM
	output 	logic 	[15:0] 	outM, 
	output  logic    		writeM,
	output  logic 	[14:0]  addressM,
	// To ROM
	output  logic 	[14:0]  pc
 );
    
	//-=-=-=-=-=-=-=-=-=-=- Internal signals -=-=-=-=-=-=-=-=-=-=-=-=//
	logic ng;
	logic zr;
	logic [5:0]alu_op;
	logic [15:0]alu_out;
	logic [15:0]x_alu_in;
	logic [15:0]y_alu_in;


	

	//-=-=-=-=-=-=-=-=-=-=- Block instanse   -=-=-=-=-=-=-=-=-=-=-=-=//

	ctrl ctrl_inst (
			
		// CAR
		.clk(clk),
		.rst(rst),
		// From RAM
		.inM(inM),
		// From ROM
		.instruction(instruction),
		// From ALU
		.ng(ng),
		.zr(zr),
		.alu_out(alu_out),
		// TO ALU
		.x_alu_in(x_alu_in),
		.y_alu_in(y_alu_in),
		.alu_op(alu_op),
		// To RAM
		.writeM(writeM),
		.addressM(addressM),
		// To ROM
		.pc(pc)

	);
 
	alu alu_inst
	(
			.x(x_alu_in),
			.y(y_alu_in),
			.alu_op(alu_op),
			.out(alu_out),
			.zr(zr),
			.ng(ng)
	);	

	always_comb outM = alu_out;	
				
	endmodule