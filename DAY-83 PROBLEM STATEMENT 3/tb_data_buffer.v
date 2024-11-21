`timescale 1ns / 1ps

module tb_Data_buffer;
    parameter cycles = 8;
    parameter size = 16;
    
    reg clock;
    reg data_start;
    reg [size-1:0] data;
    //wire [size-1:0] buffer;

    data_buffer uut (data_start,data,clock);

    initial begin
        clock = 0;
//        $monitor("Time=%0t: Buffer=%h", $time, buffer);
        data_start = 0;
        data = 0;
         data_start = 1;
         #100 $finish;
        end
        
    always #5 data = $random;
    always #5 clock = ~clock;
    
endmodule