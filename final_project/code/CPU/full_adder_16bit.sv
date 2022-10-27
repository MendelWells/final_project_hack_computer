`include "full_adder.sv" 
module full_adder_16bit
(
	input  [15:0] a,
	input  [15:0] b, 
	output [15:0] sum	
	//output carry_out
);

logic carry_out [15:0];

        full_adder full_adder_inst_0
            ( 
              .a(a[0]),
              .b(b[0]),
              .carry_in('0),
              .sum(sum[0]),
              .carry_out(carry_out[0])
              );
genvar             i;
  generate
    for (i=1; i<16; i++) 
      begin
        full_adder full_adder_inst
            ( 
              .a(a[i]),
              .b(b[i]),
              .carry_in(carry_out[i-1]),
              .sum(sum[i]),
              .carry_out(carry_out[i])
              );
      end
  endgenerate
  
 // always_comb carry_out = carry_out[15];
 endmodule
 