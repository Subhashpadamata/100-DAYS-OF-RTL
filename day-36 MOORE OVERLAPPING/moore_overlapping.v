`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2023 23:33:27
// Design Name: 
// Module Name: moore_overlapping
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module moore_overlapping(
    input din, clk, reset,
    output reg dout
);

reg [2:0] current_state, next_state;

parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;

always @(posedge clk) begin
    if (reset == 1) begin
        current_state <= s0;
    end else begin
        current_state <= next_state;
    end
end

always @(din or current_state) begin
    case (current_state)
        s0: dout <= 1'b0;
            if (din == 1) begin
            next_state = s1;
             end
            else begin
            next_state = current_state;
            end
            
        s1: dout <= 1'b0;
            if (din == 0) begin
            next_state = s2;
            end
            else begin
            next_state = current_state;
            end	 
             
        s2: dout <= 1'b0;
            if (din == 0) begin
            next_state = s3;
            end
            else begin
            next_state = s1;
            end
        
        s3: dout <= 1'b0;
            if (din == 1) begin
            next_state = s4;
            end
            else begin
            next_state = s0;
            end
             
        s4: dout <= 1'b1;
            if (din == 1) begin
            next_state = s1;
             end
            else begin
            next_state = s2;
            end	 
             
        default: next_state = s0;
    endcase
end

endmodule 
