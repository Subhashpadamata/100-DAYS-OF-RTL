`timescale 1ns / 1ps

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
endmodule