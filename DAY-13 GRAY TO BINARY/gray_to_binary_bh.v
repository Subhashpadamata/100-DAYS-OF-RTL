`timescale 1ns / 1ps

module gray_to_binary_bh(
        output reg [3:0] binary,
        input [3:0] gray);
    always@(*)
    begin
        case(gray)
            4'b0000: binary=4'b0000;
            4'b0001: binary=4'b0001;
            4'b0010: binary=4'b0011;
            4'b0011: binary=4'b0010;
            4'b0100: binary=4'b0111;
            4'b0101: binary=4'b0110;
            4'b0110: binary=4'b0100;
            4'b0111: binary=4'b0101;
            4'b1000: binary=4'b1111;
            4'b1001: binary=4'b1110;
            4'b1010: binary=4'b1100;
            4'b1011: binary=4'b1101;
            4'b1100: binary=4'b1000;
            4'b1101: binary=4'b1001;
            4'b1110: binary=4'b1011;
            4'b1111: binary=4'b1010;
        endcase
    end
endmodule
