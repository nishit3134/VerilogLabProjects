`timescale 1ns / 1ps


module ripple_carry_adder #(parameter N=4)(
      input [N-1:0] A,
      input [N-1:0] B,
      input Cin,
      
      output [N-1:0] Sout,
      output [N-1:0] Cout      
    );
    wire [N:0] carry;
    assign carry[0]=Cin;
    
    genvar i;
    generate
    for (i=0; i<N; i=i+1)
       begin : full_adder_chain
       full_adder FA (
          .A(A[i]),
          .B(B[i]),
          .Cin(carry[i]),
          .Sout(Sout[i]),
          .Cout(carry[i+1])
       );
       end 
    endgenerate
    
    assign Cout = carry[N];
      
endmodule
