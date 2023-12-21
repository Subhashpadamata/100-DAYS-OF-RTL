`timescale 1ns / 1ps

module sr_by_jk_tb;
    wire q, qbar;
    reg s, r, clk;
    sr_by_jk dut(q, qbar, s, r, clk);
    
    always #10 clk = ~clk;
    always #200 r = ~r;
    always #400 s = ~s;
    initial begin
        clk = 0;
        s = 0;
        r = 0;
        $monitor("q=%b qbar=%b s=%b r=%b clk=%b", q, qbar, s, r, clk);
        #1000 $finish;
    end
endmodule
