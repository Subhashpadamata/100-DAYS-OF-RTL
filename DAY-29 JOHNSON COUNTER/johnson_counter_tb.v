`timescale 1ns / 1ps

module johnson_counter_tb;
    wire [3:0] q;
    reg clk,rst;
johnson_counter dut(q,clk,rst);
    
    initial begin
        clk=0;
        rst = 1;
        #50 rst = 0;
        $monitor("q=%b clk=%b rst=%b",q,clk,rst);
        #1000 $finish;
    end
    always #25 clk=~clk;
    
    
endmodule
