`timescale 1ns / 1ps

module ring_oscillator(
    input en,
    output w1,w2,w3);
    wire w4;
    and #1(w4, en, w3) ;
    not #1(w2, w1) ;
    not #1(w3, w2) ;
    not #1(w1, w4) ; 

endmodule
