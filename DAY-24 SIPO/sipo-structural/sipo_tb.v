`timescale 1ns / 1ps

module sipo_tb;
    wire [3:0] q;
    wire [3:0] qbar;
    reg din,clk,rst;
    sipo uut(q,qbar,din,clk,rst);
    initial begin
        din = 0;
        clk = 0;
        rst = 1;
        #50 rst = 0;
        $monitor("q=&b qbar=%b din=%b clk=%b rst=%b",q,qbar,din,clk,rst);
        #1000 $finish;
    end
    always #50 din = ~din;
    always #25 clk = ~clk;
endmodule
