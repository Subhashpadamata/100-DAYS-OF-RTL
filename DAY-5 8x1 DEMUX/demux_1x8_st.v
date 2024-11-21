`timescale 1ns / 1ps

module demux_1x8_st(
    output [7:0] y,
    input [2:0] s,
    input in
    );
	 wire w1,w2,w3;
	 
        not n1(s[2],w1);
        not n2(s[1],w2);
        not n3(s[0],w3);
        and a1(y[0],i,w1,w2,w3);
        and a2(y[1],i,w1,w2,s[0]);
        and a3(y[2],i,w1,s[1],w3);
        and a4(y[3],i,w1,s[1],s[0]);
        and a5(y[4],i,s[2],w2,w3);
        and a6(y[5],i,s[2],w2,s[0]);
        and a7(y[6],i,s[2],s[1],w3);
        and a8(y[7],i,s[2],s[1],s[0]);

endmodule
