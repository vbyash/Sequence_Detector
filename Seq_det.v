`timescale 1ns/1ps
module Seq_Detect(data_in, clock, reset, detect);
  input clock;
  input reset;
  input wire data_in;
  output reg detect;
  
  reg[2:0] current_state, next_state;
  parameter 
          S0= 3'b000,
          S1= 3'b001,
          S2= 3'b010,
          S3= 3'b011,  
          S4= 3'b100,
          S5= 3'b101,
          S6= 3'b110;
  
  // Combinational logic for next state
  
  always @(current_state,data_in)
    begin
      case(current_state)
          S0:begin
              if(data_in)
                next_state=S1;
              else
                next_state=S0;
            end
        
         S1:begin
              if(data_in)
                next_state=S1;
              else
                next_state=S2;
            end
        
         S2:begin
              if(data_in)
                next_state=S3;
              else
                next_state=S0;
            end
        
         S3:begin
              if(data_in)
                next_state=S4;
              else
                next_state=S2;
            end
        
         S4:begin
              if(data_in)
                next_state=S1;
              else
                next_state=S5;
            end
        
         S5:begin
              if(data_in)
                next_state=S3;
              else
                next_state=S6;
            end
        
         S6:begin
              if(data_in)
                next_state=S1;
              else
                next_state=S0;
            end
        
        default: next_state=S0;

      endcase
      
      
    end
  
  
  //Sequential logic for current state
  always @(posedge clock)
    begin
      if(reset)
        current_state<=S0;
      else
        current_state<=next_state;
    end
  
  //Output logic
  
  always @(current_state)
    begin 
      case(current_state)
        S0: detect=1'b0;
        S1: detect=1'b0;
        S2: detect=1'b0;
        S3: detect=1'b0;
        S4: detect=1'b0;
        S5: detect=1'b0;
        S6: detect=1'b1;
        
        default: detect=1'b0;
        
      endcase
    end
endmodule
  
