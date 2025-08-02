`timescale 1ns / 1ps



module tb_reg_16bit();
    wire [15:0] A;
    reg clk, clr, load, incr;
    reg [15:0] load_input;
    
    reg_16bit DUT (
        .A(A),
        .clk(clk),
        .clr(clr),
        .load(load),
        .incr(incr),
        .load_input(load_input)
    );
    
    //clock genration
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    
    initial begin
        clr = 0;
        load = 0;
        incr = 0;
        load_input = 16'h0000;
        
        // Apply reset
        #10 clr = 1;
        #10 clr = 0;

        // Load value
        #10 load_input = 16'h00AA;
        load = 1;
        #10 load = 0;

        // Increment value
        #10 incr = 1;
        #10 incr = 0;

        // Try all controls off (should hold value)
        #10;

        // Apply clear again
        #10 clr = 1;
        #10 clr = 0;

        // Finish simulation
        #20 $finish;
    end
endmodule
