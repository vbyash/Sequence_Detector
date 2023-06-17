`timescale 1ns / 1ps

module tb_Sequence_Detector_Moore_FSM_Verilog;
  
 reg din;
 reg clk;
 reg rst;
 wire out;

 Seq_Detect uut (.data_in(din), .clock(clk), .reset(rst), .detect(out));

  
 initial begin
   $dumpfile("dump.vcd");
   $dumpvars;
   $monitor($time, , ,"c=%b",clk,,"y=%b",out,,"r=%b",rst,,"d=%b",din);
 clk = 0;
 forever #5 clk = ~clk;
 end 

  
 initial 
   begin
  din = 0;
  rst = 1;
 
  #10 rst = 0;
  #10  din = 1;
  #10  din = 0;
  #10  din = 1; 
  #10  din = 1; 
  #10  din = 0; 
  #10  din = 0;
  #10  din = 0; 
  #10  din = 1; 
  #10  din = 0; 
  #10  din = 1;
  #10  din = 1; 
  #10  din = 0; 
  #10  din = 0;
  #10  din = 1; 
 end
      
  initial
    begin 
      #200;
      $finish;
    end
  
endmodule
