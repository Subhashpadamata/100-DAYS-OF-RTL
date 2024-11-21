`timescale 1ns / 1ps

module demux_1x8(
    output [7:0]y,
    input i,
    input [2:0]s
    );
    wire w1,w2,w3;
    assign w1 = ~s[0];
    assign w2 = ~s[1];
    assign w3 = ~s[2];
    assign y[0] = i&w3&w2&w1;
    assign y[1] = i&w3&w2&s[0];
    assign y[2] = i&w3&s[1]&w1;
    assign y[3] = i&w3&s[1]&s[0];
    assign y[4] = i&w3&w2&w1;
    assign y[5] = i&w3&w2&s[0];
    assign y[6] = i&w3&s[1]&w1;
    assign y[7] = i&s[2]&s[1]&s[0];
endmodule
