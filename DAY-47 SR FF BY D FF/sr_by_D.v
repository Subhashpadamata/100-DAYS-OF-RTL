`timescale 1ns / 1ps

module sr_by_D(
    output q,qbar,
    input s, r, rst_n, clk
    );
    wire d;
    assign d = (~r & q) | s; 
    d_ff ff1(q, qbar, d, rst_n, clk);
endmodule

module d_ff(
    output reg q,
    output reg qb,
    input d,
    input rst_n,
    input clk
    );

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
        begin
            q <= 0;
            qb <= 1;
        end
        else
        begin
            q <= d;
            qb <= ~d;
        end
        initial q = 0;

endmodule