`timescale 1ns / 1ps

module jk_by_T(
    output q, qbar,
    input j, k, rst_n, clk
    );
    wire t;
    assign t = (k & q) | (j & qbar);
    t_ff ff_1(q, qbar, t, rst_n, clk);
endmodule

module t_ff(
    output reg q,
    output reg qb,
    input t,
    input rst_n,
    input clk
    );

    always @(posedge clk or  negedge rst_n)
    begin
        if (!rst_n)
        begin
            q <= 0;
            qb <= 1;
        end
        else
        begin
            q <= ~t;
            qb <= t;
        end
    end
    initial begin
        q = 0;
        q = 1;
    end
endmodule
