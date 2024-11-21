`timescale 1ns / 1ps

module D_by_jk_tb;
    wire q, qbar;
    reg D, clk;
    D_by_jk dut(q, qbar, D, clk);
    
    always #50 clk = ~clk;
    always #100 D = ~D;
    initial begin
        clk = 0;
        D = 0;
        $monitor("q=%b qbar=%b D=%b clk=%b", q, qbar, D, clk);
        #1000 $finish;
    end
endmodule
