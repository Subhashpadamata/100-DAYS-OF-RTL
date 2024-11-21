`timescale 1ns / 1ps

module gray_to_binary_st(
    output [3:0] binary,
    input [3:0] gray);
        buffer b1(gray[3],binary[3]);
        xor x1(gray[2],binary[3],binary[2]);
        xor x2(gray[1],binary[2],binary[1]);
        xor x3(gray[0],binary[1],binary[0]);
endmodule

module buffer (output y,input a);
    assign y = a;
endmodule
