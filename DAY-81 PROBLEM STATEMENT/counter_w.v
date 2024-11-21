`timescale 1ns / 1ps

module counter_w(
    input clk,w,reset,
    output reg [3:0]out
    );
    
always @(posedge clk) begin
    if (reset) begin
      out <= 4'b0000;
    end
    else begin
      if (w) begin 
        if (out == 4'b1111 | out == 4'b1000) begin
          out <= 4'b0000;
        end
        else if(out == 4'b1000) begin
          out <= 4'b0001;
        end
        else begin
          out <= out + 4'b0010;
        end
      end
      else begin
       if (out == 4'b0000) begin
          out <= 4'b1111;
       end
       else begin
          out <= out - 1;
       end
       end
    end
  end
endmodule