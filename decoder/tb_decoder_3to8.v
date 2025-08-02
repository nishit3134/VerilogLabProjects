`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////



module tb_decoder_3to8();
    reg [2:0] A;
    reg En;
    wire [7:0] Y;

    // Instantiate the decoder module
    decoder_3to8 uut (
        .A(A),
        .En(En),
        .Y(Y)
    );
    initial
    begin
        // Test with En = 0 (should output 00000000 for all A)
        En = 0;
        A = 3'b000; #10;
        A = 3'b101; #10;
        
        // Test with En = 1 (should output one-hot pattern)
        En = 1;
        A = 3'b000; #10;
        A = 3'b001; #10;
        A = 3'b010; #10;
        A = 3'b011; #10;
        A = 3'b100; #10;
        A = 3'b101; #10;
        A = 3'b110; #10;
        A = 3'b111; #10;
        
        $finish;
    end
endmodule
