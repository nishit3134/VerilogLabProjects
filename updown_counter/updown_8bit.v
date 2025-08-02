`timescale 1ns / 1ps

module up_down_counter (
    input wire clk,           // Clock signal
    input wire rst,           // Synchronous reset
    input wire up_down,       // Direction control: 1 for up, 0 for down
    output reg [7:0] count    // 8-bit counter output
);

always @(posedge clk) begin
    if (rst) begin
        count <= 8'b0;        // Reset count to 0
    end 
    else begin
        if (up_down)
            count <= count + 1; // Count up
        else
            count <= count - 1; // Count down
    end
end

endmodule

