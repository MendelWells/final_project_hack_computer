module alu_ram64_test_basys3(
	input		  clk,
	input         rst_n,
	input         address_inc,
	input   [2:0] alu_sel_in,
	input   	  ssd_sel,
	output  [3:0] ssd_anode,
	output  [6:0] ssd_cathode

);



//-=-=-=-=-=-=-=-=-=-=-=-=//
// Internal signals       //
//-=-=-=-=-=-=-=-=-=-=-=-=//

logic  [15:0] rom_data_out;
logic  [4:0] rom_addres;
logic  [15:0] ssd_data_in;
logic  [15:0] alu_data_out;
logic  [15:0] x;
logic  [15:0] y;
logic  [5:0] ctrl;
logic  [6:0] ssd_cathode_lane0;
logic  [6:0] ssd_cathode_lane1;
logic  [6:0] ssd_cathode_lane2;
logic  [6:0] ssd_cathode_lane3;
logic  [1:0] ssd_counter;

//-=-=-=-=-=-=-=-=-=-=-=-=//
// Logic                  //
//-=-=-=-=-=-=-=-=-=-=-=-=//
always_comb ssd_data_in = ssd_sel?rom_data_out:alu_data_out;

//-=-=-=-=-=-=-=-=-=-=-=-=//
// Bloack instanse        //
//-=-=-=-=-=-=-=-=-=-=-=-=//
counter  #(.WIDTH(6))
	u_counter	
(
    .clk(clk),
    .rst_n(rst_n),
    .inc(address_inc),
    .count(rom_addres)
);


	rom32 u_rom32
	(
		.addr(rom_addres),
		.data(rom_data_out)
	);
	

	
	 register x_register
	 (
	.clk(clk),
	.rst_n(rst_n),
	.load(alu_sel_in[0]),
	.data_in(rom_data_out),
	.data_out(x)
	);
	
	
	 register y_register
	 (
	.clk(clk),
	.rst_n(rst_n),
	.load(alu_sel_in[1]),
	.data_in(rom_data_out),
	.data_out(y)
	);
	
	
	 register ctrl_register
	 (
	.clk(clk),
	.rst_n(rst_n),
	.load(alu_sel_in[2]),
	.data_in({9'b0,rom_data_out[5:0]}),
	.data_out(ctrl)
	);
	
	
	 alu u_alu
	 (
	.x(x),
	.y(y),
	.zx(ctrl[0]), 
	.nx(ctrl[1]),  
	.zy(ctrl[2]), 
	.ny(ctrl[3]),  
	.f(ctrl[4]),  
	.no(ctrl[5]), 
	.out(alu_data_out),
	.zr(),	
	.ng()	
);

 Binary_To_7Segment u0_Binary_To_7Segment
  (
       .i_Clk(clk),
       .i_Binary_Num(ssd_data_in[3:0]),
       .o_Segment_A(ssd_cathode_lane0[0]),
       .o_Segment_B(ssd_cathode_lane0[1]),
       .o_Segment_C(ssd_cathode_lane0[2]),
       .o_Segment_D(ssd_cathode_lane0[3]),
       .o_Segment_E(ssd_cathode_lane0[4]),
       .o_Segment_F(ssd_cathode_lane0[5]),
       .o_Segment_G(ssd_cathode_lane0[6])
   );

Binary_To_7Segment u1_Binary_To_7Segment
  (
       .i_Clk(clk),
       .i_Binary_Num(ssd_data_in[7:4]),
       .o_Segment_A(ssd_cathode_lane1[0]),
       .o_Segment_B(ssd_cathode_lane1[1]),
       .o_Segment_C(ssd_cathode_lane1[2]),
       .o_Segment_D(ssd_cathode_lane1[3]),
       .o_Segment_E(ssd_cathode_lane1[4]),
       .o_Segment_F(ssd_cathode_lane1[5]),
       .o_Segment_G(ssd_cathode_lane1[6])
   );

Binary_To_7Segment u2_Binary_To_7Segment
  (
       .i_Clk(clk),
       .i_Binary_Num(ssd_data_in[11:7]),
       .o_Segment_A(ssd_cathode_lane2[0]),
       .o_Segment_B(ssd_cathode_lane2[1]),
       .o_Segment_C(ssd_cathode_lane2[2]),
       .o_Segment_D(ssd_cathode_lane2[3]),
       .o_Segment_E(ssd_cathode_lane2[4]),
       .o_Segment_F(ssd_cathode_lane2[5]),
       .o_Segment_G(ssd_cathode_lane2[6])
   );

Binary_To_7Segment u3_Binary_To_7Segment
  (
       .i_Clk(clk),
       .i_Binary_Num(ssd_data_in[15:11]),
       .o_Segment_A(ssd_cathode_lane3[0]),
       .o_Segment_B(ssd_cathode_lane3[1]),
       .o_Segment_C(ssd_cathode_lane3[2]),
       .o_Segment_D(ssd_cathode_lane3[3]),
       .o_Segment_E(ssd_cathode_lane3[4]),
       .o_Segment_F(ssd_cathode_lane3[5]),
       .o_Segment_G(ssd_cathode_lane3[6])
   );


 mux4 anode_mux4(
	.sel (ssd_counter),
	.data_out(ssd_anode)
	);
	
	mux4_7bit catode_mux4_7bit
	(
	.data_in({ssd_cathode_lane3,ssd_cathode_lane2,ssd_cathode_lane1,ssd_cathode_lane0}),
	.sel (ssd_counter),
	.data_out(ssd_anode)
	);
	
	








endmodule
