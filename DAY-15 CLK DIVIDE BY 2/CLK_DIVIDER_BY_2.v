`timescale 1ns / 1ps

module clk_divide_by_2(
    input clk,
    output reg q
    );
    initial q = 1;
    always@(posedge clk)
    begin
    q = ~ q ;
    end
    
endmodule
