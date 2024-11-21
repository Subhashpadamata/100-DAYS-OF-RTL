`timescale 1ns / 1ps

module bidirectional_reg_tb;
    wire  [3:0] q;
    wire  [3:0] qbar;
    reg dr, dl;
    reg clk, rst, mode;
bidirectional_shift_reg dut(q,qbar,dr,dl,clk,rst,mode);
    
    always #25 clk = ~clk;
    always #500 mode = ~mode;
    
    initial begin
    rst = 1 ;
    clk = 0;
    mode = 0;
    #50 rst = 0;
    $monitor("q=%b qbar=%b dr=%b dl=%b clk=%b rst=%b mode=%b",q,qbar,dr,dl,clk,rst,mode);
    #1000 $finish;
    end
    always #50 dr =$random;
    always #50 dl =$random;
    
endmodule
