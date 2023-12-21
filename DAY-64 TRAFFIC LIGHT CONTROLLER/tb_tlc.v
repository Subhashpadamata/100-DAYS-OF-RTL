module tb_tlc();
  reg clk,rst;
  wire [1:0] state;
  wire red,yellow,green;
  
  traffic_light_controller dut(clk,rst,state,red,yellow,green);
  
  always #5 clk=~clk;

  initial begin
    clk=0;
    rst=1;
    #20 rst=0;
    #200 $finish;
  end
endmodule
    