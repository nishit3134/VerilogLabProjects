`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2025 06:42:49
// Design Name: 
// Module Name: aesc_desc_tb
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


module aesc_desc_tb();
    reg [3:0] a,b,c,d;
    reg mode;
    wire [3:0] e,f,g,h;
    
    initial
    begin
        mode=0;
        a=4'b1010;
        b=4'b1110;
        c=4'b1001;
        d=4'b1101;
        
        #20;
        mode=0;
        a=4'b1111;
        b=4'b1010;
        c=4'b1011;
        d=4'b1001;
        
        #20;
        
        mode=0;
        a=4'b1111;
        b=4'b1000;
        c=4'b1011;
        d=4'b1010;
        
        #20;
    end
    
    aesc_desc DUT (.a(a),.b(b),.c(c),.d(d),.mode(mode),.e(e),.f(f),.g(g),.h(h));
endmodule
