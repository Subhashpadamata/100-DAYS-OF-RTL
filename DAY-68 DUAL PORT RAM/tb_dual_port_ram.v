`timescale 1ns / 1ps

module tb_dual_port_ram;
  reg [7:0] data_1, data_2; 
  reg [5:0] addr_1, addr_2; 
  reg we_1, we_2,clk;
  wire [7:0] q_1, q_2; 
  
  dual_port_ram dut(data_1,data_2,addr_1,addr_2,we_1,we_2,clk,q_1,q_2);
  
  initial
    begin
      clk = 1'b1;
      data_1 = 8'h42;
      addr_1 = 6'h01;
      data_2 = 8'h55;
      addr_2 = 6'h02;
      we_1 = 1'b1;
      we_2 = 1'b1;
      #10;      
      data_1 = 8'h57;
      addr_1 = 6'h03;
      addr_2 = 6'h01;
      we_2 = 1'b0;
      #10;        
      addr_1 = 6'h02;
      addr_2 = 6'h03;
      we_1 = 1'b0;
      #10;     
      addr_1 = 6'h01;
      data_2 = 8'h25;
      addr_2 = 6'h02;
      we_2 = 1'b1;      
      #10; $finish;
    end
    
    always #5 clk = ~clk;
endmodule