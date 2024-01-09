module tb_fsm;
    reg clk, reset, bit_in;
    wire out;

    fsm dut (clk,reset,bit_in,out);

    always #5 clk = ~clk;
    
    initial begin
        $monitor("At time %t, input = %b, output = %b", $time, bit_in, out);
        clk = 0; 
        reset = 1; 
        bit_in = 0; #10;
        reset = 0; #10;
        bit_in = 1; #10;
        bit_in = 0; #10;
        bit_in = 1; #10;
        bit_in = 1; #10;
        bit_in = 0; #10;
        bit_in = 1; #10;
        bit_in = 1; #10;
        bit_in = 0; #10;
        bit_in = 1; #10;
        $finish;
    end

endmodule
