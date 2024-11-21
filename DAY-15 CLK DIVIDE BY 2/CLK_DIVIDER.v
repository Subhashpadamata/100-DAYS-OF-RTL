`timescale 1ns / 1ps

module clock_divider(

        input clk,rst,
        output reg divideby2,divideby4,divideby8,divideby16,divideby32
        );
    reg [4:0]d;
    
    initial d=0;
    
        always@(posedge clk or posedge rst)
        begin
        if(rst)
        begin
        d=0;
        divideby2=0;
        divideby4=0;
        divideby8=0; 
        divideby16=0;
        divideby32=0;
     end
        else
        begin
        d=d+5'b00001;
        divideby2=d[0];
        divideby4=d[1];
        divideby8=d[2]; 
        divideby16=d[3];
        divideby32=d[4];
     end
    end
endmodule
