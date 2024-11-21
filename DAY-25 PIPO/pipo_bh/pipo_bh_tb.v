`timescale 1ns / 1ps

module pipo_bh_tb;
    wire [3:0] q;
    wire [3:0] qbar;
    reg [3:0]din;
    reg clk,rst;
    pipo_bh dut(q,qbar,din,clk,rst);
    
    initial begin
        rst = 1;
        clk = 0;
        #50 rst = 0;
        $monitor("q=%b qbar=%b din=%b clk=%b rst=%b",q,qbar,din,clk,rst);
        #1000 $finish;
    end
    always #25 clk =~clk;
    always #50 din = $random;
endmodule
