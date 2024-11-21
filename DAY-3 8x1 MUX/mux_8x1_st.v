`timescale 1ns / 1ps

module mux_8x1_st(
    input [7:0]i , [2:0] s,
    output y
    );
wire w1,w2,w3,a,b,c,d,e,f,g,h;

not n1(w1,s[2]),
    n2(w2,s[1]),
    n3(w3,s[0]);
and a1(a,w1,w2,w3,i[0]),
    a2(b,w1,w2,s[0],i[1]),
    a3(c,w1,s[1],w3,i[2]),
    a4(d,w1,s[1],s[0],i[3]),
    a5(e,s[2],w2,w3,i[4]),
    a6(f,s[2],w2,s[0],i[5]),
    a7(g,s[2],s[1],w3,i[6]),
    a8(h,s[2],s[1],s[0],i[7]);
    
or o1(y,a,b,c,d,e,f,g,h);
endmodule
