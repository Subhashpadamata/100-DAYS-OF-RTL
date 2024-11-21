`timescale 1ns / 1ps

module universal_shift_reg(
    output [3:0] p_dout,
    output [3:0] p_dout_bar,
    input  [3:0] p_din ,
    input  rst_n, clk, s_right, s_left,
    input [1:0]s
    
    );
    wire [3:0]d;
    wire [3:0]q;
    wire [3:0]qbar;
   mux_4x1 mux1(d[0],p_din[0],s_left,q[1],q[0],s[1],s[0]);
    mux_4x1 mux2(d[1],p_din[1],q[0],q[2],q[1],s[1],s[0]);
    mux_4x1 mux3(d[2],p_din[2],q[1],q[3],q[2],s[1],s[0]);
    mux_4x1 mux4(d[3],p_din[3],q[2],s_right,q[3],s[1],s[0]);
    
    d_ff ff1(q[0],qbar[0],d[0],rst_n,clk);
    d_ff ff2(q[1],qbar[1],d[1],rst_n,clk);
    d_ff ff3(q[2],qbar[2],d[2],rst_n,clk);
    d_ff ff4(q[3],qbar[3],d[3],rst_n,clk);
    
    assign p_dout_bar = {qbar[3:0]};
    assign p_dout = {q[3:0]};
    
endmodule


module mux_4x1(
    output y0,
    input i0,i1,i2,i3,
    input s1,s0
    );
    wire w1,w2,a,b,c,d;
    
    not n1(w1,s1);
    not n2(w2,s0);
    and a1(a,w1,w2,i0);
    and a2(b,w1,s0,i1);
    and a3(c,s1,w2,i2);
    and a4(d,s1,s0,i3);
    or o1(y0,a,b,c,d);
endmodule

module d_ff(
    output reg q,qbar,
    input d,rst_n,clk
    );
always@(posedge clk or negedge rst_n)
begin
if(!rst_n) begin
q=1'b0; qbar=1'b1; end
else begin
if(d==0) begin
q=1'b0; qbar=1'b1; end
else if(d==1) begin
q=1'b1; qbar=1'b0; end
end

end

endmodule
