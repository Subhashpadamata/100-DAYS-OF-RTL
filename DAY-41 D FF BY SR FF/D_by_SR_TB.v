`timescale 1ns / 1ps

module D_by_SR_TB;
    wire Qn, Qn_bar;
    reg D, clk;
    D_by_SR uut(Qn, Qn_bar, D, clk);

    initial begin
        clk = 0;
        $monitor("Qn=%b Qn_bar=%b D=%b clk=%b", Qn, Qn_bar, D, clk);
        #1000 $finish;
    end

    always #100 clk = ~clk;
    always #50 D = $random;
endmodule