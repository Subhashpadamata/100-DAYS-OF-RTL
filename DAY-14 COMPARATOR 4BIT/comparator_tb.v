`timescale 1ns / 1ps

module comparator_tb;
  wire  EQ;
  wire  GT;
  wire  LT;
  reg [3:0] a;
  reg [3:0] b;
  comparator_4bit c1(EQ,GT,LT,a,b);
initial begin
    //for greater than
    a = 5;
    b = 3;
    #10;
    $display("a = %d, b = %d, EQ = %b, GT = %b, LT = %b", a, b, EQ, GT, LT);
    //for less than
    a = 3;
    b = 5;
    #10;
    $display("a = %d, b = %d, EQ = %b, GT = %b, LT = %b", a, b, EQ, GT, LT);
    //for equal to
    a = 4;
    b = 4;
    #10;
    $display("a = %d, b = %d, EQ = %b, GT = %b, LT = %b", a, b, EQ, GT, LT);

    $finish;
  end
endmodule
