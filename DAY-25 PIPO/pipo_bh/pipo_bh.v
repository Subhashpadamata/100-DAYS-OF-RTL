`timescale 1ns / 1ps

module pipo_bh(
    output reg [3:0] q,
    output reg [3:0] qbar,
    input [3:0] din,
    input clk,rst
    );
    
    always @(posedge clk)
    begin
        if(rst==1) begin
            q=4'b0000;
            qbar=~q; end
        else begin
            q= din;
            qbar = ~q;
        end
    end
    
endmodule