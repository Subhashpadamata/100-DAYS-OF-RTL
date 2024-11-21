`timescale 1ns / 1ps

module sr_by_T_tb;
    wire q, qbar;
    reg s, r, rst_n, clk;
    sr_by_T uut(q, qbar, s, r, rst_n, clk);
    initial
    begin
        s = 0;
        r = 0;
        rst_n = 0;
        clk = 0;
        #100 rst_n = 1;
        $monitor("q=%b qbar=%b s=%b r=%b rst_n=%b clk=%b",q, qbar, s, r, rst_n, clk);
        #1000 $finish;
    end
    always #100 s = ~s;
    always #200 r = ~r;
    always #50 clk = ~clk;
endmodule
