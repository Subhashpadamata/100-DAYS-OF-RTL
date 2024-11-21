`timescale 1ns / 1ps

module gray_to_binary(    input [3:0] gray,
    output [3:0] binary
);
    
        assign binary[3]= gray[3];
        assign binary[2]= gray[2]^binary[3];
        assign binary[1]= gray[1]^binary[2];
        assign binary[0]= gray[0]^binary[1];

endmodule
