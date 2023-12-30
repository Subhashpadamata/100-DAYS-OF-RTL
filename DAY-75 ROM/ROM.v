module ROM(out, addr, CS);
    output[15:0] out;
    input[3:0] addr;
    input CS;
    reg [15:0] out;
    reg [15:0] ROM[15:0];
    always @(negedge CS)
    begin
        ROM[0]=16'd0501; 
        ROM[1]=16'd3401;
        ROM[2]=16'd0801; 
        ROM[3]=16'd0121;
        ROM[4]=16'd0511; 
        ROM[5]=16'd0215;
        ROM[6]=16'd5501; 
        ROM[7]=16'd5400;
        ROM[8]=16'd4801; 
        ROM[9]=16'd3800;
        ROM[10]=16'd3001; 
        ROM[11]=16'd2401;
        ROM[12]=16'd1301; 
        ROM[13]=16'd1600;
        ROM[14]=16'd3601; 
        ROM[15]=16'd3401;
        out=ROM[addr];
    end
endmodule