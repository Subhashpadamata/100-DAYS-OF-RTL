`timescale 1ns / 1ps

module mux_8x1_tb;

    wire y;
    reg [7:0]i;
    reg [2:0]s;
    mux8x1_4x1 dut(y,i,s);
    initial
    begin
        i=8'b00000000;
        s[0]=0;
        s[1]=0;
        s[2]=0;
         #100 i=8'h10;
          #200 i=8'h1a;
          #500 i=8'h0f;
          
        #1500 $finish();
    end
    
    always #100 s[0]=~s[0];
    always #200 s[1]=~s[1];
    always #400 s[2]=~s[2];

endmodule
