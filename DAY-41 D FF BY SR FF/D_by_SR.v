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
endmodule

module D_by_SR(
    output Qn,Qn_bar,
    input D,clk
);
    sr_flipflop sr_inst(Qn, Qn_bar, D, ~D, clk); 
endmodule

