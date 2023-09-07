module rom_32
(
  input      [4:0] adrs,
  output reg [15:0] data
);
/* assably code
// Initializing the value 22
@22
D=A        // Load constant 22 into register D
@i         // Load address of variable i
M=D        // Store the value in register D (22) into variable i

// Initializing variables
@20
M=0        // Initialize variable @20 to 0
@21
M=1        // Initialize variable @21 to 1
D=M        // Load the value of variable @21 (which is 1) into register D

(LOOP)      // Loop label
@i          // Load address of variable i
A=M         // Load value of variable i into register A
M=M+D       // Increment value of variable i by the value in register D (1)
D=A         // Store the new value of variable i in register D

@2          // Load constant 2 into register A
D=D-A       // Subtract 2 from the value in register D (i - 2)
A=D         // Set register A to the value in register D

D=M         // Load the value stored at the address in register A into register D
@i          // Load address of variable i
A=M         // Load value of variable i into register A
M=M+D       // Add the value in register D to the value of variable i

D=M         // Load the updated value of variable i into register D
@i          // Load address of variable i
M=M+1       // Increment value of variable i by 1

@LOOP       // Jump back to the LOOP label
0;JMP       // Unconditional jump



*/
always @(*)
  case (adrs)
    0:  data =16'b0000000000010110; 
	1:  data =16'b1110110000010000; 
	2:  data =16'b0000000000010000; 
	3:  data =16'b1110001100001000; 
	4:  data =16'b0000000000010100; 
	5:  data =16'b1110101010001000; 
	6:  data =16'b0000000000010101; 
	7:  data =16'b1110111111001000;
	8:  data =16'b1111110000010000; 
	9:  data =16'b0000000000010000; 
	10: data =16'b1111110000100000; 
	11: data =16'b1111000010001000; 
	12: data =16'b1110110000010000; 
	13: data =16'b0000000000000010; 
	14: data =16'b1110010011010000; 
	15: data =16'b1110001100100000;
	16: data =16'b1111110000010000; 
	17: data =16'b0000000000010000; 
	18: data =16'b1111110000100000; 
	19: data =16'b1111000010001000; 
	20: data =16'b1111110000010000; 
	21: data =16'b0000000000010000; 
	22: data =16'b1111110111001000; 
	23: data =16'b0000000000001001;
	24: data =16'b1110101010000111;
	default: data =16'b0;
	endcase

endmodule

