`timescale 1ns / 1ps

module binary_to_gray_st(
    output [3:0] gray,
     input [3:0] binary
    );
    buffer b1(gray[3],binary[3]);
        xor x1(gray[2],binary[3],binary[2]),
            x2(gray[1],binary[2],binary[1]),
            x3(gray[0],binary[1],binary[0]);
endmodule
module buffer (output z,input a);
assign z=a;
endmodule
 

