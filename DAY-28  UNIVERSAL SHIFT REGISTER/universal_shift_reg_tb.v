`timescale 1ns / 1ps

module universal_shift_reg_tb;
    wire [3:0] p_dout;
    wire [3:0] p_dout_bar;
    reg  [3:0] p_din ;
    reg  rst_n, clk, s_right, s_left;
    reg [1:0]s;
    
    universal_shift_reg dut(p_dout,p_dout_bar,p_din,rst_n,clk,s_right,s_left,s);
    
    initial begin
        rst_n =0;
        clk=0;
        s_left =0;
        s=2'b00;
        s_left=0;
        s_right=1;
        $monitor("p_dout=%b p_dout_bar=%b p_din=%b rst_n=%b clk=%b s_right=%b s_left=%b",p_dout,p_dout_bar,p_din,rst_n,clk,s_right,s_left);
        #1000 $finish;
    end
    initial #50 rst_n = 1;
    always #20 clk =~clk;
    always #50 p_din=$random;
    always #500 s_right = ~s_right;
    always #500 s_left = ~s_left;
    always #100 s[0]=~s[0];
    always #200 s[1]=~s[1];

    
endmodule
