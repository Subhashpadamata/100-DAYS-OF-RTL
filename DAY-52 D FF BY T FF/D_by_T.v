`timescale 1ns / 1ps
module D_by_T(

    input  clk, rstn, d, 
    output q, qbar
    );
    wire t;
    assign t = (q ^ d);
    tff ff_1(clk, rstn, t, q, qbar);
endmodule

module tff ( input clk, input rstn, input t, output reg q, output reg qbar);  
  
  always @ (posedge clk) begin  
    if (!rstn)  
    begin
      q <= 0; 
      qbar <= 1; 
    end
    else  
    begin
        if (t)
        begin  
            q <= ~q;  
            qbar <= q;
        end
        else  
        begin
            q <= q;  
            qbar <= ~q;
        end
    end
  end  
  
endmodule                   

