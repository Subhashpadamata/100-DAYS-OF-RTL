`timescale 1ns / 1ps

module T_by_SR_TB;
    wire q,qbar;
    reg t, clk;
    T_by_SR dut(q, qbar, t, clk);
    initial begin
        $dumpfile("T_by_SR.vcd");
        $dumpvars(0, T_by_SR_TB);
        clk = 0;
        t = 1;
        $monitor("q=%b qbar=%b t=%b clk=%b",q,qbar,t,clk);
        #1000 $finish;
    end
    always #50 clk = ~clk;
    always #100 t =$random;
endmodule
