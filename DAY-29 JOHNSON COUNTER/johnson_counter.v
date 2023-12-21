`timescale 1ns / 1ps

module johnson_counter(
    output reg [3:0] q,
    input clk,rst
    );
	 
    always@(posedge clk)
    begin    
        if(rst==1)
        begin
        q<=4'b0000; 
        end   
        else
         begin
            q <= {~q[0],q[3:1]};
        end
    end

endmodule