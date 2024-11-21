module mux_2x1(
    input a, b, sel, 
    output y);
    assign y = (a & ~sel) | (b & sel);
endmodule

module and_using_mux(
    input a, b, 
    output y);
    mux_2x1 m1(1'b0,b,a,y);
endmodule
