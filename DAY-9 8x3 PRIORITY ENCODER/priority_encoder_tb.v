`timescale 1ns / 1ps

module priority_encoder_tb;
    wire [2:0]y;
    reg [7:0]i;
    priority_encoder dut(y,i);
    initial begin
    i=8'hfa;
    #100 i=8'h1c;
    #100 i=8'h2b;
    #100 i=8'hc3;   
    #100 i=8'hd6;
    #1000 $finish();
    end
    
endmodule
