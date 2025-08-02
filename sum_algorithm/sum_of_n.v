`timescale 1ns / 1ps
// sum_of_n.v - sum of first n natural numbers





module sum_of_n (clk,init,n,s);
input clk,init;
input [3:0] n;
output [6:0] s;


wire [6:0] nexts;
wire grteql;
reg [3:0] nreg;
reg [6:0] sreg;
reg [4:0] cntrreg;

//---------Combinational Part---------
assign nexts = {2'b0 + cntrreg}+sreg;
assign grteql = (nreg>=cntrreg);
assign cnt = grteql;
assign ld = grteql;
assign s = sreg;

//-----------Sequential Part-----------

//Nreg
always@ (posedge clk)
if (init)
nreg<=n;
else
nreg<=nreg;

//counter/cntrreg
always @ (posedge clk)
if (init)
cntrreg<=0;
else if (cnt)
cntrreg<=cntrreg+1;
else
cntrreg<=cntrreg;

//sreg
always @ (posedge clk)
if (init)
sreg<=0;
else if(ld)
sreg<=nexts;
else
sreg<=sreg;

endmodule