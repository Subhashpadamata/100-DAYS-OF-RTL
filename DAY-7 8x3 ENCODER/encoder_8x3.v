`timescale 1ns / 1ps

module encoder_8x3(
    output [2:0]y,
    input [7:0]i
    );
    assign y[2]= i[4] | i[5] | i[6] | i[7];
    assign y[1]= i[2] | i[3] | i[6] | i[7];
    assign y[0]= i[1] | i[3] | i[5] | i[7];
    
endmodule
