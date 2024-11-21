`timescale 1ns / 1ps

module sipo_bh(
    output reg [3:0] q,
    output reg [3:0]qbar,
    input din,clk,rst
    );

    always@(posedge clk) begin
        if(rst==1) begin
        q<= 1'b0;
        qbar<= 1'b1; 
        end
        
        else begin
            q[0]<= din;
            q[1]<= q[0];
            q[2]<= q[1];
            q[3]<= q[2];
            qbar<= ~q;
        end
    end

endmodule