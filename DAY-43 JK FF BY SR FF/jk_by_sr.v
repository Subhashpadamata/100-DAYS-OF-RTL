`timescale 1ns / 1ps

module sr_flipflop(
    output reg q, qbar,
    input s, r, clk
);
    always @(posedge clk) begin
        if (s == 0 && r == 0) begin
            q <= q;
            qbar <= qbar;
        end
        else if (s == 0 && r == 1) begin
            q <= 1'b0;
            qbar <= 1'b1;
        end
        else if (s == 1 && r == 0) begin
            q <= 1'b1;
            qbar <= 1'b0;
        end
        else if (s == 1 && r == 1) begin
            q <= 1'bx;
            qbar <= 1'bx;
        end
    end
        initial begin
        q = 0;
        qbar = ~q;
    end
endmodule


module jk_by_sr(
    output   q,
    output  qbar,
    input j, k, clk);
    wire s, r;
    not n1(qbar,q);
    assign s = j & ~q;
    assign r = k & q;
    sr_flipflop srff(q, qbar, s, r, clk);
endmodule