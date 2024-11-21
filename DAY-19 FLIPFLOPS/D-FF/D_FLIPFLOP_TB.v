module d_ff_tb;
    wire q;
    wire qb;
    reg d;
    reg rst_n;
    reg clk;
    d_ff uut(q, qb, d, rst_n, clk);
    initial
    begin
        d = 0;
        rst_n = 0;
        clk = 0;
        #20 rst_n = 1; 
        forever #5 clk = ~clk;
        #100 $finish;
    end
    always #50 d=~d;
endmodule
