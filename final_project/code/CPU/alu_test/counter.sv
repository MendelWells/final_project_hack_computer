module counter #(
    parameter WIDTH = 4
) (
    input clk,
    input rst_n,
    input inc,
    output reg [WIDTH-1:0] count
);

always_ff @ (posedge clk) begin
    if (~rst_n) begin
        count <= 16'b0;
    end else begin
        if (inc) begin
            count <= count + 1;
        end 
    end
end

endmodule