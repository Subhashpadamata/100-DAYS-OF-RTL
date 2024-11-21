`timescale 1ns / 1ps

module jk_by_D(
    output q, qbar,
    input j, k, rst_n, clk
    );

    wire d;
    d_ff ff1(.q(q), .qb(qbar), .d(d), .rst_n(rst_n), .clk(clk)); // Use d_ff module
    
    assign d = (j & qbar) | (~k & q);
    
endmodule

module d_ff(
    output reg q,
    output reg qb,
    input d,
    input rst_n,
    input clk
    );

    always @(posedge clk or negedge rst_n)
        if (!rst_n)
        begin
            q <= 0;
            qb <= 1;
        end
        else
        begin
            q <= d;
            qb <= ~d;
        end
        
    initial begin 
        q = 0;
        qb = 1;
    end
endmodule
