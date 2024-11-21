module jk_by_D_tb;
    wire q, qbar;
    reg j, k, rst_n, clk ;
    jk_by_D uut(q, qbar, j, k, rst_n, clk);
    initial begin
        clk = 0;
        rst_n = 0;
        j = 1;
        k = 1;
        $monitor("q=%b qbar=%b j=%b k=%b rst_n=%b clk=%b",q, qbar, j, k, rst_n, clk);
        #1000 $finish;
    end
    initial #100 rst_n = 1;
    always #50 clk = ~clk;
    always #100 j = ~j;
    always #200 k = ~k;
endmodule