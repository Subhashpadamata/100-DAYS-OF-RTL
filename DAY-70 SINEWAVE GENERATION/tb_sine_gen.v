`timescale 1ns / 1ps

module tb_sine_gen;
    reg Clk;
    wire [7:0] data_out;

    sine_wave_gen uut (Clk,data_out);
        initial begin
            Clk = 0;
            $monitor("%d %d",clk,data_out);
        end
        always #5 Clk = ~Clk;
    
endmodule