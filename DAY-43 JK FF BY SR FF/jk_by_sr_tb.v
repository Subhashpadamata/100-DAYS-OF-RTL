`timescale 1ns / 1ps

module jk_by_sr_tb;
    wire q,qbar;
    reg j, k, clk;
    jk_by_sr dut(q, qbar, j, k, clk);
    initial begin
        clk = 0;
        j=0;
        k=0;
        $monitor("q=%b qbar=%b j=%b k=%b clk=%b",q,qbar,j,k,clk);
        #1000 $finish;
    end
    always #50 clk = ~clk;
    always #100 k = ~k;
    always #200 j = ~j;
endmodule