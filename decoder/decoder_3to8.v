`timescale 1ns / 1ps

module decoder_3to8 (A, En, Y);
    input [2:0] A;
    input En;
    output [7:0] Y;

    assign Y = En ? (1 << A) : 8'b0;
endmodule
