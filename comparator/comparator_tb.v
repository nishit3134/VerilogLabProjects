`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2025 11:22:00
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb;

reg [3:0] a, b;
wire [3:0] max,min;

comparator dut(a,b,max,min);
initial
begin

a=4'd8;
b=4'd12;
#400 a=4'd13;
b=4'd10;

end
    
endmodule
