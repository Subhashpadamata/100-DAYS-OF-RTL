`timescale 1ns / 1ps

module mux_8x1(
    output y,
    input [7:0]i,
    input [2:0]s
    );
    	wire w1,w2,w3;
    assign w1=~s[2];
    assign w2=~s[1];
    assign w3=~s[0];
    assign y=(w1&w2&w3&i[0]) | (w1&w2&s[0]&i[1]) | (w1&s[1]&w3&i[2]) | (w1&s[1]&s[0]&i[3])|(s[2]&w2&w3&i[4]) | (s[2]&w2&s[0]&i[5]) | (s[2]&s[1]&w3&i[6]) | (s[2]&s[1]&s[0]&i[7]);
endmodule
