`timescale 1ns / 1ps

module siso_bh(
    output reg q,qbar,
    input din,clk,rst
    );
    reg q1,q2,q3;
    
    always@(posedge clk)
        begin
        assign qbar = ~q;
        if(rst) begin
            q <= 1'b0;
         end
        
        else begin
            q1 <= din;
            q2 <= q1;
            q3 <= q2;
            q  <= q3;
        end
    end
endmodule
