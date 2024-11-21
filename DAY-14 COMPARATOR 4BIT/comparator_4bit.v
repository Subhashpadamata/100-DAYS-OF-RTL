`timescale 1ns / 1ps

module comparator_4bit_st(
  output  EQ,
  output  GT,
  output  LT,
  input [3:0] a,
  input [3:0] b
    );

  wire [3:0] A_xor_B;
  wire [3:0] A_and_B;
  wire [2:0] MSB;
  
  assign A_xor_B = a ^ b;
  assign A_and_B = a & b;
  assign MSB = A_xor_B[3:1] | A_and_B[3:1];
  
  assign EQ = (a == b);
  assign GT = (MSB & A_xor_B[0]) | (A_and_B[3] & !A_and_B[2]) | (A_and_B[3] & !A_and_B[1]) | (A_and_B[3] & !A_and_B[0]);
  assign LT = (MSB & !A_xor_B[0]) | (!A_and_B[3] & A_and_B[2]) | (!A_and_B[3] & A_and_B[1]) | (!A_and_B[3] & A_and_B[0]);
  
endmodule
