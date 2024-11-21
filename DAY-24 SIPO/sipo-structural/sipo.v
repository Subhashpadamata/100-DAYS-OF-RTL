`timescale 1ns / 1ps

module sipo(
    output [3:0] q,
    output [3:0] qbar,
    input din,clk,rst
    );
    d_ff ff1(q[0],qbar[0],din,clk,rst);
    d_ff ff2(q[1],qbar[1],q[0],clk,rst);
    d_ff ff3(q[2],qbar[2],q[1],clk,rst);
    d_ff ff4(q[3],qbar[3],q[2],clk,rst);
    
endmodule

module d_ff(
    output reg q,qb,
    input d,clk,rst
    );

    always @(posedge clk )
        if (rst)
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