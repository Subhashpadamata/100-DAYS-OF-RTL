module tb_SIPO;
    reg clk;
    reg reset;
    reg data_in;
    wire [7:0] data_out;

    SIPO dut (clk,reset,data_in,data_out);

    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        data_in = 0;
        #10 reset = 0;
        #10 data_in = 1;
        #10 data_in = 0;
        #80 $finish;
    end
endmodule
