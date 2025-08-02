`timescale 1ns / 1ps


module dflipflop(D, clk, Q);
    input D, clk;
    output reg Q;
    
    
    always @(posedge clk or negedge clk)
    begin
        Q <= D;
    end

endmodule
