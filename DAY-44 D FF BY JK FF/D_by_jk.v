`timescale 1ns / 1ps

module jk_ff(
    output reg q,
    output reg qb,
    input j,
    input k,
    input clk
);
    always @(posedge clk) begin
        if (j == 0 && k == 0) begin
            q <= q;
            qb <= ~qb;
        end
        else if (j == 0 && k == 1) begin
            q <= 0;
            qb <= 1;
        end
        else if (j == 1 && k == 0) begin
            q <= 1;
            qb <= 0;
        end
        else if (j == 1 && k == 1) begin
            q <= ~q;
            qb <= qb;
        end
    end
endmodule

module D_by_jk(
    output q,
    output qbar,
    input D,
    input clk
);
    jk_ff jk_ff_1(q, qbar, D, ~D, clk);
endmodule
