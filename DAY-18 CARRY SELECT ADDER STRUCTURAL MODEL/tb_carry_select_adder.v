`timescale 1ns / 1ps

module tb_carry_select_adder;
    reg [3:0] a;
    reg [3:0] b;
    reg c;
    wire [4:0]sout;
    wire cout;
    carry_sel_adder dut(a,b,c,sout,cout);
        initial begin
            $monitor("a=%b b=%b c=%b sum=%b cout=%b",a,b,c,sout,cout);
            #1000 $finish;
        end
        always begin
            a = $random;
            b = $random;
            c = $random;
            #100;
        end
endmodule
