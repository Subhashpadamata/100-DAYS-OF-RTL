`timescale 1ns / 1ps

module counter_tb;
    reg clk;
    reg w;
    reg reset;
    wire [3:0]out;
    
    counter_w dut(clk,w,reset,out);
    
    initial begin
        clk = 0;
        w = 0; 
        reset = 1;
        #10 reset = 0;
        #500 $finish;   
    end
    
    always #5 clk = ~clk; 
    always #50 w = ~w;
    
endmodule
