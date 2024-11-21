`timescale 1ns / 1ps

module tb_async_fifo;
    
    reg wr_en,rd_en,w_clk,w_rst,rd_clk,rd_rst;
    reg [7:0]data_in;
    wire [7:0]data_out;
    wire fifo_full,fifo_empty;
    async_fifo dut(wr_en,rd_en,w_clk,w_rst,data_in,data_out,fifo_full,fifo_empty,rd_clk,rd_rst);
    initial 
    begin
     w_clk=0;
     rd_clk=0;
    end
    always
    begin
     #5 w_clk=~w_clk;
     rd_clk=~rd_clk;
     end
     initial 
     begin
      w_rst=1;rd_rst=1;
      #10 w_rst=0;
      rd_rst=0;
      wr_en=1;
      data_in=8'b00000001;
      #10 data_in=8'b00000010;
      #10 data_in=8'b00000100;
      #10 data_in=8'b00001000;
      #340 data_in=8'b11111111;
      #10 rd_en=1;
      #350  $finish;
     end
endmodule
