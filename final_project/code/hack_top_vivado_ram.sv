module hack_top(
	// clock and reset 
	input   logic 		 clk, 
	input   logic 		 reset,
	output  logic  [15:0] led
);
    //-=-=-=-=-=-=-=-=-=-=- Internal signals =-=-=-=-=-=-=-=-=---=-=
	
	// ROM
	logic  [14:0] rom_address;
	logic  [15:0] rom_data_in;
	logic  [15:0] rom_instruction; 
	
	// cpu
	logic  [15:0] cpu_inM;
	logic  [15:0] cpu_instruction;
	logic  [15:0] cpu_outM;
	logic  		  cpu_writeM;
	logic  [14:0] cpu_addressM;
	logic  [14:0] cpu_pc;
	
	// RAM
	logic 		  ram_ena;
	logic  [13:0] ram_address;
	logic  [15:0] ram_data_in;
	logic  [15:0] ram_data_out; 
	
	
	
	//-=-=-=-=-=-=-=-=-=-=- Combinatorial Logic -=-=-=-=-=-=-=-=-=-=
	assign rom_address = cpu_pc;
	
	assign cpu_instruction = rom_instruction;
	assign cpu_inM = ram_data_out;

	assign ram_data_in = cpu_outM;
	assign ram_address = cpu_addressM;
	assign ram_ena     = cpu_writeM;
	
	assign led = ram_data_out;


	
	blk_mem_gen_0 rom_32k (
  .clka(clk),    // input wire clka
  .addra(rom_address),  // input wire [14 : 0] addra
  .douta(rom_instruction)  // output wire [15 : 0] douta
	);

/*
//small rom
	rom_8 rom_8_inst
	(
	.adrs(rom_address[2:0]),
	.data(rom_instruction)
	);
*/	
	// CPU instance
	cpu cpu_inst
	(
		// CAR
		.clk(clk),
		.rst_n(reset),
		// CPU I/F of ROM
		.instruction(cpu_instruction),
		.pc(cpu_pc),                  
		// CPU I/F of RAM 
		.inM(cpu_inM),                
		.outM(cpu_outM),         
		.writeM(cpu_writeM),     
		.addressM(cpu_addressM) 
	);
	
	//RAM instance

	blk_mem_gen_1 ram_inst (
	  .clka(clk),                    // input wire clka
	  .rsta(reset),                  // input wire rsta
	  .ena(1'b1),                 // input wire ena
	  .wea(ram_ena),                    // input wire [0 : 0] wea
	  .addra(ram_address),           // input wire [13 : 0] addra
	  .dina(ram_data_in),            // input wire [15 : 0] dina
	  .douta(ram_data_out),          // output wire [15 : 0] douta
	  .rsta_busy()  				 // output wire rsta_busy
	);
		
	
	/*
	
	ram16k ram16k_inst( 
		.clk(clk),
		.rst_n(reset),
		.load(ram_ena),
		.address(ram_address),
		.data_in(ram_data_in),
		.data_out (ram_data_out)
	);
	
	*/
	
	endmodule
