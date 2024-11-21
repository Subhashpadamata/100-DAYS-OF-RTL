`timescale 1ns / 1ps

module comparator_4bit_bh(
  output reg EQ,
  output reg GT,
  output reg LT,
  input [3:0] a,
  input [3:0] b
);

  always @(a or b) begin
    LT <= (a < b);
    EQ <= (a == b);
    GT <= (a > b);
  end
  
endmodule
