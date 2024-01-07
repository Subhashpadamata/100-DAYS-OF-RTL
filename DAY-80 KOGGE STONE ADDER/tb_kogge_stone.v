`timescale 1ns / 1ps

module tb_kogge_stone;
  reg [3:0] a, b;
  reg cin;
  wire [4:0] sum_out;

  kogge_stone dut (a,b,cin,sum_out);

  initial begin
    $monitor("Time=%0t, A=%b, B=%b, Cin=%b, Sum_out=%b", $time, a, b, cin, sum_out);
        cin = 0;
    #100 $finish;
  end
  always begin
    a = $random;
    b = $random;
    #10;
  end
  
endmodule
