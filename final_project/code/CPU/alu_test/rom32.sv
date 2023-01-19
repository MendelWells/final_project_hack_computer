module rom32(input [4:0] addr, output reg [15:0] data);
   reg [15:0] mem [0:31]; // 32 16-bit memory locations
   initial begin
      // initialize memory with example values
	  // for a set of 3 values are {X,Y,ctrl} respectfuly 
      mem[0] = 16'd85;
      mem[1] = 16'd20;
      mem[2] = {10'b0,6'b001100};//X
	  // for a set of 3 values are {X,Y,ctrl} respectfuly 
	  mem[3] = 16'd25;
      mem[4] = 16'd69;
      mem[5] = {10'b0,6'b110000};//Y
	  
	  mem[6] = 16'd100;
      mem[7] = 16'd20;
      mem[8] = {10'b0,6'b011111};//X+1
	  
	  mem[9] = 16'd15;
      mem[10] = 16'd100;
      mem[11] = {10'b0,6'b110010};//Y-1
	  
	  mem[12] = 16'd20;
      mem[13] = 16'd180;
      mem[14] = {10'b0,6'b000010};//X+Y
	  
	  mem[15] = 16'd135; 
      mem[16] = 16'd57;
      mem[17] = {10'b0,6'b010011};//X-Y =78
	  
	  mem[18] = 16'd130;
      mem[19] = 16'd200;
      mem[20] =  {10'b0,6'b000111};//Y-X = -70 -> b'1111 1111 1011 1010
	  
	  mem[21] = 16'd2130;
      mem[22] = 16'd1598;
      mem[23] =  {10'b0,6'b010101};//X|Y = 3170 -> b'1110 0111 1110
	  
	  mem[24] = 16'd2468;
	  mem[25] = 16'd1357;
	  mem[26] =  {10'b0,6'b111010};//-1
	  
	  mem[27] = 16'hfff3; //=d-13
	  mem[28] = 16'd1562;
	  mem[29] =  {10'b0,6'b001101};//~X = 12
      
	  mem[30] = 16'b0;
      mem[31] = 16'b0;
   end
   always_comb begin
      data = mem[addr];
   end
endmodule
