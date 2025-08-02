`timescale 1ns / 1ps
// seg7_decoder.v - 7-segment display decoder

module seg7_decoder (
    input [3:0] digit,   // 4-bit input digit (0-9)
    output reg [6:0] seg // 7-segment display output (a-g)
);

    always @ (digit) begin
        case(digit)
            4'd0: seg = 7'b1111110; // 0
            4'd1: seg = 7'b0110000; // 1
            4'd2: seg = 7'b1101101; // 2
            4'd3: seg = 7'b1111001; // 3
            4'd4: seg = 7'b0110011; // 4
            4'd5: seg = 7'b1011011; // 5
            4'd6: seg = 7'b1011111; // 6
            4'd7: seg = 7'b1110000; // 7
            4'd8: seg = 7'b1111111; // 8
            4'd9: seg = 7'b1111011; // 9
            default: seg = 7'b0000000; // default (off)
        endcase
    end

endmodule