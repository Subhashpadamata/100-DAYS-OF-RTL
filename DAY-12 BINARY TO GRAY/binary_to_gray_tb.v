`timescale 1ns / 1ps

module binary_to_gray_tb;
  wire [3:0] gray;
  reg [3:0] binary;
  binary_to_gray uut(gray, binary);

  initial begin
    binary = 0;
    #10 binary[0] = ~binary[0];
    #20 binary[1] = ~binary[1];
    #40 binary[2] = ~binary[2];
    #80 binary[3] = ~binary[3];
    #200 $finish;
  end

endmodule
