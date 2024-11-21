`timescale 1ns / 1ps

module ripple_carry_adder(
    output [3:0] sum,
    output cout,
    input [3:0] a,
    input [3:0] b,
    input cin
);
    wire [2:0] c;
    fa adder1(sum[0], c[0], a[0], b[0], cin);
    fa adder2(sum[1], c[1], a[1], b[1], c[0]);
    fa adder3(sum[2], c[2], a[2], b[2], c[1]);
    fa adder4(sum[3], cout, a[3], b[3], c[2]);
endmodule

module fa(
    output sum, carry,
    input a, b, Cout
);
    assign sum = a ^ b ^ Cout;
    assign carry = (a & b) | (b & Cout) | (Cout & a);
endmodule