
module ripple_carry_adder_tb;
    wire [3:0] s;
    wire cout;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    ripple_carry_adder dut(.sum(s), .cout(cout), .a(a), .b(b), .cin(cin));

    initial begin
       	a = 4'b0000;b = 4'b0000;cin=0;
		#100; a = 4'b0101;b = 4'b1010;cin=0;
		#100; a = 4'b1100;b = 4'b1010;cin=0;
	    #100; a = 4'b0011;b = 4'b0111;cin=1;
   #400 $finish;
        end
endmodule