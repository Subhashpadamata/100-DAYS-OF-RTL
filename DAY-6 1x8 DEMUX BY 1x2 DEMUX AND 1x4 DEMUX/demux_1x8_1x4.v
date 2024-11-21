module demux_1x8(
  output [7:0]y,
  input i,
  input [2:0]s
);

  wire [1:0]inter;
  demux_1x2 m1(inter, i,s[2]);
  demux_1x4 m2(y[3:0],inter[0],s[1:0]);
  demux_1x4 m3(y[7:4],inter[1],s[1:0]);
endmodule

module demux_1x4(
  output [3:0]y,
  input inter,
  input [1:0]s
);

  wire p, q;
  not n1(p,s[1]);
  not n2(q,s[0]);
  and a1(y[0],inter,p,q);
  and a2(y[1],inter,p,s[0]);
  and a3(y[2],inter,s[1],q);
  and a4(y[3],inter,s[1],s[0]);
endmodule

module demux_1x2(
  output [1:0]inter,
  input i,
  input s
);

  wire w;
  not n1(w,s);
  and a1(inter[0],i,w);
  and a2(inter[1],i,s);
endmodule