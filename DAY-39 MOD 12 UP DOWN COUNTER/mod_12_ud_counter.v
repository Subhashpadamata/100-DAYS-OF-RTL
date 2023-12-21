module mod_12_ud_counter(
  output reg [3:0] q,
  input mod, clk, rst
);

  always @(posedge clk) begin
    if (rst) begin
      q <= 4'b0000;
    end
    else begin
      if (mod) begin //mod=1 for up counter
        if (q == 4'b1011) begin
          q <= 4'b0000;
        end
        else begin
          q <= q + 1;
        end
      end
      else begin
       if (q == 4'b0000) begin
          q <= 4'b1011;
       end
       else begin
          q <= q - 1;
       end
       end
    end
  end
endmodule
