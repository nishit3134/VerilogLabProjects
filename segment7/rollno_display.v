`timescale 1ns / 1ps

module rollno_display(
    input clk,
    output reg [6:0] roll,   // Changed from 'wire' to 'reg'
    output [7:0] AN
);

    assign AN = 8'hfe; // Only first digit enabled (AN[0] active low)

    wire clock;
    reg [3:0] curr, next;

    // Clock divider to 1Hz
    clk_1khz hz(clk, clock);

    wire [6:0] seg_out;
    bcd_7seg dut(curr, seg_out);

    always @(posedge clock)
        curr <= next;

    always @(curr) begin
        case (curr)
            4'd5: next <= 4'd9;
            4'd9: next <= 4'd5;
            default: next <= 4'd5;
        endcase
    end

    always @(*) begin
        roll = seg_out; // Connect decoded segment output to roll
    end

endmodule
