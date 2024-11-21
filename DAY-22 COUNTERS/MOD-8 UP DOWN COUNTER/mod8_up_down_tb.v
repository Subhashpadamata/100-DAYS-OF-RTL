`timescale 1ns / 1ps

module mod8_up_down_tb;
	wire [2:0] q;
	reg mod;
	reg clk;
	reg rst;
	
	mod8_up_down dut (q,mod, clk, rst);  
	initial begin
		clk = 0;
		rst = 1;
		mod = 0;
		#20 rst = 0;
		#500 $finish();
	end
	always #180 mod = ~mod;
	always #10 clk = ~clk;
endmodule

