module t_ff_tb;
    wire q;
    wire qb;
    reg t;
    reg rst_n;
    reg clk;
    t_ff uut(.q(q), 
             .qb(qb),
             .t(t), 
             .rst_n(rst_n),
             .clk(clk));
    initial
    begin
        t = 0;
        rst_n = 0;
        clk = 0;
 
        #2000 $finish;
    end
    always #500 rst_n = ~rst_n;
    always #70 t=~t;
    always #30 clk = ~clk;
endmodule