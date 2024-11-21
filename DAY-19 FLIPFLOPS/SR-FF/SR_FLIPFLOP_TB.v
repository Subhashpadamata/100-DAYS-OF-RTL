`timescale 1ns / 1ps

module sr_flipflop_tb;
      wire q;
      wire qbar;
      reg s;
      reg r;
      reg clk;
  
sr_flipflop uut(q,qbar,s,r,clk);
  
  initial begin
    s = 0;
    r = 0;
    clk = 1;
    $monitor("q=%b qbar=%b s=%b r=%b clk=%b",q,qbar,s,r,clk);
    #500 $finish;
  end
  
    always #30 clk = ~clk;
    always #50 s = ~s;
    always #100 r = ~r;
 
endmodule

