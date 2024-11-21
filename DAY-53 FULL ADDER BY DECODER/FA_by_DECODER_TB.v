`timescale 1ns / 1ps

module FA_by_DECODER_TB;
    reg A,B,Cin;
    wire sum,carry;
    
    FA_by_DECODER fa1(sum,carry,A,B,Cin);
    
    initial begin
        $monitor("A=%b B=%b Cin=%b sum=%b carry=%b",A,B,Cin,sum,carry);
        A=0; B=0; Cin=0;
        #60 $finish;
    end
    always #5 A= ~A;
    always #10 B= ~B;
    always #20 Cin = ~Cin;
endmodule

