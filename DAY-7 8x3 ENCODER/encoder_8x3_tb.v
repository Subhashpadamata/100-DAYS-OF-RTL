`timescale 1ns / 1ps

module encoder_8x3_tb;
    wire [2:0]y;
    reg [7:0]i;
    encoder_8x3 dut(y,i);
    initial begin
    i=8'hfa;
    #100 i=8'hac;
    #100 i=8'h1b;
    #100 i=8'h03;   
    #100 i=8'h26;
    #100 $finish();
    end
    
endmodule
