`timescale 1ns / 1ps

module encoder_8x3_st(
    output [2:0] y,
    input [7:0] i
    );
or  o1(y[2],i[4],i[5],i[6],i[7]),
    o2(y[1],i[2],i[3],i[6],i[7]),
    o3(y[0],i[1],i[3],i[5],i[7]);
endmodule


