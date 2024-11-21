`timescale 1ns / 1ps
module bidirectional_shift_reg(
    output  [3:0] q,
    output  [3:0] qbar,
    input dr, dl,
    input clk, rst, mode
);

    wire not_mode;
    wire [7:0] aw;
    wire [3:0] wo;

    not(not_mode, mode);
    and(aw[0], q[1], mode);
    and(aw[1], not_mode, dl);
    or(wo[0], aw[0], aw[1]);

    d_ff ff1(q[0], qbar[0], wo[0], clk, rst);

    and(aw[2], q[2], mode);
    and(aw[3], not_mode, q[0]);
    or(wo[1], aw[2], aw[3]);

    d_ff ff2(q[1], qbar[1], wo[1], clk, rst);

    and(aw[4], q[3], mode);
    and(aw[5], not_mode, q[1]);
    or(wo[2], aw[4], aw[5]);

    d_ff ff3(q[2], qbar[2], wo[2], clk, rst);

    and(aw[6], dr, mode);
    and(aw[7], not_mode, q[2]);
    or(wo[3], aw[6], aw[7]);

    d_ff ff4(q[3], qbar[3], wo[3], clk, rst);

endmodule

module d_ff(
    output reg q, qb,
    input d, clk, rst
);

always @(posedge clk)
begin
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
end

endmodule
