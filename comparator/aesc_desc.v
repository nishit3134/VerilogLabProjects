`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module aesc_desc(
    input  [3:0] a, b, c, d,
    input        mode,
    output [3:0] e, f, g, h
);

    wire [3:0] s1a, s1b, s2a, s2b, s3a, s3b, s4a, s4b, s5a, s5b;

    // Stage 1: Compare pairs
    comparator c1 (.a(a), .b(b), .min(s1a), .max(s1b)); // s1a = min(a,b), s1b = max(a,b)
    comparator c2 (.a(c), .b(d), .min(s2a), .max(s2b)); // s2a = min(c,d), s2b = max(c,d)

    // Stage 2: Compare mins and maxes from previous stage
    comparator c3 (.a(s1a), .b(s2a), .min(s3a), .max(s3b)); // s3a = smallest, s3b = 2nd smallest
    comparator c4 (.a(s1b), .b(s2b), .min(s4a), .max(s4b)); // s4a = 2nd largest, s4b = largest

    // Stage 3: Compare the remaining two middle values
    comparator c5 (.a(s3b), .b(s4a), .min(s5a), .max(s5b)); // s5a = 2nd, s5b = 3rd

    // Final output assignment
    assign {e, f, g, h} = (mode == 0) ? {s3a, s5a, s5b, s4b} : {s4b, s5b, s5a, s3a};

endmodule

