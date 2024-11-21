`timescale 1ns / 1ps

module jk_by_T_tb;
    wire q, qbar;
    reg j, k, rst_n, clk;
    jk_by_T uut(q, qbar, j, k, rst_n, clk);
    initial
    begin
        j = 0;
        k = 0;
        rst_n = 0;
        clk = 0;
        #100 rst_n = 1;
        $monitor("q=%b qbar=%b j=%b k=%b rst_n=%b clk=%b",q, qbar, j, k, rst_n, clk);
        #1000 $finish;
    end
    always #100 j = ~j;
    always #200 k = ~k;
    always #50 clk = ~clk;
endmodule
