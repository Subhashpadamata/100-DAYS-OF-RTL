`timescale 1ns / 1ps

module tb_Fixed_Priority_Arbiter;
  parameter NumRequests = 4;
  reg [NumRequests-1:0] request;
  wire [NumRequests-1:0] grant;

  Fixed_Priority_Arbiter uut (request,grant);
  
  initial begin
    request = 4'b0000;
    $monitor("Time=%0t request=%b grant=%b",$time,request,grant);
    #200 $finish;
  end
    always #20 request = $random;
endmodule

