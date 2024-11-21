module D_by_T_tb;
    reg  clk, rstn, d; 
    wire q,qbar;
    D_by_T uut(clk, rstn, d, q, qbar);
    initial
    begin
        d = 0;
        rstn = 0;
        clk = 0;
        #100 rstn = 1;
        $monitor("q=%b qbar=%b d=%b rstn=%b clk=%b",q, qbar, d, rstn, clk);
        #1000 $finish;
    end
    always #100 d = ~d;
    always #50 clk = ~clk;
endmodule