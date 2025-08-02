`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2025 16:58:48
// Design Name: 
// Module Name: multiplier_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_4bit (
    input [3:0] A,
    input [3:0] B,
    output [7:0] Product
);
    wire [3:0] P[3:0]; // Intermediate products
    wire [7:0] S;      // Final sum
    wire [7:0] C;      // Carry signals

    // Generate partial products
    assign P[0] = A & {4{B[0]}}; // P[0] = A * B[0]
    assign P[1] = A & {4{B[1]}}; // P[1] = A * B[1] << 1
    assign P[2] = A & {4{B[2]}}; // P[2] = A * B[2] << 2
    assign P[3] = A & {4{B[3]}}; // P[3] = A * B[3] << 3

    // Add the partial products using adders
    // Stage 1: Add P[0] and P[1]
    wire [4:0] S1;
    wire C1;
    full_adder FA0(.A(P[0][0]), .B(P[1][0]), .Cin(0), .Sum(S1[0]), .Cout(C1));
    full_adder FA1(.A(P[0][1]), .B(P[1][1]), .Cin(C1), .Sum(S1[1]), .Cout(C1));
    full_adder FA2(.A(P[0][2]), .B(P[1][2]), .Cin(C1), .Sum(S1[2]), .Cout(C1));
    full_adder FA3(.A(P[0][3]), .B(P[1][3]), .Cin(C1), .Sum(S1[3]), .Cout(S1[4])); // C1 carries out to S1[4]

    // Stage 2: Add S1 and P[2]
    wire [5:0] S2;
    wire C2;
    full_adder FA4(.A(S1[0]), .B(P[2][0]), .Cin(0), .Sum(S2[0]), .Cout(C2));
    full_adder FA5(.A(S1[1]), .B(P[2][1]), .Cin(C2), .Sum(S2[1]), .Cout(C2));
    full_adder FA6(.A(S1[2]), .B(P[2][2]), .Cin(C2), .Sum(S2[2]), .Cout(C2));
    full_adder FA7(.A(S1[3]), .B(P[2][3]), .Cin(C2), .Sum(S2[3]), .Cout(S2[4])); // C2 carries out to S2[4]
    assign S2[5] = C2; // Carry out from this stage

    // Stage 3: Add S2 and P[3]
    wire [6:0] S3;
    wire C3;
    full_adder FA8(.A(S2[0]), .B(P[3][0]), .Cin(0), .Sum(S3[0]), .Cout(C3));
    full_adder FA9(.A(S2[1]), .B(P[3][1]), .Cin(C3), .Sum(S3[1]), .Cout(C3));
    full_adder FA10(.A(S2[2]), .B(P[3][2]), .Cin(C3), .Sum(S3[2]), .Cout(C3));
    full_adder FA11(.A(S2[3]), .B(P[3][3]), .Cin(C3), .Sum(S3[3]), .Cout(S3[4])); // C3 carries out to S3[4]
    assign S3[5] = S2[4]; // Add carry from previous stage
    assign S3[6] = C3; // Final carry out

    // Final Product Assignment
    assign Product = {S3[6], S3[5], S3[4], S3[3], S3[2], S3[1], S3[0], P[0][0]}; // Least significant bit is P[0][0]
endmodule


