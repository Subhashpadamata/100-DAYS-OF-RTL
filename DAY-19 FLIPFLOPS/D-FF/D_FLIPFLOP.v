`timescale 1ns / 1ps

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

endmodule