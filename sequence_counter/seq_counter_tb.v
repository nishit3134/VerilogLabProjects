`timescale 1ns / 1ps
//testbench for seq_counter
//


module seq_counter_tb();
    reg clk, rst;
    wire [2:0] countreg;
    
    // Instantiate the design under test (DUT)
    seq_counter DUT (.clk(clk), .rst(rst), .countreg(countreg));
    
    always #10 clk= ~clk;  //clock genration
    
    initial begin
        clk=0;
        rst=1;
        
        #20;
        rst=0;
        
        #200;
        $finish; // end simulation
    end 
    
     // Monitor output
    initial begin
        $monitor("Time = %0t ns | Reset = %b | State = %0d", $time, rst, countreg);
    end 
    
endmodule
