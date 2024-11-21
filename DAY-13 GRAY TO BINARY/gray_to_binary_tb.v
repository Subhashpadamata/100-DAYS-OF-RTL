
module gray_to_binary_tb;
    wire [3:0] binary;
    reg [3:0] gray;
    integer i;
    gray_to_binary uut ( .binary(binary), .gray(gray));
    
    initial begin

        for ( i = 0; i < 16; i = i + 1) begin
            gray = i;
            #10;
        end
        
        #10;
        $finish;
    end
      
endmodule
