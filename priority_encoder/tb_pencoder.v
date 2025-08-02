`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 07:41:09
// Design Name: 
// Module Name: tb_pencoder
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


module tb_pencoder();
    reg [7:0] D;
    wire [2:0] Y;
    
    pdecoder_8to3 DUT (.D(D),.Y(Y));
    
    initial
    begin
        D = 8'b00000001; #10; // Expect Y = 0
        D = 8'b00000010; #10; // Expect Y = 1
        D = 8'b00000100; #10; // Expect Y = 2
        D = 8'b00001000; #10; // Expect Y = 3
        D = 8'b00010000; #10; // Expect Y = 4
        D = 8'b00100000; #10; // Expect Y = 5
        D = 8'b01000000; #10; // Expect Y = 6
        D = 8'b10000000; #10; // Expect Y = 7
        
        $finish;
    end
   
    
    
endmodule
