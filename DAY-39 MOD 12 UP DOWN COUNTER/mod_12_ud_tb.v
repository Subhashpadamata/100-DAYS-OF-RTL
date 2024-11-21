`timescale 1ns / 1ps

module mod_12_ud_tb;

  wire [3:0] q;
  reg mod;
  reg clk;
  reg rst;

  mod_12_ud_counter dut(q, mod, clk, rst);

  initial begin
    clk = 0;
    rst = 1;
    mod = 0;
    #20 rst = 0;
    #800 $finish;
  end

  always #300 mod = ~mod;
  always #10 clk = ~clk;

endmodule
