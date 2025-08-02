`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module pencoder_8to3(D,Y);

    input [7:0] D;
    output reg [2:0] Y;
    
    
    always @(*) begin
    casex(D)
        8'b1xxxxxxx: Y = 3'd7;
        8'b01xxxxxx: Y = 3'd6;
        8'b001xxxxx: Y = 3'd5;
        8'b0001xxxx: Y = 3'd4;
        8'b00001xxx: Y = 3'd3;
        8'b000001xx: Y = 3'd2;
        8'b0000001x: Y = 3'd1;
        8'b00000001: Y = 3'd0;
        default:      
            Y = 3'bxxx; 
    endcase
end
endmodule
