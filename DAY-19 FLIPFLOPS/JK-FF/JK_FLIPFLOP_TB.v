`timescale 1ns / 1ps
module jk_ff_tb;
              wire q;
              wire qb;
              reg j;
              reg k;
              reg clk;
  
  jk_ff uut (q,qb,j,k,clk);
  
  initial begin
    j = 0;
    k = 0;
    clk = 0;
    #1000 $finish;
  end
  
    always #30 clk = ~clk;
    always #50 k = ~k;
    always #100 j = ~j;
  
endmodule
