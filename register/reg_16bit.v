`timescale 1ns / 1ps

module reg_16bit (
    output reg [15:0] A,
    input clk, clr, load, incr,
    input [15:0] load_input
);

always @(posedge clk) begin
    if (clr)
        A <= 16'b0;
    else if (load)
        A <= load_input;
    else if (incr)
        A <= A + 1;
end

endmodule
