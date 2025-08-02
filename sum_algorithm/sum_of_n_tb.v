`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2025 17:31:16
// Design Name: 
// Module Name: sum_of_n_tb
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


module sum_of_n_tb();

reg clk,init;
reg [3:0] n;
wire [6:0] s;

sum_of_natural u1(.clk(clk),.init(init),.n(n),.s(s));

initial
begin
clk=1'b0;
init=1'b0;
n=4'b1001;
#30
init=1'b1;
#30
init=1'b0;

end

always
#10 clk=~clk;
endmodule

