`timescale 1ns / 1ps

module fa(
output sum,carry,
input a,b,Cout
    );
    assign sum = a ^ b ^ Cout;
    assign carry = (a & b) | (b & Cout) | (Cout & a);
endmodule
