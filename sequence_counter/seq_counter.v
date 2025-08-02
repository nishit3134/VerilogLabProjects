`timescale 1ns / 1ps

//sequence state counter 
// 0->6->1->4->3->0

module seq_counter(clk,rst,countreg);
input clk,rst;
output [2:0] countreg;
reg [2:0] nextstate, statereg;

//combinational logic for determinig next state
always @(*) begin
    case (statereg)
        3'd0: nextstate = 3'd6;
        3'd6: nextstate = 3'd1;
        3'd1: nextstate = 3'd4;
        3'd4: nextstate = 3'd3;
        3'd3: nextstate = 3'd0;
        default: nextstate = 3'd1;
    endcase
end

//sequential logic for state transition
always @(posedge clk or posedge rst)
    begin
        if (rst)
            statereg <= 3'd0;
        else
            statereg <= nextstate;
end

//assign output from statereg to module o/p
assign countreg = statereg;
endmodule
