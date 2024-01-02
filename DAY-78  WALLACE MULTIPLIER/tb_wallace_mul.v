module tb_wallace_mul;
    reg [3:0] A,B;
    wire [7:0] product;

    wallace_mul uut (A,B,product);
    
    initial  begin
        A = 0;
        B = 0;
        #200 $finish;
     end
     
    always begin
        A = $random;
        B = $random;
        #10;
    end
      
endmodule