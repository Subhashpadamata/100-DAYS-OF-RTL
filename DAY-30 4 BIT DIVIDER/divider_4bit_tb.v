`timescale 1ns / 1ps

module divider_4bit_tb;
    wire [3:0]quotient;
    wire  [3:0]remainder;
    reg [3:0]dividend;
    reg [3:0]divisor;
    divider_4bit dut(quotient,remainder,dividend,divisor);
    initial begin
        $monitor("quotient=%b remainder=%b dividend=%b divisor=%b",quotient,remainder,dividend,divisor);
        #1000 $finish;
    end
    always begin
     dividend = $random;
     divisor = $random;
     #100;
    end
    
endmodule
