`timescale 1ns / 1ps

module carry_save_adder(
    input [3:0]a,
    input [3:0]b,
    input cin,
    input [3:0] x,
    output [3:0]cout,
    output [4:0]sum
    );
    wire [3:1] s;
    wire [3:0] c;
    fa adder_1(a[0],b[0],cin,sum[0],c[0]);
    fa adder_2(a[1],b[1],cin,s[1],c[1]);
    fa adder_3(a[2],b[2],cin,s[2],c[2]);
    fa adder_4(a[3],b[3],cin,s[3],c[3]);
    fa adder_5(c[0],s[1],cin,sum[1],cout[0]);
    fa adder_6(c[1],s[2],cout[0],sum[2],cout[1]);
    fa adder_7(c[2],s[3],cout[1],sum[3],cout[2]);
    fa adder_8(c[3],x,cout[2],sum[4],cout[3]);
    
endmodule


module fa(
    input a, b, c,
    output sum, carry
);
    wire x1, x2, x3, x4, x5;
        
    and_gate a1(a,b,x1);
    and_gate a2(b,c,x2);
    and_gate a3(a,c,x3);
    or_gate o1(x1,x2,x4);
    or_gate o2(x4,x3,carry);
    xor_gate xor1(a,b,x5);
    xor_gate xor2(x5,c,sum);
endmodule

module and_gate(
    input a, b,
    output c
);
    and(c,a,b);
endmodule

module or_gate(
    input a, b,
    output c
);
  or(c,a,b);
endmodule

module xor_gate(
    input a, b,
    output c
);
    xor(c,a,b);
endmodule

