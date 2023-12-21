`timescale 1ns / 1ps

module jk_ff(
    output reg q,
    output reg qb,
    input j,
    input k,
    input clk
);
    initial begin
        q = 0;
        qb = 1;
    end
    
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

module sr_by_jk(
    output q,
    output qb,
    input s,
    input r,
    input clk
);
    wire j, k;
    
    assign j = s & ~q;
    assign k = r & q;
    
    jk_ff jk_ff_1(q, qb, j, k, clk);
endmodule

