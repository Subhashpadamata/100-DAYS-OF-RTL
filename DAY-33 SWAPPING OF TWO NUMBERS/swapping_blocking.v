`timescale 1ns / 1ps

module tb_swapping_blocking;
    reg [3:0] a = 4'b110;
    reg [3:0] b = 4'b1010;
    reg [3:0] temp;

    initial begin
        $display("swapping using non blocking assignment");
        $display("Initial value of a = %b", a);
        $display("Initial value of b = %b", b);
        #1;
        temp = a;
        a = b;
        b = temp;

        $display("After swap using blocking assignments, value of a = %b", a);
        $display("After swap using blocking assignments, value of b = %b", b);

        $finish;
    end
endmodule
