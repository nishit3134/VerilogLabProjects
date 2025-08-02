`timescale 1ns / 1ps
// *top_module.v* - Integrating everything for the 7-segment display

module top_module (
    input clk,                  // Input clock
    input init,                 // Initialize input
    input [3:0] n,              // Input n (number of natural numbers)
    output reg [6:0] seg,       // 7-segment display output (for current digit)
    output reg [2:0] an,
    output [3:0] n_led         // 3-bit anode control for multiplexing
);
assign n_led=n;
// Internal signals
wire [6:0] s;
wire clk_out;
wire [3:0] ones, tens, hundreds;
wire [6:0] seg0, seg1, seg2;

// Instantiate the sum_of_n module
sum_of_n (
    .clk(clk),
    .init(init),
    .n(n),
    .s(s)
);

// Instantiate the clock divider (optional)
clock_divider u_clock_divider (
    .clk_in(clk),
    .clk_out(clk_out)
);

// Decode the sum into individual digits
assign ones     = s % 10;
assign tens     = (s / 10) % 10;
assign hundreds = (s / 100) % 10;

// Instantiate the seg7_decoder for each digit
seg7_decoder u_seg7_ones (
    .digit(ones),
    .seg(seg0)
);
seg7_decoder u_seg7_tens (
    .digit(tens),
    .seg(seg1)
);
seg7_decoder u_seg7_hundreds (
    .digit(hundreds),
    .seg(seg2)
);

// Display multiplexing
reg [1:0] display_ctrl = 0;

always @(posedge clk_out) begin
    display_ctrl <= display_ctrl + 1;
end

always @(*) begin
    // Default values
    seg = 7'b0000000;
    an = 3'b111;

    case(display_ctrl)
        2'b00: begin
            an = 3'b110; // enable an[0]
            seg = seg0;
        end
        2'b01: begin
            an = 3'b101; // enable an[1]
            seg = seg1;
        end
        2'b10: begin
            an = 3'b011; // enable an[2]
            seg = seg2;
        end
        default: begin
            an = 3'b111;
            seg = 7'b0000000;
        end
    endcase
end

endmodule
