`timescale 1ns / 1ps

module tb_ring_oscillator;
    reg en;
    wire w1,w2,w3;

    ring_oscillator uut (en,w1,w2,w3
    );
       always #5en=~en;
    initial begin
        en=1;
        $monitor($time, " w1=%b w2=%b w3=%b", w1,w2,w3);       
        #100 $finish;
    end
endmodule