`timescale 1ns / 1ps
module FA_by_DECODER(
    output sum,carry,
    input A,B,Cin
    );
    
    wire [7:0] y;
    wire w1,w2,w3;
    
    decoder_3_8 d1(y,{A,B,Cin});
    
    assign w1 = y[1] | y[2] | y[4] | y[7];
    assign w2 = y[3] | y[5] | y[6] | y[7];
    
    assign sum = w1;
    assign carry = w2;
endmodule


module decoder_3_8(
    output [7:0] y,
    input [2:0] i
    );

	 wire w1,w2,w3;
        assign w1= ~i[2];
        assign w2= ~i[1];
        assign w3= ~i[0];
        assign y[0]= w1&w2&w3;
        assign y[1]= w1&w2&i[0];
        assign y[2]= w1&i[1]&w3;
        assign y[3]= w1&i[1]&i[0];
        assign y[4]= i[2]&w2&w3;
        assign y[5]= i[2]&w2&i[0];
        assign y[6]= i[2]&i[1]&w3;
        assign y[7]= i[2]&i[1]&i[0];
endmodule
