`timescale 1ns / 1ps

module tb_dadda_mul;
    reg [7:0] A,B;
    wire [15:0] y;

dadda_mul dut(A,B,y);
    
    initial  begin
        $monitor("%d %d %d",A,B,y);
        A = 0;
        B = 0;
        #200 $finish;
     end
     
    always begin
        A = $random;
        B = $random;
        #10;
    end
      
endmodule