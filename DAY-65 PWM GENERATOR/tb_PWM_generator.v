`timescale 1ns / 1ps

module tb_PWM_generator;

 reg clk;
 reg increase_duty;
 reg decrease_duty;
 wire out;

 PWM_generator dut (clk,increase_duty,decrease_duty,out);
 
 always #5 clk = ~clk;
  
 initial begin
  clk = 0;
  increase_duty = 0;
  decrease_duty = 0;
  #100 increase_duty = 1; 
  #100 increase_duty = 0;
  #100 increase_duty = 1;
  #100 increase_duty = 0;
  #100 increase_duty = 1;
  #100 increase_duty = 0;
  #100 decrease_duty = 1; 
  #100 decrease_duty = 0;
  #100 decrease_duty = 1;
  #100 decrease_duty = 0;
  #100 decrease_duty = 1;
  #100 decrease_duty = 0;
 end
endmodule