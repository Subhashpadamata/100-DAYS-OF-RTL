`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 22:33:53
// Design Name: 
// Module Name: crc_serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module crc_serial(clk,rst,load,d_finish,crc_in,crc_out

    );
    input clk; //Clk signal
input rst; //Reset signal
input load; //Start encoding the signal
input d_finish; //Encode the end signal
input crc_in; //The word input to be encoded
output  reg crc_out; //Code word output after encoding

reg [15:0] mem; //Linear shift staging, 16bits 
reg [1:0] state; //State staging, 2bit 
reg [4:0] count; //Count staging, 5bit 
parameter idle = 2'b00; //Wait state
parameter compute = 2'b01;//calculated status
parameter finish = 2'b10; //Calculate the end state
always@ (posedge clk) //executed each time the clk is triggered for a positive edge
begin // can be seen as the upper parenthesis in the c language, and end can be seen as the lower parenthesis
    case (state) // Select case in state 
         idle: begin // is the wait state
             if (load) //load signal enters the compute state effectively
             state <= compute; 
             else
             state <= idle; 
             end
         compute:begin //d_finish signal enters the finish state effectively
             if(d_finish) 
             state <= finish; 
             else
             state <= compute; 
             end
         finish: begin // Determines whether the data in the 16 stagings is fully output
             if(count==16) 
             state <= idle; 
             else
             count <= count+1; 
             end
         default:state<=idle;
    endcase
    end 
    always@ (posedge clk or negedge rst)//whenever the clk positive trigger or rst negative edge trigger is executed
     if(!rst) 
         begin 
         //mem the initial value < pre-installed b0000_0000_0000_0000 15:0, 15:0, 16'
         count <= 5'b0_0000; 
         state <= idle; 
         end
     else
     case(state) 
     idle:begin
     mem[15:0] <= 16'b0000_0000_0000_0000; 
     end
     compute:begin 
     //Produces a polynomial x^16+x^15+x^2+1 
     mem[0] <= mem[15] ^ crc_in; 
     mem[1] <= mem[0]; 
     mem[2] <= mem[1] ^ mem[15] ^ crc_in; 
     mem[14:3] <= mem[13:2]; 
     mem[15] <= mem[14] ^ mem[15] ^ crc_in; 
     crc_out <= crc_in; // The input is the output
     end 
     finish:begin 
     crc_out <= mem[15]; // Stager 15 as output
     mem[15:0] <= {mem[14:0],1'b0}; // Shift.
     end 
     endcase 
endmodule
