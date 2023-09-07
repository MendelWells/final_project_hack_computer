module ctrl(
// CAR
input  logic        clk,
input  logic        rst_n,
// From RAM
input  logic  [15:0]inM,
// From ROM
input  logic  [15:0]instruction,

// From ALU
input logic         ng,
input logic         zr,
input logic   [15:0]alu_out,

// TO ALU
output  logic [15:0]x_alu_in,
output  logic [15:0]y_alu_in,
output  logic [5:0] alu_op,

// To RAM
output  logic writeM,
output  logic [14:0]addressM,
// To ROM
output  logic [14:0] pc



);

//-=-=-=-=-=-=-=-=-=-=-internal signals -=-=-=-=-=-=-=-=-=---=-=
	
	logic        load_A;
	logic 		 load_D;
    logic [15:0] a_reg_in;
	logic [15:0] d_reg_in;
	logic [15:0] A_reg;
	logic [15:0] D_reg;

	logic 		 jump_ind;      // indicates if jump condetion has acouerd 
    // signals to decode the instruction
	logic        A_instruction; // Determine what type of instruction for A "0"
	logic        C_instruction; // Determine what type of instruction for C "1"
	logic        a;             // instruction[12] selct signal for y_alu_in
//	logic [5:0]  alu_op;        // instruction bits to set ALU oporation//
	logic [2:0]  ddd;           // instruction[5:3] determine alu destenation
	logic [2:0]  jjj;           // instruction[2:0] determine jump type
	
	//-=-=-=-=-=-=-=-=-=-=- Decode Instruction  -=-=-=-=-=-=-=-=-=---=-=-=-=-=-=-=//
	
	always_comb A_instruction = ~instruction[15];
	always_comb C_instruction = instruction[15];
	always_comb a      = instruction[12];
	always_comb alu_op = instruction[11:6];
	always_comb ddd    = instruction[5:3];
	always_comb jjj    = instruction[2:0];
	
	
	//-=-=-=-=-=-=-=-=-=-=- Combinatorial Logic -=-=-=-=-=-=-=-=-=---=-=-=-=-=-=-=//
	
	// A instruction is characterized when instruction[15]="0"
	// C instruction is characterized when instruction[15]="1"
	// 		instruction[5]=d2 - write enable for Aregister
	// 		instruction[4]=d1 - write enable for Dregister
	//	    instruction[3]=d0 - write enable for RAM[A]
	
	// load to registers and RAM
	always_comb load_A =  A_instruction | ddd[2];    // for A instruction or for C instruction[5] (d2) load A Register
	always_comb load_D =  C_instruction & ddd[1];    // only for C instruction type whan d1 load D Register
	always_comb writeM =  C_instruction & ddd[0];    // only for C instruction type when d0 so enable write to RAM
	
	// register inputs
	always_comb a_reg_in = C_instruction ? alu_out : instruction; // (Mux_a) inpuut to A register
    always_comb d_reg_in = alu_out;

	always_comb x_alu_in = D_reg ;                  // input for the X oprand of ALU
	// select for Muxes 
	always_comb y_alu_in = a ? inM : A_reg;         // (Mux_b) inpuut to the alu 
	// output to RAM
	always_comb addressM = A_reg[14:0];
	
	//-=-=-=-=-=-=-=-=-=-=- Block instanse -=-=-=-=-=-=-=-=-=---=-=//

	
	
    register A_register
	(
	 		.clk(clk),
	 		.rst_n(rst_n),
	 		.load(load_A),
			.data_in(a_reg_in),
			.data_out(A_reg) 
	);
	
	register D_register
	(
	 		.clk(clk),
	 		.rst_n(rst_n),
	 		.load(load_D),
			.data_in(d_reg_in),
			.data_out(D_reg) 
	);
	
	
	jump_condition jump_condition_inst 
	(
			.jjj(jjj),
			.zr(zr),
			.ng(ng),
			.jump(jump_ind)
	
	
	);
	
	pc pc_inst 
	(
			.clk(clk),
			.rst_n(rst_n),
			.load(jump_ind & C_instruction),         // determined by jump condition the AND is for masking jump_ind in A instruction			
			.data_in(A_reg[14:0]),
			.data_out(pc)
	);	
	
	endmodule