`include "register.sv"
`include "alu.sv"
`include "jump_condition.sv"
`include "pc.sv"
 module cpu (
	input   logic clk,
	input   logic rst_n,
	// from/to data mem
	input 	logic 	[15:0] 	inM,        
	input 	logic 	[15:0] 	instruction,
	output 	logic 	[15:0] 	outM, 
	output  logic    		writeM,
	// to instruction mem
	output  logic 	[14:0]  addressM,
	output  logic 	[14:0]  pc
 );
 
    //-=-=-=-=-=-=-=-=-=-=-internal signals -=-=-=-=-=-=-=-=-=---=-=
	
	logic        load_A;
	logic 		 load_D;
	logic [15:0] alu_out;
    logic [15:0] a_reg_in;
	logic [15:0] A_reg;
	logic [15:0] D_reg;
	logic [15:0] y_alu_in;
	logic 		 zr;
	logic        ng;
	logic 		 jump_ind; // indicates if jump condetion has acouerd 
	
	//-=-=-=-=-=-=-=-=-=-=- Combinatorial Logic -=-=-=-=-=-=-=-=-=---=-=-=-=-=-=-=
	
	
	always_comb load_A = ~instruction[15] | instruction[5];   // for C instruction bit 5 and for A instruction Not bit 15
	always_comb load_D = instruction[15] & instruction[4];    // for C (bit 15)instruction bit 4 only 

	always_comb y_alu_in = instruction[12] ? inM : A_reg;    // (Mux_b) inpuut to the alu 
	
	always_comb a_reg_in = instruction[15] ? instruction : alu_out; // (Mux_a) inpuut to A register

	always_comb writeM = instruction[15] & instruction[3];    // enablemnt of write to RAM

	always_comb addressM = A_reg[14:0];
	
	always_comb outM = alu_out;
	
	//-=-=-=-=-=-=-=-=-=-=- Block instanse -=-=-=-=-=-=-=-=-=---=-=

	register D_register
	(
	 		.clk(clk),
	 		.rst_n(rst_n),
	 		.load(load_D),
			.data_in(alu_out),
			.data_out(D_reg) 
	);
	
    register A_register
	(
	 		.clk(clk),
	 		.rst_n(rst_n),
	 		.load(load_A),
			.data_in(a_reg_in),
			.data_out(A_reg) 
	);
 
	alu alu_inst
	(
			.x(D_reg),
			.y(y_alu_in),
			.zx(instruction[11]),
			.nx(instruction[10]),
			.zy(instruction[9]),
			.ny(instruction[8]),
			.f(instruction[7]),
			.no(instruction[6]),
			.out(alu_out),
			.zr(zr),
			.ng(ng)
	);	

	jump_condition jump_condition_inst 
	(
			.j0(instruction[0]),
			.j1(instruction[1]),
			.j2(instruction[2]),
			.zr(zr),
			.ng(ng),
			.jump(jump_ind)
	
	
	);
	
	pc pc_inst 
	(
			.clk(clk),
			.rst_n(rst_n),
			.load(jump_ind),         // detrmined by jump condition
			.clr('0),				 // clear counter
			.data_in(A_reg),
			.data_out(pc)
	);	
				
	endmodule