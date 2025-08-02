`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 09:06:44
// Design Name: 
// Module Name: tb_updown
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


module tb_updown();

    // Declare signals
    reg clk;
    reg rst;
    reg up_down;
    wire [7:0] count;

    // Instantiate the counter
    up_down_counter uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        
        rst = 1;
        up_down = 1;
        #10 rst = 0;         // Release reset

        // Count up for a while
        #100 up_down = 0;    // Then count down

        #100 $finish;        // End simulation
    end

endmodule

