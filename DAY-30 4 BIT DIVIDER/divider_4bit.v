`timescale 1ns / 1ps

module divider_4bit(
    output reg [3:0] quotient,
    output reg [3:0] remainder,
    input [3:0] dividend,
    input [3:0] divisor
);
    
always @ (dividend, divisor) begin
    quotient = 0;
    remainder = dividend;
    for (integer i = 0; i < 16; i = i + 1) begin
        if (remainder >= divisor) begin
            remainder = remainder - divisor;
            quotient = quotient + 1;
        end
    end
end

endmodule
