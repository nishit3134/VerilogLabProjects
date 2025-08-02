module clk_1khz(
    input clk,
    output reg clk_out
);
    reg [15:0] count = 0;

    always @(posedge clk) begin
        if (count == 49999) begin
            count <= 0;
            clk_out <= ~clk_out;
        end else begin
            count <= count + 1;
        end
    end
endmodule
