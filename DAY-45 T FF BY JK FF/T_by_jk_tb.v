module T_by_jk_tb;
    wire q, qbar;
    reg T, clk;
    T_by_jk dut(q, qbar, T, clk);
    
    always #50 clk = ~clk;
    always #100 T = ~T;
    initial begin
        clk = 0;
        T = 0;
        $monitor("q=%b qbar=%b T=%b clk=%b", q, qbar, T, clk);
        #1000 $finish;
    end
endmodule
