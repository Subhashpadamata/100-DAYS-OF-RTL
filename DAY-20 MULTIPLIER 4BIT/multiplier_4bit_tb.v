`timescale 1ns / 1ps

module tb_multiplier_4bit;
    reg [3:0]a;
    reg [3:0]b;
    wire [7:0]product;
    multiplier_4bit dut(a,b,product);
    initial begin
        $monitor("a=%b b=%b product=%b",a,b,product);
        #100 $finish;
    end
    always begin
        a=$random;
        b=$random;
        #10;
    end
endmodule
