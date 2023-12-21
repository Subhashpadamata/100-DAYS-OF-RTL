`timescale 1ns / 1ps

module T_by_D_tb;
    wire q, qbar;
    reg T, rst_n, clk ;
    T_by_D uut(q, qbar, T, rst_n, clk);
    initial begin
        clk = 0;
        rst_n = 0;
        T = 0;
        $monitor("q=%b qbar=%b T%b rst_n=%b clk=%b",q, qbar, T, rst_n, clk);
        #1000 $finish;
    end
    initial #200 rst_n = 1;
    always #100 clk = ~clk;
    always #200 T = ~T;
endmodule