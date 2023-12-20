`timescale 1ns / 1ps

module car_parking_tb;
  reg clk, rst, car_arrive, car_exit;
  reg [2:0] exit_from;
  reg [7:0] exit_code;
  wire [2:0] parking_slot;
  wire can_park;
  wire [7:0] parking_register;

  car_parking_system uut (clk, rst, car_arrive, car_exit, exit_from, exit_code, parking_slot, can_park, parking_register);

  initial begin
    clk = 0;
    rst = 1;
    car_arrive = 0;
    car_exit = 0;
    exit_from = 0;
    exit_code = 0;
    #10 rst = 0;
    #10 car_arrive = 1;
    #10 car_arrive = 0;
    #10 car_exit = 1;
    #10 exit_from = 2;
    #10 exit_code = 15;
    #10 car_exit = 0;
    #10 exit_from = 1;
    #10 exit_code = 7; 
    #10 exit_from = 0;
    #10 exit_code = 5; 
    #100 $finish; 
  end

  always #5 clk = ~clk;

endmodule
