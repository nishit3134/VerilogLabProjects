`timescale 1ns / 1ps


module comparator(
     input [3:0] a, b,
     output [3:0] max, min
    );
    wire sel;
    assign sel=a>b;
    
    assign max=sel?a:b;
    assign min=sel?b:a;
    
endmodule
