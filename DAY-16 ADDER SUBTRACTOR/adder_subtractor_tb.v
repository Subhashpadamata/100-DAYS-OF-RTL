module adder_subtractor_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg sel;
    wire [3:0] dout;
    wire carry_barrow;

    adder_subtractor dut(a, b, sel,dout,carry_barrow);
    initial begin
        a = 4'b1111;
        b = 4'b1111;
        sel = 1'b1;
        #20;
        a = 4'b1011;
        b = 4'b1100;
        sel = 1'b1;
        #20;
        a = 4'b0101;
        b = 4'b1011;
        sel = 1'b1;
        #20;
        a = 4'b1010;
        b = 4'b0101;
        sel = 1'b0;
        #20;
        a = 4'b1111;
        b = 4'b1000;
        sel = 1'b0;
        #20;
        a = 4'b1010;
        b = 4'b1101;
        sel = 1'b0;
        #20;
        $finish;
    end
endmodule
