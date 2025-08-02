`timescale 1ns / 1ps
// clock_divider.v - Clock divider to slow down the clock

module clock_divider (
    input clk_in,         // Input clock (e.g., 100 MHz)
    output reg clk_out    // Slower clock for multiplexing (e.g., 1 Hz)
);

    reg [24:0] counter;   // Adjust size based on required clock frequency

    always @ (posedge clk_in) begin
        if (counter == 25000000) begin // Example: 100 MHz / 25,000,000 = 1 Hz
            clk_out <= ~clk_out;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule