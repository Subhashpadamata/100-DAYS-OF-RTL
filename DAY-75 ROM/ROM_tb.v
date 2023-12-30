`timescale 1ns / 1ps

module ROM_tb;
    reg [3:0] addr;
    reg CS;
    wire [15:0] out;
    ROM uut (out,addr,CS);
    integer i;
  
    initial begin
        addr = 4'b0000;
        CS = 0;
        #10;
        for (i = 0; i < 16; i = i + 1) begin
            addr = i;
            #10;
        end
        CS = 1;
        #10 $finish;
    end

endmodule
