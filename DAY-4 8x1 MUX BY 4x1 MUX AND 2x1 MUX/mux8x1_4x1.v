`timescale 1ns / 1ps

module mux8x1_4x1(
    output y,
    input [7:0]i,
    input [2:0]s
    );
    mux_4x1 m1(y0,i[3:0],s[1:0]);
    mux_4x1 m2(y1,i[7:4],s[1:0]);
    mux_2x1 m3(y,y0,y1,s[2]);
endmodule

module mux_4x1(
    output y0,
    input [3:0]i,
    input [1:0]s
    );
    wire w1,w2,a,b,c,d;
    
    not n1(w1,s[1]);
    not n2(w2,s[0]);
    and a1(a,w1,w2,i[0]);
    and a2(b,w1,s[0],i[1]);
    and a3(c,s[1],w2,i[2]);
    and a4(d,s[1],s[0],i[3]);
    or o1(y0,a,b,c,d);
endmodule

module mux_2x1(
    output y,
    input y0,y1,
    input s
    );
    wire w,a,b;

    not n1(w, s);
    and a1(a,w,y0);
    and a2(b,s,y1);
    or o1(y,a,b);
endmodule
