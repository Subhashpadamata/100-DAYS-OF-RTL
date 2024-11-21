`timescale 1ns / 1ps

module siso(
	 output q,qbar,
    input din,clk,rst
    );
	 
	 wire q1,q2,q3,qbar1,qbar2,qbar3;
	 
    d_ff d1(q1,qbar1,din,clk,rst),
         d2(q2,qbar2,q1,clk,rst),
         d3(q3,qbar3,q2,clk,rst),
         d4(q,qbar,q3,clk,rst);

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