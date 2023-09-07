module rom_8
(
  input      [2:0] adrs,
  output reg [15:0] data
);
/* assambly
@0 //000 0000000 000 000
D=1//111 0111111 010 000
A=D
M=D
D=D+1
@2
0;JMP
*/
always @(*)
  case (adrs)
    0: data =16'b0000000000000000; 
	1: data =16'b1110111111010000; 
	2: data =16'b1110001100100000; 
	3: data =16'b1110001100001000; 
	4: data =16'b1110011111010000; 
	5: data =16'b0000000000000010; 
	6: data =16'b1110101010000111; 
	7: data =16'b0; 
	endcase

endmodule
