module tb_sequence_detector;
  reg w, clk, reset;
  wire z;

  sequence_detector u1 (w,clk,reset,z);
    always #5 clk = ~clk;
  initial begin
    reset = 1; w = 0; clk = 0;
    #5 reset = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 1;
    #10 w = 1;
    #10 w = 0;
    #10 w = 0;
    #10 w = 0;
    #10 w = 1;
    #10 w = 0;
    
    end
    endmodule