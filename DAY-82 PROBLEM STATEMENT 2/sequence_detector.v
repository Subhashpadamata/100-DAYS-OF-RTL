module sequence_detector(
    input w,clk,reset, 
    output z);
    reg [1:0] state, next_state,pstate,nstate;
    reg z1,z2;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        pstate <= 0;
    end
    else begin
        state <= next_state;
        pstate <= nstate;
    end
  end

  always @(state, w) begin
    case (state)
      S0: begin
        z1 <= 0;
        if (w) next_state <= S1;
        else next_state <= S0;
      end
      S1: begin
        z1 <= 0;
        if (w) next_state <= S3;
        else next_state <= S2;
      end
      S2: begin
        z1 <= 1;
        if (w) next_state <= S1;
        else next_state <= S2;
      end
      S3: begin
        z1 <= 1;
        if (w) next_state <= S3;
        else next_state <= S0;
      end
      endcase
      end
      
      always @(pstate, w) begin
        case (pstate)
          S0: begin
            z2 <= 0;
            if (!w) nstate <= S1;
            else nstate <= S0;
          end
          S1: begin
            z2 <= 0;
            if (!w) nstate <= S3;
            else nstate <= S2;
          end
          S2: begin
            z2 <= 1;
            if (!w) nstate <= S1;
            else nstate <= S2;
          end
          S3: begin
            z2 <= 1;
            if (!w) nstate <= S3;
            else nstate <= S0;
          end
        endcase
  end
    assign z = z1 ^ z2;
endmodule
