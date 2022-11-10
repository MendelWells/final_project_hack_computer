//
//
//

//  `include 

module hack_top(
	// clock and reset 
	input   logic 		 clk, 
	input   logic 		 reset,
	// outputs to vga controlr 
	output   logic 		 hsync,   
	output   logic 		 vsync,
	output   logic 	     video_on,
	output   logic 		 p_tick,
	output   logic [9:0] x, 
	output   logic [9:0] y,
	// inputs and output from keyboard
	input    logic 		 PS2Data,
    input    logic 		 PS2Clk,
    output   logic 		 tx
);
    //-=-=-=-=-=-=-=-=-=-=- Internal signals =-=-=-=-=-=-=-=-=---=-=
	// cpu
	logic  [15:0] cpu_inM;
	logic  [15:0] cpu_instruction;
	logic  [15:0] cpu_outM;
	logic  		  cpu_writeM;
	logic  [14:0] cpu_address;
	logic  [14:0] cpu_pc;
	// RAM
	logic 		  ram16k_load;
	logic  [13:0] ram16k_addres;
	logic  [15:0] ram16k_data_in;
	logic  [15:0] ram16k_data_out; 
	
	
	//-=-=-=-=-=-=-=-=-=-=- Combinatorial Logic -=-=-=-=-=-=-=-=-=-=
	//-=-=-=-=-=-=-=-=-=-=- Block instanse  -=-=-=-=-=-=-=-=-=---=-=

    top keyboard_top_inst
	(
		.clk(clk),
		.PS2Data(PS2Data),
		.PS2Clk(PS2Clk),
		.tx(tx)
	);
	
	vga_sync vga_sync_inst
	(
		.clk(clk),
		.reset(reset),
		.hsync(hsync),
		.vsync(vsync),
		.video_on(video_on),
		.p_tick(p_tick),
		.x(x),
		.y(y)
	);
	
	cpu cpu_inst
	(
		.clk(clk),
		.rst_n(reset),
		.inM(cpu_inM),
		.instruction(cpu_instruction),
		.outM(cpu_outM),
		.writeM(cpu_writeM),
		.addressM(cpu_addressM),
		.pc(cpu_pc)
	);
	
	ram16k ram16k_inst
	(
		.clk(clk),
		.rst_n(reset),
		.load(ram16k_load),
		.addres(ram16k_addres),
		.data_in(ram16k_data_in),
		.data_out(ram16k_data_out) 
	);
	
	endmodule
