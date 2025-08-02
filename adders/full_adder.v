`timescale 1ns / 1ps


module full_adder(
      input A,
      input B,
      input Cin,
      output Sout,
      output Cout
    );
    
    assign Sout = A^B^Cin;  //XOR
    assign Cout = (A&B)|(B&Cin)|(A&Cin); //carry out logic
endmodule
