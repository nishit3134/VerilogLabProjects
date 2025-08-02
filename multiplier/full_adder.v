`timescale 1ns / 1ps


module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;      // Sum output
    assign Cout = (A & B) | (Cin & (A ^ B)); // Carry output
endmodule
