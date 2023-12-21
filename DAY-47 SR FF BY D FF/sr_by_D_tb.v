module sr_by_D_tb;
    wire q, qbar;
    reg s, r, rst_n, clk ;
    sr_by_D uut(q, qbar, s, r, rst_n, clk);
    initial begin
        clk = 0;
        rst_n = 0;
        s = 1;
        r = 1;
        $monitor("q=%b qbar=%b s=%b r=%b rst_n=%b clk=%b",q, qbar, s, r, rst_n, clk);
    end
    initial #100 rst_n = 1;
    always #50 clk = ~clk;
    always #100 s = ~s;
    always #200 r = ~r;
endmodule
