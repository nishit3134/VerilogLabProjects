`timescale 1ns / 1ps

module tb_dff;

    reg clk;
    reg D;
    wire Q;

    // Instantiate the DUT (Device Under Test)
    dflipflop uut (
        .D(D),
        .clk(clk),
        .Q(Q)
    );

    // Generate clock: toggle every 5ns (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply test inputs
    initial begin
        // Initialize inputs
        D = 0;

        // Observe output
        $monitor("Time: %0t | clk: %b | D: %b | Q: %b", $time, clk, D, Q);

        // Test cases (change D just before posedge clk)
        #10  D = 1;  // Will be latched at 10ns
        #10 D = 0;  // Will be latched at 20ns
        #10 D = 1;  // Will be latched at 30ns
        #10 D = 0;  // Will be latched at 40ns

        #10 $finish;
    end

endmodule
