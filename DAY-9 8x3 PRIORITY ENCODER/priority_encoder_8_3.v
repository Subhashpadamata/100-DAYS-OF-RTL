`timescale 1ns / 1ps

module priority_encoder(
    output reg [2:0] y,
    input [7:0] i
    );
    always@(*)
        begin
            if(i[0]==1) begin
            y=3'b000; end
            else if(i[1]==1) begin
            y=3'b001; end
            else if(i[2]==1) begin
            y=3'b010; end
            else if(i[3]==1) begin
            y=3'b011; end
            else if(i[4]==1) begin
            y=3'b100; end
            else if(i[5]==1) begin
            y=3'b101; end
            else if(i[6]==1) begin
            y=3'b110; end
            else if(i[7]==1) begin
            y=3'b111; end
        end
endmodule
