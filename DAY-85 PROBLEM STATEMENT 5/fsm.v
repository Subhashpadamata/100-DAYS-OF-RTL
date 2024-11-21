module fsm (
    input clk, reset, bit_in,
    output reg out
);

    parameter S0 = 2'b00, 
            S1 = 2'b01, 
            S2 = 2'b10, 
            S3 = 2'b11, 
            S4 = 2'b00;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) 
    begin
        if (reset) 
            state <= S0;
        else 
            state <= next_state;
    end

    always @(state, bit_in) begin
        case (state)
            S0: next_state = bit_in ? S1 : S0;
            S1: next_state = bit_in ? S2 : S0;
            S2: next_state = bit_in ? S3 : S1;
            S3: next_state = bit_in ? S4 : S2;
            S4: next_state = bit_in ? S0 : S3;
            default: next_state = S0;
        endcase
    end

    always @(state) begin
        case (state)
            S1, S2: out = 1'b1;
            default: out = 1'b0;
        endcase
    end

endmodule
